import 'package:flutter/material.dart';
import 'package:v01/kargo/widgets/reusable_widgets.dart';
import 'package:v01/welcome.dart';
import '../../kargo/constants.dart';
import '../kit_talep/besin/besin.dart';
import '../kit_talep/saglik/saglik.dart';
import '../kit_talep/yol/yol_yardim.dart';

class KitHomeScreen extends StatefulWidget{
  const KitHomeScreen({Key? key}) : super(key: key);

  @override
  _KitHomeScreenState createState() => _KitHomeScreenState();
}

class _KitHomeScreenState extends State<KitHomeScreen>{

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Çıkış Onay'),
        content: const Text('Uygulamadan çıkış yapmak istediğinize emin misiniz?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'İptal'),
            child: const Text('İptal',
              style: TextStyle(color: Color(0xFFF44336)),),
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
    )) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          backgroundColor:Color.fromARGB(255, 230, 77, 54),
          leading: IconButton(
            icon: Icon(
              Icons.close_rounded, color:Color.fromARGB(255, 230, 77, 54).withOpacity(0), size: 30,),
            onPressed: () {}
          ),
          elevation: 1,
         ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: kitgreenColor,
      //   onPressed: () => Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) {
      //         return CartPage1();
      //       },
      //     ),
      //   ),
      //   child: const Icon(Icons.shopping_bag
      //   ),
      // ),
      
      
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
          child: Column(
            children: <Widget>[
         
              SizedBox(
                height: 40,
              ),
              kit_button(context, 'assets/saglık_kitleri/saglikkitleri.png', (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SaglikPage()));
              } ),
              SizedBox(
                height: 30,
              ),
              kit_button(context,'assets/yol_yardim_kitleri/yolyardimkitleri.png', (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => YolYardimPage()));
              } ),
              SizedBox(
                height: 30,
              ),
              kit_button(context,'assets/besin_kitleri/besinkitleri.png', (){
                 Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BesinPage()));
              } ),
              SizedBox(
                height: 30,
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
    );
  }
}

