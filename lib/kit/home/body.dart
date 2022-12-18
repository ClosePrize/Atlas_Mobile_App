import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:v01/kargo/constants.dart';
import 'package:v01/kargo/widgets/reusable_widgets.dart';
import 'package:v01/welcome.dart';
import '../kit_talep/besin/besin.dart';
import '../kit_talep/saglik/saglik.dart';
import '../kit_talep/yol/yol_yardim.dart';
import 'package:v01/kit/sepetim/cart_page_klon.dart';

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
    )) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: kitgreenColor,
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CartPage1();
              },
            ),
          ),
          child: const Icon(Icons.shopping_bag
          ),
        ),
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
      ),
    );
  }
}

