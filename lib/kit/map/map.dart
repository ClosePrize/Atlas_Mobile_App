import 'package:v01/kargo/map/mapbody.dart';
import 'package:flutter/material.dart';

import 'mapbody.dart';

class GoogleMapForKit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: MapScreenForKit(),
    );
  }
}