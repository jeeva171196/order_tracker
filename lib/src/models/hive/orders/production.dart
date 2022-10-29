import 'package:hive/hive.dart';

import 'step.dart';

part 'production.g.dart';

@HiveType(typeId: 3)
class Production {
  Production(
      {required this.productionId,
      required this.steps,
      required this.timeStamp,
      required this.bundles});

  @HiveField(0)
  int productionId;

  @HiveField(1)
  DateTime timeStamp;

  @HiveField(2)
  List<ProductionStep> steps;

  @HiveField(3)
  List<int> bundles;

  @override
  String toString() {
    return '$productionId';
  }

  Map<String, dynamic> toMap() {
    return {
      'productionId': productionId,
      'timeStamp': timeStamp.toString(),
      'steps':
          steps.isNotEmpty ? steps.map((step) => step.toMap()).toList() : [],
      'bundles': bundles,
    };
  }
}
