import 'package:flutter/material.dart';
import 'package:order_tracker/src/models/hive/orders/orders.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem({super.key, required this.item, required this.onDelete});
  final Order item;
  final Function(String orderId) onDelete;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 70,
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
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Text(item.name, textAlign: TextAlign.center),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                                child: Text('Bundles: ${item.numOfBundles}',
                                    textAlign: TextAlign.center)),
                            Expanded(
                                child: Text('Steps: ${item.numOfSteps}',
                                    textAlign: TextAlign.center)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Chip(
                //   label: const Text('Not Started'),
                //   backgroundColor: Colors.red[200],
                // ),
                // Chip(
                //   label: const Text('In Progress'),
                //   backgroundColor: Colors.blue[200],
                // ),

                Expanded(
                  child: Row(
                    children: <Widget>[
                      Column(
                        children: [
                          const Text("Status", textAlign: TextAlign.center),
                          Expanded(
                            child: Chip(
                              label: const Text('Done'),
                              backgroundColor: Colors.green[200],
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/detail",
                                arguments: item);
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.green,
                            size: 30.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            onDelete(item.name);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.green,
                            size: 30.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ), //BoxDecoration
        ));
  }
}
