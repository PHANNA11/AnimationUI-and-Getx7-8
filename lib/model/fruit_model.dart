class FruitModel {
  late int code;
  late String name;
  late double weight;
  late String description;
  late String fruitImage;
  late double price;
  FruitModel(
      {required this.code,
      required this.name,
      required this.weight,
      required this.description,
      required this.fruitImage,
      required this.price});
}

List<FruitModel> getListData = [
  FruitModel(
      code: 123234567,
      name: 'Apple',
      weight: 500,
      price: 4.5,
      description: 'description this is fruit people can eat this fruit',
      fruitImage: 'apple.png'),
  FruitModel(
      code: 1232364567,
      name: 'Berry',
      weight: 100,
      price: 8.2,
      description: 'description this is fruit people can eat this fruit',
      fruitImage: 'berry.png'),
  FruitModel(
      code: 1232333567,
      name: 'PAPAYA',
      weight: 700,
      price: 3,
      description: 'description this is fruit people can eat this fruit',
      fruitImage: 'papaya.png'),
  FruitModel(
      code: 1223234567,
      name: 'Passion',
      weight: 300,
      price: 2.5,
      description: 'description this is fruit people can eat this fruit',
      fruitImage: 'passion.png'),
  FruitModel(
      code: 14323234567,
      name: 'Orange',
      price: 3.4,
      weight: 400,
      description: 'description this is fruit people can eat this fruit',
      fruitImage: 'orange.png'),
  FruitModel(
      code: 12398234567,
      name: 'Star Fruit',
      price: 2,
      weight: 350,
      description: 'description this is fruit people can eat this fruit',
      fruitImage: 'star_fruit.png'),
  FruitModel(
      code: 12323744567,
      name: 'Fruit splash',
      price: 4,
      weight: 500,
      description: 'description this is fruit people can eat this fruit',
      fruitImage: 'FruitSplash.png'),
  FruitModel(
      code: 12398234567,
      name: 'Star Fruit',
      price: 2,
      weight: 350,
      description: 'description this is fruit people can eat this fruit',
      fruitImage: 'star_fruit.png'),
  FruitModel(
      code: 12323744567,
      name: 'Fruit splash',
      price: 4,
      weight: 500,
      description: 'description this is fruit people can eat this fruit',
      fruitImage: 'FruitSplash.png'),
];
