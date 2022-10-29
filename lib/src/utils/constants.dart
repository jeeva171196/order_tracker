import '../models/models.dart';

const int maxAllowedSteps = 10;
const int maxAllowedBundles = 100;

enum VALIDATORS { empty, bundles, steps }

enum TITLES { orderList, orderDetail, orderForm, orderStepForm }

enum STATUS { notStarted, inProgress, done }

Map<int, String> statusMap = {
  STATUS.notStarted.index: "Not Started",
  STATUS.inProgress.index: "In Progress",
  STATUS.done.index: "Completed"
};

const titleOrderList = "List";
const titleOrderDetails = "Details";
const titleOrderForm = "Orders Detail Form";
const titleOrderStepForm = "Orders Step Form";

Order sampleOrderData(String name) {
  return Order(
      id: "order_1",
      name: name,
      numOfBundles: 2,
      numOfSteps: 2,
      steps: [
        ProductionStep(stepId: 1, description: "Test description 1"),
        ProductionStep(stepId: 2, description: "Test description 2")
      ],
      productions: [
        Production(
            productionId: 1,
            step: ProductionStep(stepId: 1, description: "Test description 1"),
            timeStamp: DateTime.now(),
            bundles: [1, 2]),
        Production(
            productionId: 2,
            step: ProductionStep(stepId: 2, description: "Test description 2"),
            timeStamp: DateTime.now(),
            bundles: [1, 2])
      ]);
}
