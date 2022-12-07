import 'package:flutter/material.dart';


class KargoBody extends StatelessWidget {
  const KargoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        
        child: Column(
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
          height: MediaQuery.of(context).size.height/10,
        ),
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
      text: ' \n\nNasıl Kargo Eklenir?  \n\n',
      style: TextStyle(
        fontSize: 25,fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline),
        children: <TextSpan>[
        TextSpan(
              text: '•Kargo ekle tuşuna basınız.\n\n•Kargonuzun ait olduğu firma adını seçiniz.\n\n•Sipariş numaranızı giriniz.\n\n•Kargomu getir tuşuna basarak kaydınızı oluşturunuz.\n',
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,
        decoration: TextDecoration.none
              )),
        // can add more TextSpans here...
      ],
        ),),
  ),

      
            )
      
          ),
          
        ),
        
          ],
          
      ),
      
      )
      
      );
        
  }
}