import 'package:flutter/material.dart';
import 'package:v01/kargo/widgets/reusable_widgets.dart';
import 'package:v01/kargo/map/map.dart';
import 'package:v01/kargo/constants.dart';
import 'package:v01/kit/home/home.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:v01/welcome.dart';

class TaleplerimBody extends StatefulWidget{
  const TaleplerimBody({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TaleplerimBodyState createState() => _TaleplerimBodyState();
}

class _TaleplerimBodyState extends State<TaleplerimBody> {

 /* @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  /*void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }*/

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
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
    );
    return false;
  }*/

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor:kitPrimaryColor,
        leading: IconButton(
            icon: Icon(
              Icons.close_rounded, color: Colors.white, size: 30,),
            onPressed: () => Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const KitHomePage(),
              ),
            )
        ),
        elevation: 1,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(40, 50, 40, 10),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                mykargosbutton(context,
                        (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => GoogleMap()));
                    }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}