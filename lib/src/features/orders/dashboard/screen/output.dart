import 'package:flutter/material.dart';
import 'package:order_tracker/src/features/orders/services/orders.dart';
import 'package:order_tracker/src/models/hive/orders/orders.dart';

class OutputDetail extends StatefulWidget {
  OutputDetail({super.key, required this.orderDetail});
  final Order orderDetail;

  @override
  State<OutputDetail> createState() => _OutputDetailState();
}

class _OutputDetailState extends State<OutputDetail> {
  final Future<OrderService> service = OrderService.getObject();
  late Order order = widget.orderDetail;

  @override
  void initState() {
    super.initState();
    test();
  }

  Future<void> test() async {
    Order tempOrder = (await (await service).getOrder(widget.orderDetail.id))!;
    setState(() {
      order = tempOrder;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        order.productions.isNotEmpty
            ? Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: order.productions.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                        height: 80,
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                // color: Colors.greenAccent[200],
                                offset: Offset(
                                  0.5,
                                  0.5,
                                ),
                                blurRadius: 3.0,
                                spreadRadius: 1.0,
                              ), //BoxShadow
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ), //BoxShadow
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(order.productions[index].timeStamp
                                    .toString()
                                    .split(" ")[0]),
                                Tooltip(
                                    message: order
                                        .productions[index].step.description,
                                    child: Text(order.productions[index].step
                                        .toString())),
                                Text(
                                  order.productions[index].totalBundles(),
                                ),
                              ],
                            ),
                          ), //BoxDecoration
                        ));
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                ),
              )
            : Expanded(
                child: Center(
                  child: Text("No production records available"),
                ),
              ),
      ],
    );
  }
}
