import 'package:hive/hive.dart';
import 'package:order_tracker/src/models/hive/orders/orders.dart';
import 'package:order_tracker/src/repositories/hive/orders/orders_interface.dart';
import 'package:order_tracker/src/utils/constants.dart';

class OrdersRepository implements IOrdersRepository {
  final Box<Order> orderBox;
  final Box<int> indexBox;

  OrdersRepository(this.orderBox, this.indexBox);

  @override
  Future<void> delete(String orderId) async {
    // remove later
    orderId = orderId.toLowerCase().replaceAll(' ', '_');
    orderBox.delete(orderId);
  }

  @override
  Future<List<Order>> getAll() async {
    return orderBox.values.toList(growable: false);
  }

  @override
  Future<Order?> getOne(String orderId) async {
    return orderBox.get(orderId);
  }

  @override
  Future<void> insert(Order order) async {
    int id = (indexBox.get("lastIndex") ?? 0) + 1;
    order.id = "order_$id";
    orderBox.put(order.id, order);
    indexBox.put("lastIndex", id);
  }

  @override
  Future<void> update(String orderId, Order order) async {
    orderBox.put(orderId, order);
  }

  @override
  Future<void> clear() async {
    orderBox.clear();
    indexBox.clear();
  }
}
