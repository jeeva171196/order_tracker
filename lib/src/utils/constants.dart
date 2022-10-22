import '../models/models.dart';

const int maxAllowedSteps = 10;
const int maxAllowedBundles = 100;

enum VALIDATORS { empty, bundles, steps }

Order sampleOrderData(String name) {
  return Order(name: name, numOfBundles: 2, numOfSteps: 2, steps: [
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
}
