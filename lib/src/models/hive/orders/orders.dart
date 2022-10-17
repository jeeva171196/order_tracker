import 'dart:io';

import 'package:hive/hive.dart';

part 'orders.g.dart';

@HiveType(typeId: 1)
class Order {
  Order(
      {required this.name,
      required this.numOfBundles,
      required this.numOfSteps});

  @HiveField(0)
  String name;

  @HiveField(1)
  int numOfBundles;

  @HiveField(2)
  int numOfSteps;

  // @HiveField(2)
  // List<String> friends;

  @override
  String toString() {
    return '$name';
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'numOfBundles': numOfBundles,
      'numOfSteps': numOfSteps
    };
  }
}
