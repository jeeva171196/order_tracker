import 'package:hive/hive.dart';

part 'step.g.dart';

@HiveType(typeId: 2)
class ProductionStep {
  ProductionStep({required this.stepId, required this.description});

  @HiveField(0)
  int stepId;

  @HiveField(1)
  String description;

  @override
  String toString() {
    return 'Step $stepId';
  }

  Map<String, dynamic> toMap() {
    return {'stepId': stepId, 'description': description};
  }
}
