import 'package:order_tracker/src/models/hive/orders/production.dart';
import 'package:order_tracker/src/models/hive/orders/step.dart';

import '../models/hive/orders/orders.dart';

class ProductRow {
  int id;
  Order orderData;
  Production production;
  Map<int, bool> bundleMap = {};
  ProductionStep step;
  String bundleLabel = "-";
  DateTime timeStamp = DateTime.now();

  ProductRow(
      {required this.id,
      required this.orderData,
      required this.production,
      required this.step}) {
    initBundleMap();
  }

  void initBundleMap() {
    List.generate(orderData.numOfBundles, ((index) {
      bundleMap[index + 1] = production.bundles.contains(index + 1);
      return index + 1;
    }));
    updateBundleLabel();
  }

  void updateBundleLabel() {
    var temp = "";
    bundleMap.forEach((k, v) {
      if (v) {
        temp += "$k,";
      }
    });

    bundleLabel =
        temp == "" ? "-" : temp.replaceFirst(",", "", temp.length - 1);
  }
}
