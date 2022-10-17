import 'dart:io';

import 'package:hive/hive.dart';
import 'package:order_tracker/src/models/hive/orders/orders.dart';
import 'package:path_provider/path_provider.dart';

void setupHive() async {
  // var path = Directory.current.path;
  var documents = await getApplicationDocumentsDirectory();
  Hive
    ..init(documents.path)
    ..registerAdapter(OrderAdapter());

  var ordersBox = await Hive.openBox('OrdersBox');

  var order_1 = Order(name: 'Order 1', numOfBundles: 2, numOfSteps: 2);

  await ordersBox.put('Order 1', order_1);
}
