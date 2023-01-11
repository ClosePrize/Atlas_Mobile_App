import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'post.dart';

class RemoteService {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    var uid = user?.uid.toString();
    var _uidTextController = uid.toString();
    print(_uidTextController);

    var uri = Uri.parse('http://185.77.96.79:8000/api/user/'+_uidTextController!);
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var result = response.body;
      print(json.decode(response.body)[0]['demands'].length);
      print(response.body);
      return postFromJson(result);
    }
  }
}