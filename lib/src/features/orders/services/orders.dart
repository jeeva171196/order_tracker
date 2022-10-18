import 'package:hive/hive.dart';

import '../../../models/models.dart';
import '../../../repositories/repositories.dart';

class OrderService {
  static Future<OrderService> getObject() async {
    var ordersBox = await Hive.openBox<Order>('OrdersBox');
    return OrderService(ordersBox, OrdersRepository(ordersBox));
  }

  final Box<Order> orderBox;
  final OrdersRepository _ordersRepo;

  OrderService(this.orderBox, this._ordersRepo);

  Future<Order?> getOrder(String orderId) {
    return _ordersRepo.getOne(orderId);
  }

  Future<void> addOrder(String orderId, Order order) {
    return _ordersRepo.insert(orderId, order);
  }

  Future<void> removeOrder(String orderId) {
    return _ordersRepo.delete(orderId);
  }

  Future<void> clearAll() {
    return _ordersRepo.clear();
  }
}
