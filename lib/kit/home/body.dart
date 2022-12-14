
import 'package:flutter/material.dart';
import 'package:v01/kargo/widgets/reusable_widgets.dart';
import '../kit_talep/besin/besin.dart';
import '../kit_talep/saglik/saglik.dart';
import '../kit_talep/yol/yol_yardim.dart';

class KitHomeScreen extends StatefulWidget{
  const KitHomeScreen({Key? key}) : super(key: key);

  @override
  _KitHomeScreenState createState() => _KitHomeScreenState();
}

class _KitHomeScreenState extends State<KitHomeScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
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
      ),*/
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
                SizedBox(
                  height: 40,
                ),
                kit_button(context, 'assets/saglık_kitleri/saglikkitleri.png', (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SaglikPage()));
                } ),
                SizedBox(
                  height: 25,
                ),
                kit_button(context,'assets/yol_yardim_kitleri/yolyardimkitleri.png', (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => YolYardimPage()));
                } ),
                SizedBox(
                  height: 25,
                ),
                kit_button(context,'assets/besin_kitleri/besinkitleri.png', (){
                   Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BesinPage()));
                } ),
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

