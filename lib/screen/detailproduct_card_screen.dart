import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fruits/model/fruit_model.dart';

class DetailProductCardScreen extends StatelessWidget {
  DetailProductCardScreen({super.key, required this.fruitModel});
  FruitModel fruitModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About Procuct')),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Hero(
              tag: 'subscreen',
              child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 10, color: Colors.blueGrey),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              'assets/images/${fruitModel.fruitImage}')))),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8, bottom: 1),
            child: Text(
              'Product Name',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${fruitModel.weight} g',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 178, 172, 172),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton(
                      backgroundColor: const Color.fromARGB(255, 178, 172, 172),
                      onPressed: () {},
                      child: const Icon(Icons.remove),
                    ),
                    const Text(
                      '1',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    FloatingActionButton(
                      backgroundColor: const Color.fromARGB(255, 178, 172, 172),
                      onPressed: () {},
                      child: const Icon(Icons.add),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${fruitModel.price}\$/Kg',
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'About the Product',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              fruitModel.description,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 207, 204, 204),
          onPressed: () {},
          child: const Icon(
            Icons.favorite,
            color: Colors.red,
            size: 30,
          ),
        ),
        Container(
          height: 50,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue,
          ),
          child: const Center(
            child: Text(
              'Add to Card',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ]),
    );
  }
}
