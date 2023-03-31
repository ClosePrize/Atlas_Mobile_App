import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'demands.dart';

class RemoteService1 {
  var demand_number;
  var kit;
  Future<List<Demands>?> getPosts1() async {
    var client = http.Client();
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    var uid = user?.uid.toString();
    var _uidTextController = uid.toString();
    print(_uidTextController);

    var uri = Uri.parse('http://185.77.96.79:8000/api/demands/'+_uidTextController!);
    var response = await client.get(uri);
    /*myvar() {
      return json.decode(response.body)[0]['demands'].length;
    }*/
    print(response.body);
    print(response.body.length);
    //demand_number = json.decode(response.body)[0]['demands'].length;
    //kit = json.decode(response.body)[0]['demands'];
    if (response.statusCode == 200) {
      var result1 = response.body;
      print(response.body.length);
      return postFromJson(result1);
    }
  }
}