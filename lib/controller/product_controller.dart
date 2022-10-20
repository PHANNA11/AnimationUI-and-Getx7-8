import 'package:fruits/model/fruit_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProductGetXController extends GetxController {
  List<FruitModel> list = <FruitModel>[].obs();
  double grandTotal = 0.0.obs();
  addProductCard(FruitModel fruitModel) async {
    if (list.isNotEmpty) {
      if (list.every((element) => element.code != fruitModel.code)) {
        list.add(fruitModel);
      } else {
        list[list.indexWhere((element) => element.code == fruitModel.code)]
            .qty++;
      }
    } else {
      list.add(fruitModel);
    }
    update();
  }

  calculateGrandTotal() async {
    grandTotal = 0.0.obs();
    for (var element in list) {
      grandTotal += element.total();
    }
    print('GrandTotal:$grandTotal');
    update();
  }

  incrementQty(FruitModel fruitModel) {
    list[list.indexWhere((element) => element.code == fruitModel.code)].qty++;
    list[list.indexWhere((element) => element.code == fruitModel.code)].total();
    update();
  }

  decrementQty(FruitModel fruitModel) {
    list[list.indexWhere((element) => element.code == fruitModel.code)].qty--;
    list[list.indexWhere((element) => element.code == fruitModel.code)].total();
    update();
  }

  delteProductCard() {}
}
