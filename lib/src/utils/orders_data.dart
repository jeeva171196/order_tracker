import 'package:order_tracker/src/utils/constants.dart';

void setupTestData(box) async {
  await box.put('Order 1', sampleOrderData);
}
