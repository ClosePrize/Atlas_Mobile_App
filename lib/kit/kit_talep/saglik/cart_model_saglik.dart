import 'package:flutter/material.dart';

class CartModelSaglik extends ChangeNotifier {
  // list of items on sale
  final List _shopItems = const [
    // [ itemName, itemPrice, imagePath, color ]
<<<<<<< HEAD
    [" Kalp Krizi Kiti ", "assets/saglık_kitleri/kalpkrizikiti.png","2w232wq" ],
    [" Astım Kiti", "assets/saglık_kitleri/astimkiti.png", "2w232wq"],
    [" Pandemi Kiti",  "assets/saglık_kitleri/pandemikiti.png", "2w232wq"],
    [" Hijyen Kiti",  "assets/saglık_kitleri/hijyenkiti.png", "2w232wq"],
=======
    [" Kalp Krizi Kiti ", "assets/saglık_kitleri/kalpkrizikiti.png" ],
    [" Astim Kiti", "assets/saglık_kitleri/astimkiti.png"],
    [" Pandemi Kiti",  "assets/saglık_kitleri/pandemikiti.png"],
    [" Hijyen Kiti",  "assets/saglık_kitleri/hijyenkiti.png"],
>>>>>>> Mustafa_vol3_m
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