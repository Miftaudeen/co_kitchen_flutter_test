import 'package:co_kitchen_flutter_test/models/food_item.dart';

class Dummy {
  static const List<FoodItem> FOOD_ITEMS = [
    FoodItem(
        title: "Jollof & Co.",
        description: "Delicious Everyday Naija Food",
        price: "500",
        icon: "assets/icons/jollof.png",
        banner: "assets/images/jollof.png"),
    FoodItem(
        title: "Mama Put",
        description: "Authentic Native Naija Food",
        price: "500",
        icon: "assets/icons/mama_put.png",
        banner: "assets/images/mama_put.png"),
    FoodItem(
        title: "Papa's Pizza",
        description: "Original Wood Fired Pizza",
        price: "700",
        icon: "assets/icons/pizza.png",
        banner: "assets/images/pizza.png"),
    FoodItem(
        title: "Burger Shop",
        description: "Delicious gourmet burgers & sides",
        price: "600",
        icon: "assets/icons/burger.png",
        banner: "assets/images/burger.png"),
    FoodItem(
        title: "Pasta Factory",
        description: "Savoury pasta mixes",
        price: "450",
        icon: "assets/icons/pasta.png",
        banner: "assets/images/pasta.png"),
  ];
}
