import 'package:flutter/material.dart';

import 'package:order_tracker/src/widgets/loader.dart';
import 'package:order_tracker/src/widgets/order_list_item.dart';
import '../../../../models/hive/orders/orders.dart';
import '../../../../utils/constants.dart';
import '../../services/orders.dart';

class OrdersList extends StatefulWidget {
  const OrdersList({super.key, required this.title});

  final String title;

  @override
  State<OrdersList> createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
  List<Order> jsonData = [];
  bool isLoading = true;

  final Future<OrderService> service = OrderService.getObject();

  @override
  void initState() {
    super.initState();
    _getAllOrders();
  }

  void setLoadingIfNeeded() {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
    }
  }

  void _clearCache() async {
    setLoadingIfNeeded();
    await (await service).clearAll();
    setState(() {
      jsonData = [];
      isLoading = false;
    });
  }

  Future<bool> _getAllOrders() async {
    setLoadingIfNeeded();
    var ordersData = (await (await service).getOrders()).toList();
    setState(() {
      jsonData = ordersData;
      isLoading = false;
    });
    return true;
  }

  void _addTestData() async {
    setLoadingIfNeeded();
    await (await service).addOrder(sampleOrderData("-"));
    await _getAllOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 0),
            child: IconButton(
                tooltip: 'Clear All Orders',
                onPressed: _clearCache,
                icon: const Icon(Icons.clear_all)),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
                tooltip: 'Add Sample Order',
                onPressed: _addTestData,
                icon: const Icon(Icons.add_business_outlined)),
          )
        ],
        title: Text(widget.title),
      ),
      body: Center(
        child: isLoading
            ? const Loader()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  jsonData.isNotEmpty
                      ? Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.all(8),
                            itemCount: jsonData.length,
                            itemBuilder: (BuildContext context, int index) {
                              return OrderListItem(
                                item: jsonData[index],
                                onDelete: (orderId) async {
                                  await (await service).removeOrder(orderId);
                                  await _getAllOrders();
                                },
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(),
                          ),
                        )
                      : const Center(
                          child: Text("No Orders Available"),
                        ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, "/order/detail/form",
            arguments: {"orderService": service}),
        tooltip: 'Add Create',
        child: const Icon(Icons.add),
      ),
    );
  }
}
