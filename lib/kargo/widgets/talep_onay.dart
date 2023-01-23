import 'package:flutter/material.dart';
import 'package:v01/kargo/constants.dart';
import 'package:v01/kargo/home/kargohome.dart';
import 'package:v01/kargo/widgets/bottomnavigationbar.dart';

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
          backgroundColor:const Color.fromARGB(255, 2, 12, 36),
          leading: IconButton(
            icon: Icon(
              Icons.close_rounded, color: Colors.white, size: 35,),
            onPressed: () => Navigator.pop(context, false)
          ),
          elevation: 2,
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
      // bottomNavigationBar: BottomNavBar(),
      body: TalepOnayScreen(),
    );
  }
}