import 'package:hive/hive.dart';
import 'package:order_tracker/src/models/hive/orders/production.dart';
import 'package:order_tracker/src/models/hive/orders/step.dart';

part 'orders.g.dart';

@HiveType(typeId: 1)
class Order {
  Order(
      {required this.name,
      required this.numOfBundles,
      required this.numOfSteps,
      this.steps = const [],
      this.productions = const []});

  @HiveField(0)
  String name;

  @HiveField(1)
  int numOfBundles;

  @HiveField(2)
  int numOfSteps;

  @HiveField(3)
  List<ProductionStep> steps;

  @HiveField(4)
  List<Production> productions;

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
          : []
    };
  }
}
