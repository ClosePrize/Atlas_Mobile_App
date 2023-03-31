import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:v01/kit/map/remote.dart';
import 'package:v01/kit/taleplerim/taleplerim.dart';
import 'dart:async';
import 'dart:convert';
import '../../kargo/constants.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'dart:ffi';
import '../taleplerim/demands.dart';
import 'map_inf.dart';

double drone_lat = 0;
double drone_lon = 0;

class MapScreenForKit extends StatefulWidget {
  @override
  _MapScreenForKitState createState() => _MapScreenForKitState();
}


class _MapScreenForKitState extends State<MapScreenForKit>{
  final Completer<GoogleMapController> _controller = Completer();

  List<LatLng> polylineCoordinates = [];
  LocationData? user_currentLocation;

  BitmapDescriptor droneIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor droneLocationIcon = BitmapDescriptor.defaultMarker;

  /*void getCurrentLocation() async {
    Location location = Location();
    location.changeSettings(accuracy: LocationAccuracy.high);
    // GoogleMapController googleMapController = await _controller.future;
    location.getLocation().then(
          (location) {
        user_currentLocation = location;
        String location_lat = user_currentLocation!.latitude!.toString();
        String location_lon = user_currentLocation!.longitude!.toString();
        //sendRequest(location_lat, location_lon);
      },
    );

    location.onLocationChanged.listen((newLoc) {
      user_currentLocation = newLoc;
      String location_lat = user_currentLocation!.latitude!.toString();
      String location_lon = user_currentLocation!.longitude!.toString();

      if (this.mounted) {
        setState(() {
          // Your state change code goes here
        });
      }

    }
    );
  }*/
  void getCurrentLocation() async {
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

  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, "assets/drone.png")
        .then((icon) {
      droneLocationIcon = icon;
    });
  }
  var demands2;
  getData1() async {
    demands2 = await RemoteService2().getPosts2();
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
      getCurrentLocation();
      getData1();
      //getPeriodicStream();
      // getPolyPoints();
      super.initState();
    }
  }



  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor:kitPrimaryColor,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back, color: Colors.white, size: 30,),
            onPressed: () { //Navigator.pop(context, false);
              //Navigator.push(context, MaterialPageRoute(builder: (context) => TaleplerimScreen()));
              //Navigator.pop(context, false);
              //Navigator.(context, MaterialPageRoute(builder: (context) => TaleplerimScreen()))
              // Navigator.pop(context, false);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => TaleplerimScreen(),
                ),
              );
            }
        ),
        elevation: 1,
      ),
        body: user_currentLocation == null || demands2 == null
            ? const Center(child: Text("Yükleniyor..."))
            : GoogleMap(
          initialCameraPosition: CameraPosition(
              target: LatLng(/*user_currentLocation!.latitude!, user_currentLocation!.longitude!*//*40.989239, 28.725451*/demands2[0].lat, demands2[0].lon),
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
              markerId: const MarkerId("user_current"),
              //
              position: LatLng(user_currentLocation!.latitude!, user_currentLocation!.longitude!/*40.989241, 28.725452*/),
            ),
            Marker(
              markerId: const MarkerId("drone"),
              position: LatLng(demands2[0].lat, demands2[0].lon/*40.989239, 28.725451*/),
              icon: droneLocationIcon,
            ),
          },
          onMapCreated: (GoogleMapController) {
            _controller.complete(GoogleMapController);
          },
        )
    );
  }
}
