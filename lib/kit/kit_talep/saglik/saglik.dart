import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:v01/kit/kit_talep/saglik/saglik_inf.dart';
import 'package:v01/kit/sepetim/cart_page_klon.dart';
import '../../../kargo/constants.dart';
import '../../../kargo/home/kargohome.dart';
import '../../taleplerim/talep_onay.dart';
import '../../widgets/bottomnavigationbar.dart';
import 'package:provider/provider.dart';
import 'package:v01/kit/widgets/items.dart';
import 'cart_model_saglik.dart';
import 'package:location/location.dart';

class SaglikPage extends StatefulWidget{
   SaglikPage({super.key});

  @override
  State<SaglikPage> createState() => _SaglikPageState();
}

class _SaglikPageState extends State<SaglikPage> {
  saglikDemandinf saglikdemandinf = saglikDemandinf();
  LocationData? user_currentLocation;

  getCurrentLocation(kitadi2) async {
    Location location = Location();
    location.changeSettings(accuracy: LocationAccuracy.high);
    // GoogleMapController googleMapController = await _controller.future;
    location.getLocation().then(
          (location) {
        user_currentLocation = location;
        String location_lat = user_currentLocation!.latitude!.toString();
        String location_lon = user_currentLocation!.longitude!.toString();
        Future.delayed(Duration(milliseconds: 300), (){
          if(user_currentLocation != null){
            sendDemand1(kitadi2, location_lat, location_lon);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => KitTalepOnayPage()));
          }
          else{
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
                                    "Konumunuza ulaşamadık. Lütfen,telefonunuzun konum özelliğini açınız ve uygulamanın konumunuza ulaşmasına izin veriniz.",
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
        });
        Future.delayed(Duration(milliseconds: 300), () {
          if (location_lat == null) {
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
                                    "Konumunuza ulaşamadık. Lütfen,telefonunuzun konum özelliğini açınız ve uygulamanın konumunuza ulaşmasına izin veriniz.",
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
    if(user_currentLocation == null){
      //print("çalışıyor");
      /*Future.delayed(Duration(milliseconds: 1500), (){
        showDialog<String>(
            barrierColor: Colors.transparent,
            useSafeArea: false,
            context: context,
            builder: (BuildContext context) => Container(
              //color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.fromLTRB(20,0,20,60),
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        //height: MediaQuery.of(context).size.height/10,
                        decoration: BoxDecoration(
                          //color: Color.fromARGB(255, 189, 23, 34).withOpacity(0.9),
                          //color: Colors.red.withOpacity(0.1),
                          color:Color.fromARGB(255, 246, 220, 220),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                          child: Text(
                            "Konumunuza ulaşamadık. Lütfen,telefonunuzun konum özelliğini açınız ve uygulamanın konumunuza ulaşmasına izin veriniz.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,color: Colors.black),),
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
      );*/
    }
  }

  @override
  void initState() {
    super.initState();
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
          child: Consumer<CartModelSaglik>(
            builder: (context, value, child) {
              return GridView.builder(
                //  padding: const EdgeInsets.only(right:0, left:30),
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: value.shopItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 10,
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
                            onPressed: () => Navigator.pop(context, 'İptal'),
                            child: const Text('İptal',
                              style: TextStyle(color: kitPrimaryColor),),
                          ),
                          TextButton(
                            onPressed: () { Navigator.pop(context, 'Onayla');
                            Provider.of<CartModelSaglik>(context, listen: false)
                                .addItemToCart(index);
                            getCurrentLocation(value.shopItems[index][0]);
                            //sendDemand1(value.shopItems[index][0]);
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
  void sendDemand1(String kitadi2, latitude,longitude) async {
    print("çalışıyor");
    print(longitude+latitude);
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    var uid = user?.uid.toString();
    var _uidTextController = uid.toString();
    saglikdemandinf = saglikDemandinf(type: "1", kitname: kitadi2, uid: _uidTextController, lat: latitude,lon:longitude);
    var response = await http.post(Uri.parse("http://185.77.96.79:8000/api/demands/"),
        headers: {"Content-type": "application/json"},
        body: json.encode(saglikdemandinf.toJson()));
    print(response.body);
  }
}