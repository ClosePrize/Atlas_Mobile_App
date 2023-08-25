import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'map_inf.dart';

class GetUAVLocation {
  Future<List<Locations>?> getPosts2() async {
    var client = http.Client();
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    var uid = user?.uid.toString();
    var _uidTextController = uid.toString();

    var uri = Uri.parse('http://127.0.0.1:8000/api/uav/');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var result1 = response.body;
      //print(response.body);
      return LocationFromJson(result1);
    }
  }
}

class GetKargomatLocation {
  Future<List<Kargomat>?> getLocation() async{
    var client = http.Client();
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    var uid = user?.uid.toString();
    var _uidTextController = uid.toString();

    var uri = Uri.parse('http://127.0.0.1:8000/api/kargomat/');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var result1 = response.body;
      //print(response.body);
      return KargomatFromJson(result1);
    }
  }
}