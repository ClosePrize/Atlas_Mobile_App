import 'package:flutter/material.dart';
import 'package:v01/kargo/constants.dart';
import 'package:v01/kargo/my_cargos/my_cargos.dart';
import '../home/kargohome.dart';
import '../profile/profile.dart';
import 'package:v01/kargo/constants.dart';

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

class BottomNavBarForKargolarim extends StatefulWidget {
  const BottomNavBarForKargolarim({super.key});

  @override
  State<BottomNavBarForKargolarim> createState() => _BottomNavBarForKargolarimState();
}
class _BottomNavBarForKargolarimState extends State<BottomNavBarForKargolarim> {
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
          }
          if (value == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>   KargoHomeScreen()));
          }
          if (value == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => KargoProfileScreen()));
          }
        },


        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard, color: kargoPrimaryColor,),
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

class BottomNavBarForHome extends StatefulWidget {
  const BottomNavBarForHome({super.key});

  @override
  State<BottomNavBarForHome> createState() => _BottomNavBarForHomeState();
}
class _BottomNavBarForHomeState extends State<BottomNavBarForHome> {
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
                MaterialPageRoute(builder: (context) =>  MyCargosScreen()));
          }
          if (value == 1) {
          }
          if (value == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => KargoProfileScreen()));
          }
        },


        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Kargolarım',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: kargoPrimaryColor,),
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

class BottomNavBarForProfile extends StatefulWidget {
  const BottomNavBarForProfile({super.key});

  @override
  State<BottomNavBarForProfile> createState() => _BottomNavBarForProfileState();
}
class _BottomNavBarForProfileState extends State<BottomNavBarForProfile> {
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
                MaterialPageRoute(builder: (context) =>  MyCargosScreen()));
          }
          if (value == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>   KargoHomeScreen()));
          }
          if (value == 2) {
          }
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
            icon: Icon(Icons.manage_accounts, color: kargoPrimaryColor,),
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



