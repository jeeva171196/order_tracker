import 'package:hive/hive.dart';

import 'step.dart';

part 'production.g.dart';

@HiveType(typeId: 3)
class Production {
  Production(
      {required this.productionId,
      required this.step,
      required this.timeStamp,
      required this.bundles});

  @HiveField(0)
  int productionId;

  @HiveField(1)
  DateTime timeStamp;

  @HiveField(2)
  ProductionStep step;

  @HiveField(3)
  List<int> bundles;

  @override
  String toString() {
    return '$productionId';
  }

  String totalBundles() {
    return "Total number of bundles: ${bundles.length}";
  }

  Map<String, dynamic> toMap() {
    return {
      'productionId': productionId,
      'timeStamp': timeStamp.toString(),
      'steps': step.toMap(),
      'bundles': bundles,
    };
  }
}
