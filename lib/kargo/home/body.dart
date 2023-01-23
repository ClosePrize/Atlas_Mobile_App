// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:v01/kit/home/home.dart';
import '../../welcome.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../cargo_add/cargo_add.dart';
import '../constants.dart';
import '../widgets/reusable_widgets.dart';

class KargoBody extends StatefulWidget {
  const KargoBody({super.key});

  @override
  State<KargoBody> createState() => _KargoBodyState();
}

class _KargoBodyState extends State<KargoBody> {
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
      onWillPop: _onWillPop, child: Column(
        children: [
          
              Flexible(
                child: Container(
                  height: MediaQuery.of(context).size.height*0.3,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft:Radius.circular(50),
                    bottomRight: Radius.circular(50) ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image:AssetImage("assets/kargoslogan.png"),
                    ),
                  ),

                )
                ,

          ),
          SizedBox(height: 50,),
          Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Container(
                alignment:Alignment.center,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(3, 3),
              )
              ]
                  ),
            child: const Padding(
              padding: EdgeInsets.only(right:10.0, left: 20, bottom: 30),
              child: Text.rich(TextSpan(
              text: ' \n\n Nasıl Kargo Eklenir?  \n\n',
              style: TextStyle(
                fontSize: 25,fontWeight: FontWeight.bold, fontFamily: "Caveat",
                decoration: TextDecoration.underline),
                children: <TextSpan>[
                TextSpan(
                  
                      text: "• Kargo ekle tuşuna basınız.",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,fontFamily: "Caveat",
                decoration: TextDecoration.none,
                      ),
                      ),
                      TextSpan(
                      text: '\n• Kargonuzun ait olduğu firma adını seçiniz.',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,fontFamily: "Caveat",
                decoration: TextDecoration.none
                      ),
                      ),
                      TextSpan(
                      text: '\n• Sipariş numaranızı giriniz.',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal, fontFamily: "Caveat",
                decoration: TextDecoration.none
                      ),
                      ),
                      
                      TextSpan(
                      text: '\n• Kargomu getir tuşuna basıp kaydınızı oluşturunuz.',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,fontFamily: "Caveat",
                decoration: TextDecoration.none
                      ),
                      ),
                // can add more TextSpans here...
              ],
                ),


                ),

            ),

            ),



                )),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(right:20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
          height: 70,
          width: MediaQuery.of(context).size.width/2,
          child:
                      ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Material(
              child: InkWell(
                      onTap: (){
                        
                        Navigator.push(context,
                              MaterialPageRoute(builder: (context) => KargoAddScreen()));
                      },
                      child: Ink(
                          // ignore: sort_child_properties_last
                          child: const Center(
                            child: Text(
                              'Kargo Ekle',
                              style: TextStyle(
                                fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Caveat"
                              ),
                            ),
                          ),
                          decoration: const BoxDecoration(
                            color: kargoPrimaryColor,
                            /*image: DecorationImage(
                                image: AssetImage(
                                    assetName),
                                fit: BoxFit.fill,
                              )*/
                          )
                      ),
              ),
            ),),),
                    ],
                  ),
                )
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     firebaseUIButton(context, "Kargo Ekle", (){}),
                //   ],
                // )
        ],
      ),
     
    );
  }
}

