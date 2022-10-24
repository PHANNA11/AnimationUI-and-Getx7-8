class FruitModel {
  late int code;
  late String name;
  late int qty;
  late double weight;
  late String description;
  late String fruitImage;
  late String backgroundImages;
  late double price;

  double total() {
    return (qty * price * weight / 1000);
  }

  FruitModel(
      {required this.code,
      required this.name,
      required this.weight,
      required this.description,
      required this.fruitImage,
      required this.price,
      required this.backgroundImages,
      required this.qty});
}

List<FruitModel> getListData = [
  FruitModel(
      code: 123234567,
      qty: 1,
      name: 'Apple',
      weight: 500,
      price: 4.5,
      description: 'description this is fruit people can eat this fruit',
      fruitImage: 'apple.png',
      backgroundImages: 'apple.png'),
  FruitModel(
      code: 1232364567,
      qty: 1,
      name: 'Berry',
      weight: 100,
      price: 8.2,
      description: 'description this is fruit people can eat this fruit',
      fruitImage: 'berry.png',
      backgroundImages: 'Cherry.png'),
  FruitModel(
    code: 1232333567,
    qty: 1,
    name: 'PAPAYA',
    weight: 700,
    price: 3,
    description: 'description this is fruit people can eat this fruit',
    fruitImage: 'papaya.png',
    backgroundImages: 'papaya.png',
  ),
  FruitModel(
      code: 1223234567,
      qty: 1,
      name: 'Passion',
      weight: 300,
      price: 2.5,
      description: 'description this is fruit people can eat this fruit',
      fruitImage: 'passion.png',
      backgroundImages: 'passion.png'),
  FruitModel(
      code: 14323234567,
      qty: 1,
      name: 'Orange',
      price: 3.4,
      weight: 400,
      description: 'description this is fruit people can eat this fruit',
      fruitImage: 'orange.png',
      backgroundImages: 'orange.png'),
  FruitModel(
      code: 123982345,
      name: 'Star Fruit',
      price: 2,
      qty: 1,
      weight: 350,
      description: 'description this is fruit people can eat this fruit',
      fruitImage: 'star_fruit.png',
      backgroundImages: 'star_fruit.png'),
  FruitModel(
      code: 12323744567,
      name: 'Fruit splash',
      qty: 1,
      price: 4,
      weight: 500,
      description: 'description this is fruit people can eat this fruit',
      fruitImage: 'FruitSplash.png',
      backgroundImages: 'fruit_tree_splash.png'),
  FruitModel(
      code: 12398234567,
      name: 'Star Fruit',
      qty: 1,
      price: 2,
      weight: 350,
      description: 'description this is fruit people can eat this fruit',
      fruitImage: 'star_fruit.png',
      backgroundImages: 'star_fruit.png'),
  FruitModel(
      code: 123244567,
      name: 'Fruit splash',
      qty: 1,
      price: 4,
      weight: 500,
      description: 'description this is fruit people can eat this fruit',
      fruitImage: 'FruitSplash.png',
      backgroundImages: 'fruit_tree_splash.png'),
];
