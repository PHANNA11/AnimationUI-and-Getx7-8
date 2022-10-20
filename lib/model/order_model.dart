import 'package:fruits/model/fruit_model.dart';
import 'package:fruits/model/user_model.dart';

class OrderModel {
  late int orderId;
  late User user;
  late List<FruitModel> listProduct;
  OrderModel(
      {required this.orderId, required this.user, required this.listProduct});
}
