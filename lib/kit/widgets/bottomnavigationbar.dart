import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:v01/kit/home/home.dart';
import 'package:v01/kit/taleplerim/taleplerim.dart';
import '../profile/profile.dart';
import 'package:v01/kit/taleplerim/remote.dart';
import 'package:v01/animations.dart';

class KitHomeNavBar extends StatefulWidget {
 
  @override
  _KitHomeNavBarState createState() => _KitHomeNavBarState();
  
}

class _KitHomeNavBarState extends State<KitHomeNavBar> {
  late int currentIndex;
  var  currentIndex1;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
    currentIndex1 = 1;
  }

  void changePage(int? index) {
    setState(() {
      currentIndex = index!;
      currentIndex1 = index!;
    }
    
    );}

  @override
  Widget build(BuildContext context) {
    return  BubbleBottomBar(
      
        hasNotch: true,
        fabLocation: BubbleBottomBarFabLocation.end,
        opacity: .2,
        
        currentIndex:currentIndex1,
         onTap: (value) {
          if (value == 0) {
            changePage(0);
            Navigator.pushReplacement<void, void>(
              context,
              SlideLeftRoute(page: TaleplerimScreen());
            );
          }
          if (value == 1) {
            changePage(1);
          }
          if (value == 2) {
            changePage(2);
            Navigator.pushReplacement<void, void>(
              context,
              SlideRightRoute(page: KitProfilePage())
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
            backgroundColor: Colors.red,
            icon: Icon(
              Icons.card_giftcard,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.card_giftcard,
              color: Colors.red,
            ),
            title: Text("Taleplerim"),
          ),
          BubbleBottomBarItem(
              backgroundColor: Colors.red,
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.home,
              color: Colors.red,
            ),
              title: Text("Ana Sayfa")),
        BubbleBottomBarItem(
           backgroundColor: Colors.red,
            icon: Icon(
              Icons.manage_accounts,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.manage_accounts,
              color: Colors.red,
            ),
              title: Text("Profilim")),
         
        ],
      );
      
  }
  
}

class KitProfileNavBar extends StatefulWidget {
 
  @override
  _KitProfileNavBarState createState() => _KitProfileNavBarState();
  
}

class _KitProfileNavBarState extends State<KitProfileNavBar> {
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
              SlideLeftRoute(page: TaleplerimScreen())
              // MaterialPageRoute<void>(
              //   builder: (BuildContext context) =>  TaleplerimScreen(),
              // ),
            );
          }
          if (value == 1) {
            Navigator.pushReplacement<void, void>(
              context,
                SlideLeftRoute(page: KitHomePage())
              // MaterialPageRoute<void>(
              //   builder: (BuildContext context) =>  KitHomePage(),
              // ),
            );
          }
          if (value == 2) {
            // Navigator.pushReplacement<void, void>(
            //   context,
            //   MaterialPageRoute<void>(
            //     builder: (BuildContext context) =>  KitProfilePage(),
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
            backgroundColor: Colors.red,
            icon: Icon(
              Icons.card_giftcard,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.card_giftcard,
              color: Colors.red,
            ),
            title: Text("Taleplerim"),
          ),
          BubbleBottomBarItem(
             backgroundColor: Colors.red,
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.home,
              color: Colors.red,
            ),
              title: Text("Ana Sayfa")),
          BubbleBottomBarItem(
           backgroundColor: Colors.red,
            icon: Icon(
              Icons.manage_accounts,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.manage_accounts,
              color: Colors.red,
            ),
              title: Text("Profilim")),
         
        ],
      );
      
  }
  
}

class KitTaleplerimBar extends StatefulWidget {
 
  @override
  _KitTaleplerimBarState createState() => _KitTaleplerimBarState();
  
}

class _KitTaleplerimBarState extends State<KitTaleplerimBar> {


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
                SlideRightRoute(page: KitHomePage())
              // MaterialPageRoute<void>(
              //   builder: (BuildContext context) =>  KitHomePage(),
              // ),
            );
          }
          if (value == 2) {
            Navigator.pushReplacement<void, void>(
              context,
                SlideRightRoute(page: KitProfilePage())
              // MaterialPageRoute<void>(
              //   builder: (BuildContext context) =>  KitProfilePage(),
              // ),
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
            backgroundColor: Colors.red,
            icon: Icon(
              Icons.card_giftcard,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.card_giftcard,
              color: Colors.red,
            ),
            title: Text("Taleplerim"),
          ),
          BubbleBottomBarItem(
             backgroundColor: Colors.red,
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.home,
              color: Colors.red,
            ),
              title: Text("Ana Sayfa")),
               BubbleBottomBarItem(
           backgroundColor: Colors.red,
            icon: Icon(
              Icons.manage_accounts,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.manage_accounts,
              color: Colors.red,
            ),
              title: Text("Profilim")),
      
          
        ],
      );
      
  }
  
}

class KitInsideBar extends StatefulWidget {
 
  @override
  _KitInsideBarState createState() => _KitInsideBarState();
  
}

class _KitInsideBarState extends State<KitInsideBar> {


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
              SlideLeftRoute(page: TaleplerimScreen())
              // MaterialPageRoute<void>(
              //   builder: (BuildContext context) =>  TaleplerimScreen(),
              // ),
            );
          }
          if (value == 1) {
            // Navigator.pushReplacement<void, void>(
            //   context,
            //   // MaterialPageRoute<void>(
            //   //   builder: (BuildContext context) =>  KitHomePage(),
            //   // ),
            // );
          }
          if (value == 2) {
            Navigator.pushReplacement<void, void>(
              context,
              SlideRightRoute(page: KitProfilePage())
              // MaterialPageRoute<void>(
              //   builder: (BuildContext context) =>  KitProfilePage(),
              // ),
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
            backgroundColor: Colors.red,
            icon: Icon(
              Icons.card_giftcard,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.card_giftcard,
              color: Colors.red,
            ),
            title: Text("Taleplerim"),
          ),
          BubbleBottomBarItem(
             backgroundColor: Colors.red,
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.home,
              color: Colors.red,
            ),
              title: Text("Ana Sayfa")),
               BubbleBottomBarItem(
           backgroundColor: Colors.red,
            icon: Icon(
              Icons.manage_accounts,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.manage_accounts,
              color: Colors.red,
            ),
              title: Text("Profilim")),
      
          
        ],
      );
      
  }
  
}
