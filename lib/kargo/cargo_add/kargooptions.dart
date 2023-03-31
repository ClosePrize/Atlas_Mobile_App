import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:v01/kargo/widgets/reusable_widgets.dart';
import 'package:v01/kargo/widgets/talep_onay.dart';
import 'package:http/http.dart' as http;
import 'kargo_inf.dart';
class KargoOptions extends StatefulWidget {
  const KargoOptions({super.key});

  @override
  State<KargoOptions> createState() => _KargoOptionsState();
}

class _KargoOptionsState extends State<KargoOptions> {
      TextEditingController _siparisTextController = TextEditingController();
      Demandinf demandinf = Demandinf();
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

  final items = ["Trendyol Grup", "n11","Amazon Türkiye", "Ptt AVM"];
  String? value;
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 50,),
               SizedBox(
                width: double.infinity,
                child: Container (
                  child: Text(
                    "Kargonun Alınacağı Şirket",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ) ,
              ),
            const SizedBox(height: 15,),
            Container(
              width: MediaQuery.of(context).size.width/1.2,
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical:4,
              ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30)
            ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  borderRadius: BorderRadius.circular(30),
                  value: value,
                  iconSize: 36,
                  icon: const Icon(Icons.arrow_drop_down,color: Colors.black,),
                  isExpanded: true,
                  items: items.map(buildMenuItem).toList(), 
                  onChanged: (value)=>setState(() => 
                    this.value= value,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,),
              SizedBox(
                width: double.infinity,
                child: Container (
                  // ignore: prefer_const_constructors
                  child: Text(
                    "Sipariş No",
                    textAlign: TextAlign.left,
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ) ,
              ),
              const SizedBox(
              height: 15,),
       reusableTextField(
            "Sipariş Numarası", Icons.shopping_bag,false, _siparisTextController), 
                  SizedBox(
              height: 60,),
              firebaseUIButton(context, "Kargomu Getir", (){
              if(value != null && _siparisTextController.text != null){
                getCurrentLocation(value);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const TalepOnayScreen()))
                    .then((value) {

                });
              }
              else{
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text('Lütfen sipariş no ve kargonun alınacağı şirketin adını giriniz.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, 'Onayla');
                          },
                          child: const Text('Tamam'),
                        ),
                      ],
                    );
                  },
                );
              }
            })
          ],
        ),
      ),
    );
  }
  DropdownMenuItem<String> buildMenuItem (String item) =>
  DropdownMenuItem(value: item,
  child: Text(
    item, style: const TextStyle(
      fontWeight: FontWeight.normal, fontSize: 17),),);

      void sendDemand(String value,latitude, longitude) async {
        print("çalışıyor");
        final FirebaseAuth auth = FirebaseAuth.instance;
        final User? user = auth.currentUser;
        var uid = user?.uid.toString();
        var _uidTextController = uid.toString();
        demandinf = Demandinf(type: "0", title: value, siparis_numarasi: _siparisTextController.text, uid: _uidTextController, lat: latitude, lon: longitude);
        var response = await http.post(Uri.parse("http://185.77.96.79:8000/api/demands/"),
            headers: {"Content-type": "application/json"},
            body: json.encode(demandinf.toJson()));
        print(response.body);}
  
}