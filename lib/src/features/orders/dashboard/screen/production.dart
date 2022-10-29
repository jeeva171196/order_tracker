import 'package:flutter/material.dart';
import 'package:order_tracker/src/models/hive/orders/orders.dart';
import 'package:order_tracker/src/utils/product_row_type.dart';
import 'package:order_tracker/src/widgets/modal.dart';

class ProductionDetail extends StatefulWidget {
  const ProductionDetail({super.key, required this.orderDetail});
  final Order orderDetail;

  @override
  State<ProductionDetail> createState() => _ProductionDetailState();
}

class _ProductionDetailState extends State<ProductionDetail> {
  List<ProductRow> rows = [];
  late Order orderData;
  late int productionId;

  @override
  void initState() {
    super.initState();

    List<ProductRow> temp = [];

    for (var row in widget.orderDetail.productions) {
      temp.add(ProductRow(id: row.productionId, orderData: widget.orderDetail));
    }

    setState(() {
      rows = temp;
      orderData = widget.orderDetail;
      productionId = widget.orderDetail.productions.length;
    });
  }

  void onStepChange(Map<int, bool> values, int productionId) {
    List<ProductRow> t = rows;
    ProductRow row = rows[productionId];
    row.stepMap = values;
    row.updateStepLabel();
    rows[productionId] = row;

    setState(() {
      rows = t;
    });
  }

  void onBundleChange(Map<int, bool> values, int productionId) {
    List<ProductRow> t = rows;
    ProductRow row = rows[productionId];
    row.bundleMap = values;
    row.updateBundleLabel();
    rows[productionId] = row;

    setState(() {
      rows = t;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  Text("${orderData.name}"),
                ],
              ),
              Column(
                children: [
                  Text("Bundles"),
                  Text("${orderData.numOfBundles}"),
                ],
              ),
              Column(
                children: [
                  Text("Steps"),
                  Text("${orderData.numOfSteps}"),
                ],
              )
            ],
          ),
        ),
        rows.isNotEmpty
            ? Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: rows.length,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(DateTime.now().toString().split(" ")[0]),
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (_) => CheckboxListDialog(
                                            title: "Step",
                                            values: rows[index].stepMap,
                                            onChanged: (Map<int, bool> values) {
                                              onStepChange(values, index);
                                            }),
                                      );
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Steps'),
                                        Text(rows[index].stepLabel),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (_) => CheckboxListDialog(
                                            title: "Bundle",
                                            values: rows[index].bundleMap,
                                            onChanged: (Map<int, bool> values) {
                                              onBundleChange(values, index);
                                            }),
                                      );
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Bundles'),
                                        Text(rows[index].bundleLabel),
                                      ],
                                    ),
                                  )
                                ]),
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
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    List<ProductRow> t = rows;
                    rows.add(
                        ProductRow(id: productionId + 1, orderData: orderData));
                    setState(() {
                      rows = t;
                      productionId += 1;
                    });
                  },
                  child: const Text('Add'),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Save'),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
