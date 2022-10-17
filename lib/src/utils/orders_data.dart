import 'package:order_tracker/src/models/hive/orders/production.dart';

import '../models/hive/orders/orders.dart';
import '../models/hive/orders/step.dart';

void setupTestData(box) async {
  var order_1 = Order(name: 'Order 1', numOfBundles: 2, numOfSteps: 2, steps: [
    Step(stepId: 1, description: "Test description 1"),
    Step(stepId: 2, description: "Test description 2")
  ], productions: [
    Production(
        productionId: 1,
        steps: [Step(stepId: 1, description: "Test description 1")],
        timeStamp: DateTime.now(),
        bundles: [1, 2]),
    Production(
        productionId: 2,
        steps: [Step(stepId: 2, description: "Test description 2")],
        timeStamp: DateTime.now(),
        bundles: [1, 2])
  ]);

  await box.put('Order 1', order_1);
}
