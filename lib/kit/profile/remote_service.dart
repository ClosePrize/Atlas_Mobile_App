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

    var uri = Uri.parse('http://172.28.32.111:8000/api/user/'+_uidTextController!);
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }
}