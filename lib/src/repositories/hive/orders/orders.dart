import 'package:hive/hive.dart';
import 'package:order_tracker/src/models/hive/orders/orders.dart';
import 'package:order_tracker/src/repositories/hive/orders/orders_interface.dart';

class OrdersRepository implements IOrdersRepository {
  final Box<Order> orderBox;

  OrdersRepository(this.orderBox);

  @override
  Future<void> delete(String orderId) async {
    orderBox.delete(orderId);
    throw UnimplementedError();
  }

  @override
  Future<List<Order>> getAll() async {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<Order?> getOne(String orderId) async {
    return orderBox.get(orderId);
  }

  @override
  Future<void> insert(String orderId, Order order) async {
    orderBox.put(orderId, order);
  }

  @override
  Future<void> update(String orderId, Order order) async {
    orderBox.put(orderId, order);
  }

  @override
  Future<void> clear() async {
    orderBox.clear();
  }
}
