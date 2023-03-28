import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:v01/kargo/home/kargohome.dart';
import 'package:v01/kargo/my_cargos/my_cargos.dart';
import 'package:v01/kit/home/home.dart';
import 'package:v01/kit/taleplerim/taleplerim.dart';
import '../profile/profile.dart';
import 'package:v01/kit/taleplerim/remote.dart';

class KargoHomeNavBar extends StatefulWidget {
 
  @override
  _KargoHomeNavBarState createState() => _KargoHomeNavBarState();
  
}

class _KargoHomeNavBarState extends State<KargoHomeNavBar> {
  late int currentIndex;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
  }

  void changePage(int? index) {
    setState(() {
      currentIndex = index!;   
    }
    
    );}

  @override
  Widget build(BuildContext context) {
    return  BubbleBottomBar(
      
        hasNotch: true,
        fabLocation: BubbleBottomBarFabLocation.end,
        opacity: .2,
        
        currentIndex:1,
         onTap: (value) {
          if (value == 0) {
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) =>  MyCargosScreen(),
              ),
            );
          }
          if (value == 1) {
           
          }
          if (value == 2) {
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) =>  KargoProfileScreen(),
              ),
            );
          }
        },

        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ), //border radius doesn't work when the notch is enabled.
        elevation:10 ,
        tilesPadding: EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
            backgroundColor:Colors.indigo,
            icon: Icon(
              Icons.card_giftcard,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.card_giftcard,
              color:Colors.indigo,
            ),
            title: Text("Kargolarım"),
          ),
          BubbleBottomBarItem(
              backgroundColor:Colors.indigo,
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.home,
              color:Colors.indigo,
            ),
              title: Text("Ana Sayfa")),
        BubbleBottomBarItem(
           backgroundColor:Colors.indigo,
            icon: Icon(
              Icons.manage_accounts,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.manage_accounts,
              color:Colors.indigo,
            ),
              title: Text("Profilim")),
         
        ],
      );
      
  }
  
}

class KargoProfileNavBar extends StatefulWidget {
 
  @override
  _KargoProfileNavBarState createState() => _KargoProfileNavBarState();
  
}

class _KargoProfileNavBarState extends State<KargoProfileNavBar> {
  late int currentIndex;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
  }

  void changePage(int? index) {
    setState(() {
      currentIndex = index!;   
    }
    
    );}

  @override
  Widget build(BuildContext context) {
    return  BubbleBottomBar(
        hasNotch: true,
        fabLocation: BubbleBottomBarFabLocation.end,
        opacity: .2,
        currentIndex:2,
         onTap: (value) {
          if (value == 0) {
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) =>  MyCargosScreen(),
              ),
            );
          }
          if (value == 1) {
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) =>  KargoHomeScreen(),
              ),
            );
          }
          if (value == 2) {
            // Navigator.pushReplacement<void, void>(
            //   context,
            //   MaterialPageRoute<void>(
            //     builder: (BuildContext context) =>  KargoProfileScreen(),
            //   ),
            // );
          }
        },

        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ), //border radius doesn't work when the notch is enabled.
       elevation:10 ,
        tilesPadding: EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        items: <BubbleBottomBarItem>[
           BubbleBottomBarItem(
            backgroundColor:Colors.indigo,
            icon: Icon(
              Icons.card_giftcard,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.card_giftcard,
              color:Colors.indigo,
            ),
            title: Text("Kargolarım"),
          ),
          BubbleBottomBarItem(
             backgroundColor:Colors.indigo,
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.home,
              color:Colors.indigo,
            ),
              title: Text("Ana Sayfa")),
          BubbleBottomBarItem(
           backgroundColor:Colors.indigo,
            icon: Icon(
              Icons.manage_accounts,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.manage_accounts,
              color:Colors.indigo,
            ),
              title: Text("Profilim")),
         
        ],
      );
      
  }
  
}

class CargosNavBar extends StatefulWidget {
 
  @override
  _CargosNavBarState createState() => _CargosNavBarState();
  
}

class _CargosNavBarState extends State<CargosNavBar> {


  @override
  Widget build(BuildContext context) {
    return  BubbleBottomBar(
        hasNotch: true,
        fabLocation: BubbleBottomBarFabLocation.end,
        opacity: .2,
        currentIndex:0,
         onTap: (value) {
          if (value == 0) {
            //Navigator.pop(context, false);
          }
          if (value == 1) {
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) =>  KargoHomeScreen(),
              ),
            );
          }
          if (value == 2) {
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) =>  KargoProfileScreen(),
              ),
            );
          }
        },

        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ), //border radius doesn't work when the notch is enabled.
       elevation:10 ,
        tilesPadding: EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        items: <BubbleBottomBarItem>[
           BubbleBottomBarItem(
            backgroundColor:Colors.indigo,
            icon: Icon(
              Icons.card_giftcard,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.card_giftcard,
              color:Colors.indigo,
            ),
            title: Text("Kargolarım"),
          ),
          BubbleBottomBarItem(
             backgroundColor:Colors.indigo,
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.home,
              color:Colors.indigo,
            ),
              title: Text("Ana Sayfa")),
               BubbleBottomBarItem(
           backgroundColor:Colors.indigo,
            icon: Icon(
              Icons.manage_accounts,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.manage_accounts,
              color:Colors.indigo,
            ),
              title: Text("Profilim")),
      
          
        ],
      );
      
  }
  
}

class CargoAddNavBar extends StatefulWidget {
 
  @override
  _CargoAddNavBarState createState() => _CargoAddNavBarState();
  
}

class _CargoAddNavBarState extends State<CargoAddNavBar> {


  @override
  Widget build(BuildContext context) {
    return  BubbleBottomBar(
        hasNotch: true,
        fabLocation: BubbleBottomBarFabLocation.end,
        opacity: .2,
        currentIndex:1,
         onTap: (value) {
           if (value == 0) {
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) =>  MyCargosScreen(),
              ),
            );
          }
          if (value == 1) {
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) =>  KargoHomeScreen(),
              ),
            );
          }
          if (value == 2) {
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) =>  KargoProfileScreen(),
              ),
            );
          }
        },

        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ), //border radius doesn't work when the notch is enabled.
       elevation:10 ,
        tilesPadding: EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        items: <BubbleBottomBarItem>[
           BubbleBottomBarItem(
            backgroundColor:Colors.indigo,
            icon: Icon(
              Icons.card_giftcard,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.card_giftcard,
              color:Colors.indigo,
            ),
            title: Text("Kargolarım"),
          ),
          BubbleBottomBarItem(
             backgroundColor:Colors.indigo,
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.home,
              color:Colors.indigo,
            ),
              title: Text("Ana Sayfa")),
               BubbleBottomBarItem(
           backgroundColor:Colors.indigo,
            icon: Icon(
              Icons.manage_accounts,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.manage_accounts,
              color:Colors.indigo,
            ),
              title: Text("Profilim")),
      
          
        ],
      );
      
  }
  
}