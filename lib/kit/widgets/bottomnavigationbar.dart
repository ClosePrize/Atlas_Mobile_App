import 'package:flutter/material.dart';
import 'package:v01/kargo/constants.dart';
import 'package:v01/kargo/my_cargos/my_cargos.dart';
import 'package:v01/kit/home/home.dart';
import 'package:v01/kit/taleplerim/taleplerim.dart';
import '../profile/profile.dart';
 
class KitBottomNavBar extends StatefulWidget {
  const KitBottomNavBar({super.key});

  @override
  State<KitBottomNavBar> createState() => _KitBottomNavBarState();
}
class _KitBottomNavBarState extends State<KitBottomNavBar> {
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
        if (value == 0) {
          Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>  TaleplerimScreen()));
        }
        if (value == 1) {
          Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>   KitHomePage()));
        }
        if (value == 2) {
          Navigator.push(context,
                        MaterialPageRoute(builder: (context) => KitProfilePage()));
        }
      },
    
      
        backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              label: 'Taleplerim',
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
          selectedItemColor: Color.fromARGB(255, 117, 117, 117),
          unselectedItemColor: Color.fromARGB(255, 117, 117, 117),
      ),
    );
  }
}



