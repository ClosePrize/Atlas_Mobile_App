import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:v01/kit/map/remote.dart';
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

  void getCurrentLocation() async {
    Location location = Location();
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

      setState(() {});

    }
    );
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
    Future.delayed(Duration(seconds: 1), (){
      getData1();
    });

    if (demands2 != null) {

      setState(() {

      });
    }
    if (demands2 == null){
      demands2 = [{'lat':0,'lon':0}];

    }
  }

  @override
  void initState() {
    setCustomMarkerIcon();
    getCurrentLocation();
    getData1();
    //getPeriodicStream();
    // getPolyPoints();
    super.initState();
  }



  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor:kitPrimaryColor,
        leading: IconButton(
            icon: Icon(
              Icons.close_rounded, color: Colors.white, size: 30,),
            onPressed: () { /*Navigator.pop(context, false);
              Navigator.push(context, MaterialPageRoute(builder: (context) => TaleplerimScreen()));*/
              Navigator.pop(context, false);
              /*Navigator.pushReplacement<void, void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => TaleplerimScreen(),
                ),
              );*/
            }
        ),
        elevation: 1,
      ),
        body: user_currentLocation == null
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
              position: LatLng(/*user_currentLocation!.latitude!, user_currentLocation!.longitude!*/40.989241, 28.725452),
            ),
            Marker(
              markerId: const MarkerId("drone"),
              position: LatLng(demands2[0].lat, demands2[0].lon),
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