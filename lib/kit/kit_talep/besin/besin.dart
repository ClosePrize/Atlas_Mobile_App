import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:v01/kargo/constants.dart';
import 'package:v01/kit/taleplerim/talep_onay.dart';
import 'package:v01/kit/widgets/bottomnavigationbar.dart';
import 'package:v01/kit/widgets/items.dart';
import '../../../kargo/home/kargohome.dart';
import 'besin_inf.dart';
import 'cart_model_besin.dart';
import 'package:v01/kit/sepetim/cart_page_klon.dart';
import 'package:v01/kit/taleplerim/body.dart';
import 'package:http/http.dart' as http;

class BesinPage extends StatefulWidget {
  const BesinPage({super.key});

  @override
  State<BesinPage> createState() => _BesinPageState();
}

class _BesinPageState extends State<BesinPage> {
  //final TaleplerimBody tal123 = new TaleplerimBody();
  besinDemandinf besindemandinf = besinDemandinf();
  LocationData? user_currentLocation;

  getCurrentLocation(kitadi1) async {
    Location location = Location();
    // GoogleMapController googleMapController = await _controller.future;
    location.getLocation().then(
          (location) {
        user_currentLocation = location;
        String location_lat = user_currentLocation!.latitude!.toString();
        String location_lon = user_currentLocation!.longitude!.toString();
        Future.delayed(Duration(seconds: 1), (){
          sendDemand(kitadi1, location_lat, location_lon);
        });
      },
    );

    location.onLocationChanged.listen((newLoc) {
      user_currentLocation = newLoc;
      String location_lat = user_currentLocation!.latitude!.toString();
      String location_lon = user_currentLocation!.longitude!.toString();

      setState(() {});
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
          backgroundColor:kitPrimaryColor,
          leading: IconButton(
            icon: Icon(
              Icons.close_rounded, color: Colors.white, size: 30,),
            onPressed: () => Navigator.pop(context, false)
          ),
          elevation: 1,
         ),
          bottomNavigationBar: KitInsideBar(),
           floatingActionButton: FloatingActionButton(
          onPressed: () {  Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) =>  KargoHomeScreen(),
              ),
            );  },
          child: ClipRRect(child:Image.asset('assets/kargologo.png',
         
            fit: BoxFit.fitHeight,height: 120,),borderRadius: BorderRadius.circular(40),),
),
floatingActionButtonLocation: FloatingActionButtonLocation.endDocked, 
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: kitgreenColor,
      //   onPressed: () => Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) {
      //         return CartPage1();
      //       },
      //     ),
      //   ),
      //   child: const Icon(Icons.shopping_bag
      //     ),
      //   ),
           body: Container(
             child: Padding(
              padding: EdgeInsets.fromLTRB(27,60, 27, 7),
              child: Consumer<CartModel>(
              builder: (context, value, child) {
               return GridView.builder(
                //  padding: const EdgeInsets.only(right:0, left:30),
                 // physics: const NeverScrollableScrollPhysics(),
                 itemCount: value.shopItems.length,
                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 1,
                   mainAxisSpacing: 25,
                   mainAxisExtent: 160
                   // childAspectRatio: 1 / 1.2,
                 ),
                 itemBuilder: (context, index) {
                   return CardItems(
                     kitName: value.shopItems[index][0],
                     // itemPrice: value.shopItems[index][1],
                     imagePath: value.shopItems[index][1],
                     // color: value.shopItems[index][3],
                     onPressed: () => showDialog<String>(
                       context: context,
                       builder: (BuildContext context) => AlertDialog(
                         title: const Text('Kit Onay'),
                         content: const Text('Bu kiti seçmek istediğinize emin misiniz?'),
                         actions: <Widget>[
                           TextButton(
                             onPressed: () { Navigator.pop(context, 'İptal');
                             },
                             child: const Text('İptal',
                               style: TextStyle(color: kitPrimaryColor),),
                           ),
                           TextButton(
                             onPressed: () { Navigator.pop(context, 'Onayla');
                                 Provider.of<CartModel>(context, listen: false)
                                 .addItemToCart(index);
                             //tal123.method();
                             //sendDemand(value.shopItems[index][0]);
                             getCurrentLocation(value.shopItems[index][0]);

                             Navigator.pushReplacement<void, void>(
                               context,
                               MaterialPageRoute<void>(
                                 builder: (BuildContext context) => KitTalepOnayPage(),
                               ),
                             );
                             },
                             child: const Text('Onayla'),
                           ),
                         ],
                       ),
                     ),
                   );
                 },
               );
             },
          ),
        ),
      ),
    );
  }
  void sendDemand(String kitadi1,latitude, longitude) async {
    print("çalışıyor");
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    var uid = user?.uid.toString();
    var _uidTextController = uid.toString();
    besindemandinf = besinDemandinf(type: "1", kitname: kitadi1, uid: _uidTextController, lat: latitude, lon: longitude);
    var response = await http.post(Uri.parse("http://185.77.96.79:8000/api/demands/"),
        headers: {"Content-type": "application/json"},
        body: json.encode(besindemandinf.toJson()));
    print(response.body);}
}
