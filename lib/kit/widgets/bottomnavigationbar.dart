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
        if (_selectedIndex == value){
          }
        else{
          if (value == 0) {
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const TaleplerimScreen(),
              ),
            );
          }
          if (value == 1) {
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const KitHomePage(),
              ),
            );
          }
          if (value == 2) {
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const KitProfilePage(),
              ),
            );
            //Navigator.popAndPushNamed(context, 'KitProfilePage');
          }
        };
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

class KitBottomNavBarForHome extends StatefulWidget {
  const KitBottomNavBarForHome({super.key});

  @override
  State<KitBottomNavBarForHome> createState() => _KitBottomNavBarForHomeState();
}
class _KitBottomNavBarForHomeState extends State<KitBottomNavBarForHome> {
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
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const TaleplerimScreen(),
              ),
            );
          }
          if (value == 1) {
            //Navigator.pop(context, false);
          }
          if (value == 2) {
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const KitProfilePage(),
              ),
            );
          }
        },


        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Taleplerim',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: kitPrimaryColor),
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

class KitBottomNavBarForTaleplerim extends StatefulWidget {
  const KitBottomNavBarForTaleplerim({super.key});

  @override
  State<KitBottomNavBarForTaleplerim> createState() => _KitBottomNavBarForTaleplerimState();
}
class _KitBottomNavBarForTaleplerimState extends State<KitBottomNavBarForTaleplerim> {
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
            //Navigator.pop(context, false);
          }
          if (value == 1) {
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const KitHomePage(),
              ),
            );
          }
          if (value == 2) {
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const KitProfilePage(),
              ),
            );
          }
        },


        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard,color: kitPrimaryColor),
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

class KitBottomNavBarForProfile extends StatefulWidget {
  const KitBottomNavBarForProfile({super.key});

  @override
  State<KitBottomNavBarForProfile> createState() => _KitBottomNavBarForProfileState();
}
class _KitBottomNavBarForProfileState extends State<KitBottomNavBarForProfile> {
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
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const TaleplerimScreen(),
              ),
            );
          }
          if (value == 1) {
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const KitHomePage(),
              ),
            );
          }
          if (value == 2) {
            //Navigator.pop(context, false);
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
            icon: Icon(Icons.manage_accounts, color: kitPrimaryColor),
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



