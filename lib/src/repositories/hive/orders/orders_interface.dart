import 'package:order_tracker/src/models/hive/orders/orders.dart';

abstract class IOrdersRepository {
  Future<List<Order>> getAll();
  Future<Order?> getOne(String orderId);
  Future<void> insert(Order order);
  Future<void> update(String orderId, Order order);
  Future<void> delete(String orderId);
  Future<void> clear();
}
