import 'package:flutter/material.dart';
import 'package:order_tracker/src/features/orders/dashboard/screen/chart.dart';
import 'package:order_tracker/src/features/orders/dashboard/screen/output.dart';
import 'package:order_tracker/src/features/orders/dashboard/screen/production.dart';
import 'package:order_tracker/src/models/hive/orders/orders.dart';

class OrdersDetail extends StatefulWidget {
  const OrdersDetail({super.key, required this.title});

  final String title;

  @override
  State<OrdersDetail> createState() => _OrdersDetailState();
}

class _OrdersDetailState extends State<OrdersDetail> {
  @override
  Widget build(BuildContext context) {
    Order orderDetail = ModalRoute.of(context)!.settings.arguments as Order;
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.production_quantity_limits,
                  ),
                  text: "Production",
                ),
                Tab(
                  icon: Icon(Icons.output),
                  text: "Output",
                ),
                Tab(
                  icon: Icon(Icons.bar_chart),
                  text: "Chart",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ProductionDetail(
                orderDetail: orderDetail,
              ),
              OutputDetail(
                orderDetail: orderDetail,
              ),
              ProductionDetailChart(
                orderDetail: orderDetail,
              )
            ],
          ),
        ),
      ),
    );
  }
}
