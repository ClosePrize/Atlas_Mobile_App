import 'package:flutter/material.dart';

class CartModelYol extends ChangeNotifier {
  // list of items on sale
  final List _shopItems = const [
    // [ itemName, itemPrice, imagePath, color ]
    [" Yakit Kiti ", "assets/yol_yardim_kitleri/yakitkiti.png" ],
    [" Lastik Tamir Kiti ", "assets/yol_yardim_kitleri/lastiktamirkiti.png"],
    [" Motor Bakim Kiti ", "assets/yol_yardim_kitleri/motorbakimkiti.png"],
  ];

  // list of cart items
  final List _cartItems = [];

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