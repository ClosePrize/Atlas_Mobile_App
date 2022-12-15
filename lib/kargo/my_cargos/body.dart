import 'package:flutter/material.dart';
import '../widgets/reusable_widgets.dart';
import 'package:v01/kargo/map/map.dart';
import 'package:v01/kargo/home/kargohome.dart';

class MyKargosBody extends StatelessWidget {
  const MyKargosBody({super.key});

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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(40, 50, 40, 10),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                mykargosbutton(context,
                    (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GoogleMap()));
                  }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}