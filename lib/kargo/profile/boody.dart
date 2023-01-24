import 'package:flutter/material.dart';
import '../../kargo/constants.dart';
import '../../kargo/widgets/reusable_widgets.dart';
import '../../kit/home/home.dart';
import '../../welcome.dart';
import 'post.dart';
import 'remote_service.dart';


class KargoProfileScreen1 extends StatefulWidget {
  const KargoProfileScreen1({Key? key}) : super(key: key);

  @override
  _KargoProfileScreen1State createState() => _KargoProfileScreen1State();
}

class _KargoProfileScreen1State extends State<KargoProfileScreen1> {
  get index => 0;


  @override
  Future<bool> _onWillPop() async {
    return (await showDialog(
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
            },
            child: const Text('Onayla'),
          ),
        ],
      ),
      context: context,
    )) ?? false;
  }

  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }

  var username = "";
  var email = "";
  var password = "";
  var phone = "";

  getData() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      username = posts![index].username ?? "";
      email = posts![index].email ?? "";
      password = posts![index].password ?? "";
      phone = posts![index].phone ?? "";
      setState(() {
        isLoaded = true;
        //print()
      });
    }
    if (posts == null){
      username = "";
      email = "";
      password = "";
      phone = "";
      isLoaded = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: kbackgroundColor,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor:const Color.fromARGB(255, 2, 12, 36),
          leading: IconButton(
              icon: Icon(
                Icons.close_rounded, color: Colors.white, size: 35,),
              onPressed: () => Navigator.pop(context, false)
          ),
          elevation: 2,
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(22, 120, 22, 0),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/profile.png',
                    height: 100,
                    width: 100,),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container (
                      color: kbackgroundColor,
                      child: const Text(
                        "  Ad-Soyad",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ) ,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  reusableTextField_1(username,Icons.drive_file_rename_outline,),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container (
                      color: kbackgroundColor,
                      child: const Text(
                        "  E-Posta",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ) ,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  reusableTextField_1(email,Icons.drive_file_rename_outline,),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container (
                      color: kbackgroundColor,
                      child: const Text(
                        "  Şifre",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ) ,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  reusableTextField_1(password, Icons.drive_file_rename_outline,),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container (
                      color: kbackgroundColor,
                      child: const Text(
                        "  Cep Telefonu",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ) ,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  reusableTextField_1(phone,Icons.drive_file_rename_outline,),
                  const SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: [
                      // Row(children: [
                      //   ChangeButton(context, "ATLAS Kit"),
                      // ]),
                      Row(children: [
                        firebaseUIButton_1(context, kitblueColor)
                      ],
                        mainAxisAlignment: MainAxisAlignment.end,)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        //floatingActionButton: firebaseUIButton_1(context),
      ),
    );
  }
}
