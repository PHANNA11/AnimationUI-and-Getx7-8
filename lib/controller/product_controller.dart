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
        grandTotal += fruitModel.total();
      } else {
        list[list.indexWhere((element) => element.code == fruitModel.code)]
            .qty++;
      }
    } else {
      list.add(fruitModel);
    }
    calculateGrandTotal();
    update();
  }

  calculateGrandTotal() async {
    grandTotal = 0.0.obs();
    list.forEach((element) {
      grandTotal += element.total();
    });
    update();
  }

  tincrementQty(FruitModel fruitModel) {
    list[list.indexWhere((element) => element.code == fruitModel.code)].qty++;
    list[list.indexWhere((element) => element.code == fruitModel.code)].total();
    calculateGrandTotal();
    update();
  }

  decrementQy(FruitModel fruitModel) {
    if (list[list.indexWhere((element) => element.code == fruitModel.code)]
            .qty <=
        0) {
      list[list.indexWhere((element) => element.code == fruitModel.code)].qty =
          0;
    } else {
      list[list.indexWhere((element) => element.code == fruitModel.code)].qty--;
      list[list.indexWhere((element) => element.code == fruitModel.code)]
          .total();
    }
    calculateGrandTotal();
    update();
  }

  deleteProductCard(FruitModel fruitModel) {
    list.removeWhere((element) => element.code == fruitModel.code);
    calculateGrandTotal();
    update();
  }
}
