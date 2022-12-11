import 'package:flutter/material.dart';
import 'package:v01/kargo/constants.dart';
import 'package:v01/kit/home/home.dart';

import '../widgets/bottomnavigationbar.dart';

class KitTalepOnayScreen extends StatefulWidget{
  const KitTalepOnayScreen({Key? key}) : super(key: key);

  @override
  _KitTalepOnayScreenState createState() => _KitTalepOnayScreenState();
}

class _KitTalepOnayScreenState extends State<KitTalepOnayScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kitPrimaryColor,
          leading: IconButton(
            icon: Icon(
              Icons.close_rounded, color: Colors.white, size: 30,),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KitHomePage())),
          ),
          elevation: 0,
          title: const Text(
              "",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
          )
      ),
      body: Container(
        /*decoration: BoxDecoration(
          color: kbackgroundColor,
          image: DecorationImage(
            image: AssetImage(
              'assets/taleponay.png'
            )
          )
        ),*/
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(100, 120, 100, 0),
              child: Column(
                children: <Widget>[
                  Image.asset('assets/taleponay.png',
                  height: 400,
                  width: 700,)
                ],
            ),
          ),
        ),
      ),
    );
  }
}

class KitTalepOnayPage extends StatelessWidget{
  const KitTalepOnayPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kbackgroundColor,
      bottomNavigationBar: KitBottomNavBar(),
      body: KitTalepOnayScreen(),
    );
  }
}