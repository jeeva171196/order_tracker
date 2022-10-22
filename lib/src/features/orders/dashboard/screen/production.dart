import 'package:flutter/material.dart';
import 'package:order_tracker/src/models/hive/orders/orders.dart';

class ProductionDetail extends StatelessWidget {
  const ProductionDetail({super.key, required this.orderDetail});
  final Order orderDetail;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 70, child: Center(child: Text(orderDetail.name)));
  }
}
