import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:v01/animations.dart';
import 'package:v01/kargo/widgets/reusable_widgets.dart';
import 'package:v01/kargo/map/map.dart';
import 'package:v01/kargo/constants.dart';
import 'package:v01/kit/home/home.dart';
import 'package:v01/kit/taleplerim/remote.dart';
import 'package:v01/welcome.dart';
import 'package:v01/kit/profile/remote_service.dart';

import '../map/map.dart';
import 'demands.dart';

class TaleplerimBody extends StatefulWidget{
  const TaleplerimBody({Key? key}) : super(key: key);

  //method() => createState()._addCardWidget();

  @override
  // ignore: library_private_types_in_public_api
  _TaleplerimBodyState createState() => _TaleplerimBodyState();
}

class _TaleplerimBodyState extends State<TaleplerimBody> {

  final RemoteService1 http_class = new RemoteService1();
  //final TaleplerimBody tal123 = new TaleplerimBody();

  //List<Widget> _cardList = [];

  /*void _addCardWidget() {
    print("fonk çağrıldı");
    /*setState(() {
      _cardList.add(_card());
      });*/
  }*/

  List<Demands>? demands1;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData1();
  }

  var kit_adi = "";
  var siparis_tarihi = "";
  var siparis_numarasi = "";
  var kit_durumu = "";
  var siparis_sayisi = 0;

  getData1() async {
    demands1 = await RemoteService1().getPosts1();
    if (demands1 != null) {
      /*kit_adi = demands1![index].title ?? ""
      siparis_tarihi = demands1![index].created!.replaceRange(10, 27, "") ?? "",
      siparis_numarasi = demands1![index].password ?? "",
      kit_durumu = demands1![index].uid ?? "");*/
      siparis_sayisi = demands1!.length;
      setState(() {
        isLoaded = true;
        //print()
      });
    }
    if (demands1 == null){
      siparis_sayisi = 0;
      /*username = "";
      email = "";
      password = "";
      phone = "";*/
      isLoaded = false;
    }
  }
  my_var(index){
    if(demands1 != null){
      kit_adi = demands1![index].title ?? "";
      siparis_tarihi = demands1![index].created!.replaceRange(10, 27, "") ?? "";
      siparis_numarasi = demands1![index].uid ?? "";
      kit_durumu = demands1![index].status ?? "";
      return kit_adi;
    }
    else{
      return kit_adi;
    }
  }

  my_var1(index){
    if(demands1 != null){
      kit_adi = demands1![index].title ?? "";
      siparis_tarihi = demands1![index].created!.replaceRange(10, 27, "") ?? "";
      siparis_numarasi = demands1![index].uid ?? "";
      kit_durumu = demands1![index].status ?? "";
      return siparis_tarihi;
    }
    else{
      return siparis_tarihi;
    }
  }

  my_var2(index){
    if(demands1 != null){
      kit_adi = demands1![index].title ?? "";
      siparis_tarihi = demands1![index].created!.replaceRange(10, 27, "") ?? "";
      siparis_numarasi = demands1![index].uid!.replaceRange(7, 35, "") ?? "";
      kit_durumu = demands1![index].status ?? "";
      return siparis_numarasi;
    }
    else{
      return siparis_numarasi;
    }
  }

  my_var3(index){
    if(demands1 != null){
      kit_adi = demands1![index].title ?? "";
      siparis_tarihi = demands1![index].created!.replaceRange(10, 27, "") ?? "";
      siparis_numarasi = demands1![index].uid ?? "";
      kit_durumu = demands1![index].status ?? "";

      if(kit_durumu == "00"){
        kit_durumu = "Talebiniz Alındı";
      }
      else if(kit_durumu == "01"){
        kit_durumu = "Hazırlanıyor";
      }
      else if(kit_durumu == "02"){
        kit_durumu = "Dağıtımda";
      }
      else if(kit_durumu == "03"){
        kit_durumu = "Kargonuz Adreste";
      }
      else if(kit_durumu == "04"){
        kit_durumu = "Teslim Edildi";
      }
      else{
        kit_durumu = "İptal edildi";
      }
      return kit_durumu;
    }
    else{
      return kit_durumu;
    }
  }

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
                SlideLeftRoute(page: LogosPage())
                // MaterialPageRoute<void>(
                //   builder: (BuildContext context) => LogosPage(),
                // ),
              );
              FirebaseAuth.instance.signOut();
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
      child:Scaffold(
      appBar: AppBar(
        backgroundColor:kitPrimaryColor,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back, color: Colors.white, size: 30,),
            onPressed: () =>
                Navigator.pushReplacement<void, void>(
              context,
              SlideRightRoute(page: KitHomePage())
              // MaterialPageRoute<void>(
              //   builder: (BuildContext context) => KitHomePage(),
              // ),
            )
        ),
        elevation: 1,
      ),
        body: siparis_sayisi == 0
          ? const Center(child: Text("Verilmiş Siparişiniz Bulunmamaktadır."))
            : Padding(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                child:Center(
                  child: ListView.builder(
                    itemCount: siparis_sayisi,
                      itemBuilder: (context, index){
                      return taleplerimbutton(context, (){
                        //if (my_var3(index) == "Dağıtımda" || my_var3(index) == "Kargonuz Adreste"){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GoogleMapForKit()));
                          //}
                        },my_var(index),my_var3(index),my_var1(index),my_var2(index));
                          //http_class.kit[index]['title'],http_class.kit[index]['status'],http_class.kit[index]['created'],http_class.kit[index]['uid']);
                        //demands1![index].title ?? "",demands1![index].status ?? "", demands1![index].created!.replaceRange(10, 27, "") ?? "", demands1![index].uid ?? "");
                      //"Sokak Hayvanları","Teslim Edildi","10/01/2023","123454154351");
                        //_cardList[index];
                      }
                  ),
                ),
             ),

      /*body: Container(
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
      ),*/
     ),
    );
  }
}
