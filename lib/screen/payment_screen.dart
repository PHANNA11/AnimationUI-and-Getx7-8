import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:fruits/controller/change_fonts_controller.dart';
import 'package:fruits/model/order_model.dart';
import 'package:fruits/screen/shopping_card_screen.dart';
import 'package:fruits/widget/textfield_card.dart';
import 'package:get/get.dart';

FontsController fontsController = Get.put(FontsController());

class PaymentScreen extends StatefulWidget {
  PaymentScreen({super.key, required this.orderModel});
  OrderModel orderModel;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextEditingController totalController = TextEditingController();
  TextEditingController currencyDController = TextEditingController();
  TextEditingController currencyKHController = TextEditingController();
  double total = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.orderModel.listProduct.forEach((element) {
      total += element.total();
    });

    totalController.text = total.toStringAsFixed(2);
    currencyKHController.text = (total * 4000).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FontsController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Payment Order',
            style:
                TextStyle(fontSize: 28, fontFamily: fontsController.fontData),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: double.infinity,
              // color: Colors.blue,
              child: ListView.builder(
                itemCount: widget.orderModel.listProduct.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(4),
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.red),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                'assets/images/${widget.orderModel.listProduct[index].fruitImage}'))),
                  );
                },
              ),
            ),
            TextFieldCard(
                readOnly: true,
                controller: totalController,
                label: 'Total \$',
                sHintext: 's'),
            TextFieldCard(
                readOnly: true,
                controller: currencyKHController,
                label: 'Total Reil (៛)',
                sHintext: ''),
            // textFieldCard()
            MaterialButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'select your card',
                          style:
                              TextStyle(fontFamily: fontsController.fontData),
                        ),
                        backgroundColor: Colors.blueGrey,
                        content: Container(
                          height: 500,
                          width: 500,
                          child: CreditCardWidget(
                            cardNumber: ' 123456783254',
                            expiryDate: ' 12/12/2023',
                            cardHolderName: 'PHA PHANNA',
                            bankName: 'BC NAS BANK',
                            cvvCode: 'xxxx',
                            cardType: CardType.mastercard,
                            showBackView: false,
                            chipColor: Colors.amber[300],
                            cardBgColor: Colors.blueAccent,
                            glassmorphismConfig: Glassmorphism.defaultConfig(),
                            obscureCardNumber: true,
                            obscureCardCvv: true,
                            isHolderNameVisible: true,
                            height: 190,
                            textStyle:
                                TextStyle(fontFamily: fontsController.fontData),
                            width: MediaQuery.of(context).size.width,
                            isChipVisible: true,
                            isSwipeGestureEnabled: true,
                            animationDuration:
                                const Duration(milliseconds: 1000),
                            onCreditCardWidgetChange: (CreditCardBrand) {},
                          ),
                        ),
                        actionsAlignment: MainAxisAlignment.center,
                        contentTextStyle: TextStyle(
                          fontFamily: fontsController.fontData,
                        ),
                        actions: [
                          MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text('cancel',
                                      style: TextStyle(
                                          fontFamily: fontsController.fontData,
                                          fontSize: 22)),
                                ),
                              )),
                          MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text('ok',
                                      style: TextStyle(
                                          fontFamily: fontsController.fontData,
                                          fontSize: 22)),
                                ),
                              )),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        borderRadius: BorderRadius.circular(5)),
                    height: 50,
                    width: 200,
                    child: Center(
                        child: Text(
                      'Choose Credit Card',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: fontsController.fontData,
                          fontWeight: FontWeight.bold),
                    ))))
          ],
        ),
        bottomSheet: GestureDetector(
          onTap: () {},
          child: Container(
            height: 70,
            width: double.infinity,
            color: Theme.of(context).primaryColorLight,
            child: Center(
              child: Text(
                'Pay',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: fontsController.fontData),
              ),
            ),
          ),
        ),
      );
    });
  }
}
