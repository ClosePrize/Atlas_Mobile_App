import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // list of items on sale
  final List _shopItems = const [
    // [ itemName, itemPrice, imagePath, color ]
<<<<<<< HEAD
    [" Bebek Maması Kiti ", "assets/besin_kitleri/bebekmamasikiti.png", "22152wqsaw" ],
    [" Hazır Gıda Kiti", "assets/besin_kitleri/hazirgidakiti.png", "22152wqsaw"],
    [" Sokak Hayvanı Maması Kiti",  "assets/besin_kitleri/sokakhayvanimamakiti.png", "22152wqsaw"],
=======
    [" Bebek Mamasi Kiti ", "assets/besin_kitleri/bebekmamasikiti.png" ],
    [" Hazir Gida Kiti", "assets/besin_kitleri/hazirgidakiti.png"],
    [" Sokak Hayvani Mamasi Kiti",  "assets/besin_kitleri/sokakhayvanimamakiti.png"],
>>>>>>> Mustafa_vol3_m
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