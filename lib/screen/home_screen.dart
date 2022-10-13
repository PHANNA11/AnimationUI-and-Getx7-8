import 'package:flutter/material.dart';
import 'package:fruits/model/fruit_model.dart';
import 'package:fruits/screen/detailproduct_card_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
          itemCount: getListData.length,
          itemBuilder: ((context, index) {
            return productCardWidget(getListData[index]);
          })),
    );
  }

  Widget productCardWidget(FruitModel fruitModel) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 600),
              pageBuilder: (context, animation, _) => FadeTransition(
                opacity: animation,
                child: DetailProductCardScreen(fruitModel: fruitModel),
              ),
            ));
      },
      child: Container(
        height: 100,
        //  color: Colors.blue,
        margin: const EdgeInsets.all(4),
        width: double.infinity,
        child: Hero(
          tag: 'subscreen',
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Center(
                child: Card(
                  elevation: 0,
                  child: ListTile(
                    leading: const SizedBox(width: 120),
                    title: Text(
                      fruitModel.name,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Weight:${fruitModel.weight} g'),
                    trailing: Text(
                      '${fruitModel.price}\$/Kg',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  ),
                ),
              ),
              Positioned(
                  child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 3,
                        color: const Color.fromARGB(255, 148, 133, 133)),
                    shape: BoxShape.circle,
                    color: Colors.red,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            'assets/images/${fruitModel.fruitImage}'))),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
