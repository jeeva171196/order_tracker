import 'package:flutter/material.dart';
import 'package:order_tracker/src/features/orders/creation/screen/form.dart';
import 'package:order_tracker/src/features/orders/creation/screen/step_from.dart';
import 'package:order_tracker/src/features/orders/dashboard/screen/detail.dart';
import 'package:order_tracker/src/features/orders/dashboard/screen/list.dart';
import 'package:order_tracker/src/utils/constants.dart';

import 'src/models/hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": ((context) => const OrdersList(title: titleOrderList)),
        "/detail": (context) => const OrdersDetail(title: titleOrderDetails),
        "/order/detail/form": (context) =>
            const OrdersDetailForm(title: titleOrderForm),
        "/order/step/form": (context) =>
            const OrdersStepForm(title: titleOrderStepForm)
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
