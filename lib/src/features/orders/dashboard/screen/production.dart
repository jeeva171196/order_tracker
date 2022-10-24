import 'package:flutter/material.dart';
import 'package:order_tracker/src/models/hive/orders/orders.dart';
import 'package:order_tracker/src/widgets/modal.dart';

class ProductionDetail extends StatelessWidget {
  const ProductionDetail({super.key, required this.orderDetail});
  final Order orderDetail;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return SizedBox(height: 70, child: Center(child: Text(orderDetail.name)));
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text("Name"),
                  Text("${orderDetail.name}"),
                ],
              ),
              Column(
                children: [
                  Text("Bundles"),
                  Text("${orderDetail.numOfBundles}"),
                ],
              ),
              Column(
                children: [
                  Text("Steps"),
                  Text("${orderDetail.numOfSteps}"),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: 1,
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
                            Text(DateTime.now().toString().split(" ")[0]),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => Modal(),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text('Steps'),
                                  Text("1,2,3"),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('Bundles'),
                                Text("1,2,3"),
                              ],
                            )
                          ]),
                    ), //BoxDecoration
                  ));
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        )
      ],
    );
  }
}
