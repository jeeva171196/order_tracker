import 'package:order_tracker/src/utils/constants.dart';

Map<VALIDATORS, Function> validatorMapping = {
  VALIDATORS.empty: (value) {
    if (value == null || value.isEmpty) {
      return 'Value should not be empty';
    }
    return null;
  },
  VALIDATORS.bundles: (value) {
    int castedValue = int.parse(value!);
    if (castedValue > maxAllowedBundles) {
      return "Max allowed bundles is $maxAllowedBundles";
    }
    return null;
  },
  VALIDATORS.steps: (value) {
    int castedValue = int.parse(value!);
    if (castedValue > maxAllowedSteps) {
      return "Max allowed steps is $maxAllowedSteps";
    }
    return null;
  }
};

String? validate(String? value, List<VALIDATORS> validators) {
  for (var validator in validators) {
    var res = validatorMapping[validator]!(value);
    if (res != null) {
      return res;
    }
  }
  return null;
}
