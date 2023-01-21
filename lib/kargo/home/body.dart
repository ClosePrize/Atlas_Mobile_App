// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:v01/kit/home/home.dart';
import '../../welcome.dart';
import 'package:flutter/src/widgets/framework.dart';

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
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Center(

          child: Column(
            textDirection: TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.start,

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
          SizedBox(
            height:70,
          ),
          Stack(
            children:[ Padding(
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
            child: Flexible(
              child: const Padding(
                padding: EdgeInsets.only(right:10.0, left: 20, bottom: 30),
                child: Center(
            child: Text.rich(TextSpan(
              text: ' \n\nNasıl Kargo Eklenir?  \n\n',
              style: TextStyle(
                fontSize: 25,fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
                children: <TextSpan>[
                TextSpan(
                      text: '•Kargo ekle tuşuna basınız.\n\n•Kargonuzun ait olduğu firma adını seçiniz.\n\n•Sipariş numaranızı giriniz.\n\n•Kargomu getir tuşuna \nbasıp kaydınızı oluşturunuz.\n',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,
                decoration: TextDecoration.none
                      ),
                      ),
                // can add more TextSpans here...
              ],
                ),


                ),

                ),

              ),

            ),

            ),



                )


              ),

                // Positioned(left: 275,
                // bottom:0,child: addButton(),)

            ],

            ),


            ],

        ),

        ),
        floatingActionButton: FloatingActionButton(
          child: ClipRRect(child:Image.asset('assets/kitlogo.png',
            fit: BoxFit.fitHeight,height: 150,width:100 ,),borderRadius: BorderRadius.circular(40),),/*DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                'assets/kargologo.png'
              )
            )*/
          //borderRadius: BorderRadius.circular(90.0),
          onPressed: () {
            Navigator.pushReplacement<void, void>(
            context,
            MaterialPageRoute<void>(
                builder: (BuildContext context) => KitHomePage(),
          ),
        );
      }
    ),

      ),
    );
  }
}

