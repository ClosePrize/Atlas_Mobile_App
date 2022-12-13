import 'package:flutter/material.dart';
import 'package:v01/kargo/widgets/reusable_widgets.dart';
import 'package:v01/kargo/map/map.dart';
import 'package:v01/kargo/constants.dart';
import 'package:v01/kit/home/home.dart';

class TaleplerimBody extends StatelessWidget {
  const TaleplerimBody({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          backgroundColor: kitPrimaryColor,
          leading: IconButton(
            icon: const Icon(
              Icons.close_rounded, color: Colors.white, size: 30,),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const KitHomePage())),
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