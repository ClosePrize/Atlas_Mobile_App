import 'package:flutter/material.dart';
import 'package:v01/kargo/widgets/reusable_widgets.dart';
import 'package:v01/kargo/map/map.dart';
import 'package:v01/kargo/constants.dart';
import 'package:v01/kit/home/home.dart';
import 'package:v01/welcome.dart';

class TaleplerimBody extends StatefulWidget{
  const TaleplerimBody({Key? key}) : super(key: key);

  method() => createState()._addCardWidget();

  @override
  // ignore: library_private_types_in_public_api
  _TaleplerimBodyState createState() => _TaleplerimBodyState();
}

class _TaleplerimBodyState extends State<TaleplerimBody> {

  List<Widget> _cardList = [];

  void _addCardWidget() {
    print("fonk çağrıldı");
    /*setState(() {
      _cardList.add(_card());
      });*/
    mykargosbutton(context, (){
      /*Navigator.push(context,
          MaterialPageRoute(builder: (context) => GoogleMap()));*/
  });
  }

  Widget _card() {
    return Container(
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
    );
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
      child:Scaffold(
      appBar: AppBar(
        backgroundColor:kitPrimaryColor,
        leading: IconButton(
            icon: Icon(
              Icons.close_rounded, color: Colors.white, size: 30,),
            onPressed: () => Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const KitHomePage(),
              ),
            )
        ),
        elevation: 1,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _cardList.length,
            itemBuilder: (context, index){
            return _cardList[index];
            }
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