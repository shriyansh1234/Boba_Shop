import 'package:flutter/material.dart';
import 'drink.dart';

class BubbleTeaShop extends ChangeNotifier {
  // list of drinks for sale
  final List<Drink> _shop = [
    // pearl milk tea
    Drink(
      name: "Pearl Milk Tea",
      price: "4.80",
      imagePath: "lib/images/milk_tea.png",
    ),

    // taro tea
    Drink(
      name: "Taro Milk Tea",
      price: "5.20",
      imagePath: "lib/images/taro_tea.png",
    ),

    // green tea
    Drink(
      name: "Green Tea",
      price: "6.00",
      imagePath: "lib/images/green_tea.png",
    ),

    // cream tea
    Drink(
      name: "Cream Tea",
      price: "7.00",
      imagePath: "lib/images/cream_tea.png",
    ),

    // choc tea
    Drink(
      name: "Choco Tea",
      price: "5.50",
      imagePath: "lib/images/choc_tea.png",
    ),
  ];

  // list of drinks in user cart
  List<Drink> _userCart = [];

  // get drinks for sale
  List<Drink> get shop => _shop;

  // get drinks in cart
  List<Drink> get cart => _userCart;

  // add drink to cart
  void addToCart(Drink drink) {
    _userCart.add(drink);
    notifyListeners();
  }

  // remove drink from cart
  void removeFromCart(Drink drink) {
    _userCart.remove(drink);
    notifyListeners();
  }
}
