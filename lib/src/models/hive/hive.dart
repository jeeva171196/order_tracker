import 'package:hive/hive.dart';
import 'package:order_tracker/src/models/hive/orders/production.dart';
import 'package:path_provider/path_provider.dart';

import '../../utils/orders_data.dart';
import 'orders/orders.dart';
import 'orders/step.dart';

Future<bool> setupHive() async {
  var documents = await getApplicationDocumentsDirectory();
  Hive
    ..init(documents.path)
    ..registerAdapter(OrderAdapter())
    ..registerAdapter(StepAdapter())
    ..registerAdapter(ProductionAdapter());
  var ordersBox = await Hive.openBox<Order>('OrdersBox');
  setupTestData(ordersBox);
  ordersBox.close();
  return true;
}
