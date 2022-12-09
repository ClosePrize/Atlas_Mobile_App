import 'package:flutter/material.dart';
import 'package:v01/kargo/constants.dart';
<<<<<<< HEAD
import 'package:v01/kargo/profile/body.dart';
import 'package:v01/kargo/profile/profile.dart';
import 'package:v01/kargo/signup.dart';

import '../cargo_add/cargo_add.dart';
=======
import 'package:v01/kargo/my_cargos/my_cargos.dart';
>>>>>>> main
import '../home/kargohome.dart';
import '../profile/profile.dart';
 
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}
class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3),)
        ]
      ),
      height: MediaQuery.of(context).size.height/11,
      child: BottomNavigationBar(
      
      onTap: (value) {
<<<<<<< HEAD
        if (value == 0) Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>  KargoHomeScreen()));
        if (value == 1) Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>  KargoSignUpScreen()));
        if (value == 2) Navigator.push(context,
                        MaterialPageRoute(builder: (context) => KargoProfileScreen()));
=======
        if (value == 0) {
          Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>  MyCargosScreen()));
        }
        if (value == 1) {
          Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>   KargoHomeScreen()));
        }
        if (value == 2) {
          Navigator.push(context,
                        MaterialPageRoute(builder: (context) => KargoProfileScreen()));
        }
>>>>>>> main
      },
    
      
        backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              label: 'Kargolarım',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Ana Sayfa',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.manage_accounts),
              label: 'Profilim',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: kitblueColor,
          unselectedItemColor: kitblueColor,
      ),
    );
  }
}



