import 'package:hive/hive.dart';
import 'package:order_tracker/src/models/dummy.dart';
import 'package:order_tracker/src/models/hive/orders/production.dart';
import 'package:order_tracker/src/models/hive/orders/step.dart';
import 'package:order_tracker/src/utils/constants.dart';

part 'orders.g.dart';

@HiveType(typeId: 1)
class Order {
  Order(
      {required this.id,
      required this.name,
      required this.numOfBundles,
      required this.numOfSteps,
      this.steps = const [],
      this.productions = const [],
      this.status = 0});

  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  int numOfBundles;

  @HiveField(3)
  int numOfSteps;

  @HiveField(4)
  List<ProductionStep> steps;

  @HiveField(5)
  List<Production> productions;

  @HiveField(6)
  int status;

  @override
  String toString() {
    return name;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'numOfBundles': numOfBundles,
      'numOfSteps': numOfSteps,
      'steps':
          steps.isNotEmpty ? steps.map((step) => step.toMap()).toList() : [],
      'production': productions.isNotEmpty
          ? productions.map((production) => production.toMap()).toList()
          : [],
      'status': status ?? 0
    };
  }

  static Order fromDummyDetail(DummyDetail data) {
    return Order(
        id: data.id!,
        name: data.name!,
        numOfBundles: data.numOfBundles!,
        numOfSteps: data.numOfSteps!,
        steps: data.steps!.keys
            .map((key) =>
                ProductionStep(stepId: key, description: data.steps![key]!))
            .toList(),
        productions: [],
        status: 0);
  }
}
