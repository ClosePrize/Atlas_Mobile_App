import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:v01/kargo/widgets/reusable_widgets.dart';
import 'package:v01/kargo/widgets/talep_onay.dart';
import 'package:http/http.dart' as http;
import 'kargo_inf.dart';
import 'package:v01/kargo/map/remote.dart';
class KargoOptions extends StatefulWidget {
  const KargoOptions({super.key});

  @override
  State<KargoOptions> createState() => _KargoOptionsState();
}

class _KargoOptionsState extends State<KargoOptions> {
      TextEditingController _siparisTextController = TextEditingController();
      Demandinf demandinf = Demandinf();
      LocationData? user_currentLocation;

    /*getCurrentLocation(kargoadi) async {
      Location location = Location();
      // GoogleMapController googleMapController = await _controller.future;
      location.getLocation().then(
            (location) {
          user_currentLocation = location;
          String location_lat = user_currentLocation!.latitude!.toString();
          String location_lon = user_currentLocation!.longitude!.toString();
          Future.delayed(Duration(milliseconds: 500), (){
            if(user_currentLocation != null){
            sendDemand(kargoadi, location_lat, location_lon);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TalepOnayScreen()));
            }
            else{
              showDialog<String>(
                  barrierColor: Colors.transparent,
                  useSafeArea: false,
                  context: context,
                  builder: (BuildContext context) => Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20,0,20,0),
                          child: Material(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height/12,
                              decoration: BoxDecoration(
                                //color: Color.fromARGB(255, 189, 23, 34).withOpacity(0.9),
                                color: Colors.red.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Container(
                                padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
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
        Future.delayed(Duration(milliseconds: 1500), (){
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
        );
      }
    }*/
    var kargomat_loc;
    @override
  void initState() {
      kargomat_loc = GetKargomatLocation().getLocation();
    super.initState();
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
       reusableNumberField(
            "Sipariş Numarası", Icons.shopping_bag,false, _siparisTextController), 
                  SizedBox(
              height: 60,),
              firebaseUIButton(context, "Kargomu Getir", () async {
              if(value != null && ((_siparisTextController.text).length) == 10){
                //getCurrentLocation(value);
                kargomat_loc = await GetKargomatLocation().getLocation();
                sendDemand(value!, kargomat_loc[0].lat.toString(), kargomat_loc[0].lon.toString());
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TalepOnayScreen()));
              }
              else if(value!=null && ((_siparisTextController.text).length) != 10){
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text('Sipariş numarası 10 haneli olmalıdır!'),
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
              else{
                //print((_siparisTextController.text).length);
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
        var response = await http.post(Uri.parse("http://127.0.0.1:8000/api/demands/"),
            headers: {"Content-type": "application/json"},
            body: json.encode(demandinf.toJson()));
        print(response.body);}
  
}
