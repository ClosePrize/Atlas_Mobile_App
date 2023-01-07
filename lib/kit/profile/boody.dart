
import 'package:flutter/material.dart';

import 'post.dart';
import 'remote_service.dart';

class KitProfileScreen extends StatefulWidget {
  const KitProfileScreen({Key? key}) : super(key: key);

  @override
  _KitProfileScreenState createState() => _KitProfileScreenState();
}

class _KitProfileScreenState extends State<KitProfileScreen> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }

  getData() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        
        visible: isLoaded,
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          posts![index].title,
                        ),
                        Text(
                          posts![index].body ?? '',
                        ),
                      ],
                    ),
            );
          },
        ),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}