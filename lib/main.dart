import 'package:flutter/material.dart';
import 'package:flutter_json_viewer/flutter_json_viewer.dart';
import 'package:hive/hive.dart';
import 'package:order_tracker/src/models/hive/hive.dart';
import 'package:order_tracker/src/utils/constants.dart';
import 'package:order_tracker/src/utils/orders_data.dart';
import 'src/features/orders/services/orders.dart';

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
      home: const MyHomePage(title: 'Dashboard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dynamic defaultData = {"data": "No data"};
  dynamic jsonData = {"data": "No data"};
  final Future<OrderService> service = OrderService.getObject();

  void _incrementCounter() async {
    var order = await (await service).getOrder("Order 1");
    print(order?.toMap());
  }

  void _clearCache() async {
    await (await service).clearAll();
    setState(() {
      jsonData = defaultData;
    });
  }

  void _addTestData() async {
    await (await service).addOrder('Order 1', sampleOrderData);
    var orderData = (await (await service).getOrder('Order 1'))?.toMap();
    setState(() {
      jsonData = orderData ?? defaultData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            JsonViewer(jsonData),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: _clearCache,
                child: const Text(
                  'Clear Cache',
                  style: TextStyle(color: Colors.white),
                )),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: _addTestData,
                child: const Text(
                  'Add Test Data',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Create Order',
        child: const Icon(Icons.add),
      ),
    );
  }
}
