import 'package:flutter/material.dart';
import 'package:v01/kargo/constants.dart';
import 'package:v01/kargo/home/kargohome.dart';
import 'package:v01/kargo/widgets/bottomnavigationbar.dart';
import 'package:v01/kargo/widgets/reusable_widgets.dart';
import 'package:v01/kargo/signup.dart';

class TalepOnayScreen extends StatefulWidget{
  const TalepOnayScreen({Key? key}) : super(key: key);

  @override
  _TalepOnayScreenState createState() => _TalepOnayScreenState();
}

class _TalepOnayScreenState extends State<TalepOnayScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 2, 12, 36),
          leading: IconButton(
            icon: Icon(
              Icons.close, color: Colors.white, size: 50,),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KargoHomeScreen())),
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

class KargoTalepOnayScreen extends StatelessWidget{
  const KargoTalepOnayScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kbackgroundColor,
      bottomNavigationBar: BottomNavBar(),
      body: TalepOnayScreen(),
    );
  }
}