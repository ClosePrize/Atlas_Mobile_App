import 'package:flutter/material.dart';
import 'package:v01/kargo/constants.dart';
import 'package:v01/kargo/home/body.dart';
import 'package:v01/kargo/widgets/bottomnavigationbar.dart';

import '../cargo_add/cargo_add.dart';

class KargoHomeScreen extends StatelessWidget {
  const KargoHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      backgroundColor: kbackgroundColor,
      bottomNavigationBar: BottomNavBar(),
      body:KargoBody() ,
      floatingActionButton: SizedBox(
          height: 70,
          width: MediaQuery.of(context).size.width/2,
          child: ClipRRect(
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
                          fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold
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
            ),
          )
      ),
    );
  }
}