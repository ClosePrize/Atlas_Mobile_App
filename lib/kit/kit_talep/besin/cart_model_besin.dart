import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // list of items on sale
  final List _shopItems = const [
    // [ itemName, itemPrice, imagePath, color ]
    [" Bebek Maması Kiti ", "assets/besin_kitleri/bebekmamasikiti.png" ],
    [" Hazır Gıda Kiti", "assets/besin_kitleri/hazirgidakiti.png"],
    [" Sokak Hayvanı Maması Kiti",  "assets/besin_kitleri/sokakhayvanimamakiti.png"],
  ];

  final List _shopItems1 = const [
    // [ itemName, itemPrice, imagePath, color ]
    [" Kalp Krizi Kiti ", "assets/saglık_kitleri/kalpkrizikiti.png" ],
    [" Astım Kiti", "assets/saglık_kitleri/astimkiti.png"],
    [" Pandemi Kiti",  "assets/saglık_kitleri/pandemikiti.png"],
    [" Hijyen Kiti",  "assets/saglık_kitleri/hijyenkiti.png"],
  ];

  final List _shopItems2 = const [
    // [ itemName, itemPrice, imagePath, color ]
    [" Yakıt Kiti ", "assets/yol_yardim_kitleri/yakitkiti.png" ],
    [" Lastik Tamir Kiti ", "assets/yol_yardim_kitleri/lastiktamirkiti.png"],
    [" Motor Bakım Kiti ", "assets/yol_yardim_kitleri/motorbakimkiti.png"],
  ];

  // list of cart items
  List _cartItems = [];

  get cartItems => _cartItems;

  get shopItems => _shopItems;

  get shopItems1 => _shopItems1;

  get shopItems2 => _shopItems2;

  // add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void addItemToCart1(int index) {
    _cartItems.add(_shopItems1[index]);
    notifyListeners();
  }

  void addItemToCart2(int index) {
    _cartItems.add(_shopItems2[index]);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }
  }