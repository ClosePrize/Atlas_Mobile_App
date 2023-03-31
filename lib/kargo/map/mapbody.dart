import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:v01/kargo/home/kargohome.dart';
import 'package:v01/kargo/map/remote.dart';
import '../../welcome.dart';
import '../constants.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen>{
  final Completer<GoogleMapController> _controller = Completer();
  List<LatLng> polylineCoordinates = [];
  BitmapDescriptor droneIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor droneLocationIcon = BitmapDescriptor.defaultMarker;

  /*static const _initialCameraPosition = CameraPosition(
      target: LatLng(40.989239, 28.725451),
      zoom: 16.5,
  );*/

  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, "assets/drone.png")
        .then((icon) {
      droneLocationIcon = icon;
    });
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "assets/kargomaticon.png")
    .then((kargomaticon){
      droneIcon = kargomaticon;
    });
  }
  var demands2;
  var kargomat_loc;
  getData1() async {
    demands2 = await GetUAVLocation().getPosts2();
    kargomat_loc = await GetKargomatLocation().getLocation();
    print("burada demands2");
    print(demands2);
    if (demands2 != null) {

      if (this.mounted) {
        setState(() {
          // Your state change code goes here
        });
      }
    }
    if (demands2 == null){
      demands2 = [{'lat':0,'lon':0}];
    }
    Future.delayed(Duration(seconds: 1), (){
      getData1();
    });
  }
  @override
  void initState() {
    if(mounted){
      setCustomMarkerIcon();
      getData1();
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 2, 12, 36),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back, color: Colors.white, size: 30,),
            onPressed: () => Navigator.pop(context,false),
          //       Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => const KargoHomeScreen())),
          ),
          elevation: 0,
          title: const Text(
              "",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
          )
      ),
      body: kargomat_loc == null || demands2 == null
          ? const Center(child: Text("Çalışıyor..."))
          : GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(/*user_currentLocation!.latitude!, user_currentLocation!.longitude!*//*40.989239, 28.725451*//*demands2[0].lat, demands2[0].lon*/kargomat_loc[0].lat, kargomat_loc[0].lon),
            zoom: 16.5),
        polylines: {
          Polyline(
              polylineId: PolylineId("route"),
              points: polylineCoordinates,
              color: kitPrimaryColor,
              width: 6)
        },
        markers: {
          // yardım çağıran
          Marker(
            markerId: const MarkerId("Kargomat"),
            icon: droneIcon,
            position: LatLng(kargomat_loc[0].lat, kargomat_loc[0].lon/*40.989241, 28.725452*/),
              onTap: (){
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Çıkış Onay'),
                    content: const Text('Uygulamadan çıkış yapmak istediğinize emin misiniz?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'İptal'),
                        child: const Text('İptal',
                          style: TextStyle(color: Colors.red),),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, 'Onayla');
                          Navigator.pushReplacement<void, void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => LogosPage(),
                            ),
                          );
                          FirebaseAuth.instance.signOut();
                        },
                        child: const Text('Onayla'),
                      ),
                    ],
                  ),
                );
              }
          ),
          Marker(
            markerId: const MarkerId("drone"),
            position: LatLng(demands2[0].lat, demands2[0].lon/*40.989239, 28.725451*/),
            icon: droneLocationIcon,
            onTap: (){
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Çıkış Onay'),
                  content: const Text('Uygulamadan çıkış yapmak istediğinize emin misiniz?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'İptal'),
                      child: const Text('İptal',
                        style: TextStyle(color: Colors.red),),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, 'Onayla');
                        Navigator.pushReplacement<void, void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => LogosPage(),
                          ),
                        );
                        FirebaseAuth.instance.signOut();
                      },
                      child: const Text('Onayla'),
                    ),
                  ],
                ),
              );
            }
          ),
        },
        onMapCreated: (GoogleMapController) {
          _controller.complete(GoogleMapController);
        },
      )
    );
  }
}
