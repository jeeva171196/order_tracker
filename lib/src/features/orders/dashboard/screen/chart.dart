import 'package:flutter/material.dart';
import 'package:order_tracker/src/features/orders/services/orders.dart';
import 'package:order_tracker/src/models/hive/orders/orders.dart';

class ProductionDetailChart extends StatefulWidget {
  const ProductionDetailChart({super.key, required this.orderDetail});
  final Order orderDetail;

  @override
  State<ProductionDetailChart> createState() => _ProductionDetailChartState();
}

class _ProductionDetailChartState extends State<ProductionDetailChart> {
  final Future<OrderService> service = OrderService.getObject();
  late Order order = widget.orderDetail;
  late Map<int, int> chartData;
  @override
  void initState() {
    super.initState();
    test();
  }

  Future<void> test() async {
    Order tempOrder = (await (await service).getOrder(widget.orderDetail.id))!;
    setState(() {
      order = tempOrder;
      chartData = tempOrder.totalBundlesCompleted();
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(chartData);
    print(order.toMap());
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: order.steps.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  Text(order.steps[index].toString()),
                  Expanded(
                    flex: chartData[order.steps[index].stepId]!,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: chartData[order.steps[index].stepId]! != 0
                          ? Container(
                              color: Colors.green[400],
                              height: 35,
                              child: Center(
                                  child: Text(
                                      "${chartData[order.steps[index].stepId]!}")),
                            )
                          : Container(
                              color: Colors.green[400],
                              height: 35,
                            ),
                    ),
                  ),
                  Expanded(
                    flex: order.numOfBundles -
                        chartData[order.steps[index].stepId]!,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: order.numOfBundles -
                                  chartData[order.steps[index].stepId]! !=
                              0
                          ? Container(
                              color: Colors.red[400],
                              height: 35,
                              child: Center(
                                  child: Text(
                                      "${order.numOfBundles - chartData[order.steps[index].stepId]!}")),
                            )
                          : Container(
                              color: Colors.red[400],
                              height: 35,
                            ),
                    ),
                  ),
                  //   ]
                  // : Expanded(
                  //     child: Center(
                  //       child: Text("No production records available"),
                  //     ),
                  //   ),
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        )
      ],
    );
  }
}
