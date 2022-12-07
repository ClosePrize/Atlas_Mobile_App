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
                child: RichText(text: 
                TextSpan(
                  style: TextStyle(background:Paint(
                  ) )
                )),
              )
              ,
        ),
      ],
        ),
        
      ),);  
  }
}