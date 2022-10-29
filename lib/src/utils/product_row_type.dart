import '../models/hive/orders/orders.dart';

class ProductRow {
  int id;
  Order orderData;
  Map<int, bool> stepMap = {};
  Map<int, bool> bundleMap = {};
  String stepLabel = "-";
  String bundleLabel = "-";

  ProductRow({required this.id, required this.orderData}) {
    initStepMap();
    initBundleMap();
  }

  void initStepMap() {
    for (var step in orderData.steps) {
      stepMap[step.stepId] = false;
    }
    updateStepLabel();
  }

  void initBundleMap() {
    List.generate(orderData.numOfBundles, ((index) {
      bundleMap[index + 1] = false;
      return index + 1;
    }));
    updateBundleLabel();
  }

  void updateStepLabel() {
    var temp = "";
    stepMap.forEach((k, v) {
      if (v) {
        temp += "$k,";
      }
    });

    stepLabel = temp == "" ? "-" : temp.replaceFirst(",", "", temp.length - 1);
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
