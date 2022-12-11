import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:v01/kargo/constants.dart';
import 'package:v01/kargo/home/kargohome.dart';
import 'package:v01/kargo/kit_talep.dart';
import 'package:v01/kargo/widgets/talep_onay.dart';
import 'package:v01/kargo/widgets/bottomnavigationbar.dart';
import 'package:v01/kargo/widgets/reusable_widgets.dart';
import 'package:v01/kargo/signup.dart';

class KitOzelBesinScreen extends StatefulWidget{
  const KitOzelBesinScreen({Key? key}) : super(key: key);

  @override
  _KitOzelBesinScreenState createState() => _KitOzelBesinScreenState();
}

class _KitOzelBesinScreenState extends State<KitOzelBesinScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 2, 12, 36),
          leading: IconButton(
            icon: Icon(
              Icons.close_rounded, color: Colors.white, size: 30,),
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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(40, 50, 40, 10),
            child: Column(
              children: <Widget>[
                /*SizedBox(
                  height: 180,
                  width: 240,
                  child: Container(
                    color: Colors.white,
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => KargoKitTalepScreen()));
                      }
                    ),
                  ),
                ),*/
                reusableTextField_1('Aramak isteğinizi giriniz', Icons.search),
                SizedBox(
                  height: 40,
                ),
                kit_button1(context, '', 'assets/besin_kitleri/bebekmamasikiti.png'),
                SizedBox(
                  height: 25,
                ),
                kit_button1(context, '','assets/besin_kitleri/hazirgidakiti.png'),
                SizedBox(
                  height: 25,
                ),
                kit_button1(context, '','assets/besin_kitleri/sokakhayvanimamakiti.png'),
                SizedBox(
                  height: 25,
                ),
                //kit_button1(context, '',)
                /*firebaseUIButton_deneme(context,'Kiti Talep Et', () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => KargoKitTalepScreen()));
                })*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class KargoKitOzelBesinScreen extends StatelessWidget{
  const KargoKitOzelBesinScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kbackgroundColor,
      bottomNavigationBar: BottomNavBar(),
      body: KitOzelBesinScreen(),
    );
  }
}