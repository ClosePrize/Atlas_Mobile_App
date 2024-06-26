/*import 'package:flutter/material.dart';
import 'package:v01/kargo/constants.dart';
import 'package:v01/kargo/home/kargohome.dart';
import 'package:v01/kargo/widgets/reusable_widgets.dart';
import 'package:v01/kargo/signup.dart';

class ProfileScreen1 extends StatefulWidget{
  const ProfileScreen1({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreen1State createState() => _ProfileScreen1State();
}

class _ProfileScreen1State extends State<ProfileScreen1>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      extendBodyBehindAppBar: true,
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
        width: MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: kbackgroundColor,),
          /*image: DecorationImage(
            image: AssetImage(
                'assets/atlaslogodeneme.png'),
            /*fit: ,*/
          ),
          shape: BoxShape.circle,
      )*/
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 120, 22, 0),
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/profile.png',
                height: 100,
                width: 100,),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: Container (
                  color: kbackgroundColor,
                  child: const Text(
                    "  Ad-Soyad",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ) ,
              ),
              const SizedBox(
                height: 10,
              ),
              reusableTextField_1('Datadan alınan ad-soyad',Icons.drive_file_rename_outline,),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: Container (
                  color: kbackgroundColor,
                  child: const Text(
                    "  E-Posta",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ) ,
              ),
              const SizedBox(
                height: 10,
              ),
              reusableTextField_1("Datadan alınan mail",Icons.drive_file_rename_outline,),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: Container (
                  color: kbackgroundColor,
                  child: const Text(
                    "  Şifre",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ) ,
              ),
              const SizedBox(
                height: 10,
              ),
              reusableTextField_1("datadan alınan şifre",Icons.drive_file_rename_outline,),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: Container (
                  color: kbackgroundColor,
                  child: const Text(
                    "  Cep Telefonu",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ) ,
              ),
              const SizedBox(
                height: 10,
              ),
              reusableTextField_1("Datadan alınan tel no",Icons.drive_file_rename_outline,),
              const SizedBox(
                height: 35,
              ),
            ],
          ),
        ),
     )),
      floatingActionButton: firebaseUIButton_1(context),
    );
}
}*/