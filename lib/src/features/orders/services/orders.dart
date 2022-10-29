import 'package:hive/hive.dart';

import '../../../models/models.dart';
import '../../../repositories/repositories.dart';

class OrderService {
  static Future<OrderService> getObject() async {
    if (OrderService.repo != null) {
      return OrderService.repo!;
    }
    var ordersBox = await Hive.openBox<Order>('OrdersBox');
    var indexBox = await Hive.openBox<int>('IndexBox');
    OrderService.repo =
        OrderService(ordersBox, OrdersRepository(ordersBox, indexBox));
    return OrderService.repo!;
  }

  final Box<Order> orderBox;
  final OrdersRepository _ordersRepo;

  static OrderService? repo;

  OrderService(this.orderBox, this._ordersRepo);

  Future<List<Order>> getOrders() {
    return _ordersRepo.getAll();
  }

  Future<Order?> getOrder(String orderId) {
    return _ordersRepo.getOne(orderId);
  }

  Future<void> addOrder(Order order) {
    return _ordersRepo.insert(order);
  }

  Future<void> removeOrder(String orderId) {
    return _ordersRepo.delete(orderId);
  }

  Future<void> clearAll() {
    return _ordersRepo.clear();
  }

  Future<void> updateOrder(String orderId, Order updatedOrder) {
    return _ordersRepo.update(orderId, updatedOrder);
  }
}
