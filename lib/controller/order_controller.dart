import 'package:fruits/model/order_model.dart';
import 'package:get/get.dart';

class ProductOrderGetxController extends GetxController {
  List<OrderModel> listOrder = <OrderModel>[].obs();
  addOrder(OrderModel orderModel) async {
    listOrder.add(orderModel);
  }
}
