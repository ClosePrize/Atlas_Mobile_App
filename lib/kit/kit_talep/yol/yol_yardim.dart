import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:v01/kargo/home/kargohome.dart';
import 'package:v01/kit/kit_talep/yol/yol_inf.dart';
import '../../../kargo/constants.dart';
import '../../taleplerim/talep_onay.dart';
import '../../widgets/bottomnavigationbar.dart';
import 'package:v01/kit/sepetim/cart_page_klon.dart';
import 'package:provider/provider.dart';
import 'package:v01/kit/widgets/items.dart';
import 'cart_model_yol.dart';

class YolYardimPage extends StatefulWidget{
  YolYardimPage({super.key});

  @override
  State<YolYardimPage> createState() => _YolYardimPageState();
}

class _YolYardimPageState extends State<YolYardimPage> {
  yolDemandinf yoldemandinf = yolDemandinf();
  LocationData? user_currentLocation;

  getCurrentLocation(kitadi2) async {
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        showDialog<String>(
            barrierColor: Colors.transparent,
            useSafeArea: false,
            context: context,
            builder: (BuildContext context) =>
                Container(
                  //color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        color: Colors.transparent,
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 60),
                        child: Material(
                          color: Colors.transparent,
                          child: Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            //height: MediaQuery.of(context).size.height/10,
                            decoration: BoxDecoration(
                              //color: Color.fromARGB(255, 189, 23, 34).withOpacity(0.9),
                              //color: Colors.red.withOpacity(0.1),
                              color: Color.fromARGB(255, 246, 220, 220),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                              child: Text(
                                "Konumunuza ulaşamadık. Lütfen,telefonunuzun konum özelliğini açınız.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,)
                    ],
                  ),
                )
        );
      }
    }
    if (_serviceEnabled) {
      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied ||
          _permissionGranted == PermissionStatus.deniedForever) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          showDialog<String>(
              barrierColor: Colors.transparent,
              useSafeArea: false,
              context: context,
              builder: (BuildContext context) =>
                Container(
                  //color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        color: Colors.transparent,
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 60),
                        child: Material(
                          color: Colors.transparent,
                          child: Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            //height: MediaQuery.of(context).size.height/10,
                            decoration: BoxDecoration(
                              //color: Color.fromARGB(255, 189, 23, 34).withOpacity(0.9),
                              //color: Colors.red.withOpacity(0.1),
                              color: Color.fromARGB(255, 246, 220, 220),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                              child: Text(
                                "Konumunuza ulaşamadık. Lütfen, uygulamanın konumunuza ulaşmasına izin veriniz.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,)
                    ],
                  ),
                )
          );
        }
      }
      if (_permissionGranted == PermissionStatus.granted || _permissionGranted == PermissionStatus.grantedLimited) {
        location.changeSettings(accuracy: LocationAccuracy.high);
        // GoogleMapController googleMapController = await _controller.future;
        location.getLocation().then(
              (location) {
            user_currentLocation = location;
            String location_lat = user_currentLocation!.latitude!.toString();
            String location_lon = user_currentLocation!.longitude!.toString();
            Future.delayed(Duration(milliseconds: 300), () {
              if (user_currentLocation != null) {
                sendDemand2(kitadi2, location_lat, location_lon);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => KitTalepOnayPage()));
              }
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
    }
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
      //   ),
      // ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(27,40, 27, 7),
          child: Consumer<CartModelYol>(
            builder: (context, value, child) {
              return GridView.builder(
                //  padding: const EdgeInsets.only(right:0, left:30),
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: value.shopItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 180
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
                            onPressed: () => Navigator.pop(context, 'İptal'),
                            child: const Text('İptal',
                              style: TextStyle(color: kitPrimaryColor),),
                          ),
                          TextButton(
                            onPressed: () { Navigator.pop(context, 'Onayla');
                            Provider.of<CartModelYol>(context, listen: false)
                                .addItemToCart(index);
                            //sendDemand2(value.shopItems[index][0]);
                            getCurrentLocation(value.shopItems[index][0]);
                            Navigator.pushReplacement<void, void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>  KitTalepOnayPage(),
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
  void sendDemand2(String kitadi3, latitude, longitude) async {
    print("çalışıyor");
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    var uid = user?.uid.toString();
    var _uidTextController = uid.toString();
    yoldemandinf = yolDemandinf(type: "1", kitname: kitadi3, uid: _uidTextController, lat: latitude, lon: longitude);
    var response = await http.post(Uri.parse("http://127.0.0.1:8000/api/demands/"),
        headers: {"Content-type": "application/json"},
        body: json.encode(yoldemandinf.toJson()));
    print(response.body);
  }
}
