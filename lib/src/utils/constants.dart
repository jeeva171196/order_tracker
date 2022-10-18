import '../models/models.dart';

Order sampleOrderData =
    Order(name: 'Order 1', numOfBundles: 2, numOfSteps: 2, steps: [
  ProductionStep(stepId: 1, description: "Test description 1"),
  ProductionStep(stepId: 2, description: "Test description 2")
], productions: [
  Production(
      productionId: 1,
      steps: [ProductionStep(stepId: 1, description: "Test description 1")],
      timeStamp: DateTime.now(),
      bundles: [1, 2]),
  Production(
      productionId: 2,
      steps: [ProductionStep(stepId: 2, description: "Test description 2")],
      timeStamp: DateTime.now(),
      bundles: [1, 2])
]);
