import 'package:flutter/material.dart';

class CartModelSaglik extends ChangeNotifier {
  // list of items on sale
  final List _shopItems = const [
    // [ itemName, itemPrice, imagePath, color ]
    [" Kalp Krizi Kiti ", "assets/saglık_kitleri/kalpkrizikiti.png" ],
    [" Astım Kiti", "assets/saglık_kitleri/astimkiti.png"],
    [" Pandemi Kiti",  "assets/saglık_kitleri/pandemikiti.png"],
    [" Hijyen Kiti",  "assets/saglık_kitleri/hijyenkiti.png"],
  ];

  // list of cart items
  List _cartItems = [];

  get cartItems => _cartItems;

  get shopItems => _shopItems;

  // add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }
}