import 'package:flutter/material.dart';
import 'package:v01/kargo/constants.dart';
import 'package:v01/kargo/widgets/reusable_widgets.dart';
import 'package:v01/kit/home/home.dart';
import 'package:v01/kit/sepetim/cart_page.dart';

class KitOzelScreen extends StatefulWidget{
  const KitOzelScreen({Key? key}) : super(key: key);

  @override
  _KitOzelScreenState createState() => _KitOzelScreenState();
}

class _KitOzelScreenState extends State<KitOzelScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:kitPrimaryColor,
        leading: IconButton(
            icon: Icon(
              Icons.close_rounded, color: Colors.white, size: 30,),
            onPressed: () => Navigator.pop(context, false)
        ),
        elevation: 1,
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
                //SearchButton('Aramak isteğinizi giriniz', Icons.search),
                SizedBox(
                  height: 40,
                ),
                kit_button1(context, '', 'assets/saglık_kitleri/kalpkrizikiti.png'),
                SizedBox(
                  height: 30,
                ),
                kit_button1(context, '','assets/saglık_kitleri/astimkiti.png'),
                SizedBox(
                  height: 30,
                ),
                kit_button1(context, '','assets/saglık_kitleri/pandemikiti.png'),
                SizedBox(
                  height: 30,
                ),
                kit_button1(context, '', 'assets/saglık_kitleri/hijyenkiti.png'),
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CartPage();
            },
          ),
        ),
        child: const Icon(Icons.shopping_bag
        ),
      ),
    );
  }
}

