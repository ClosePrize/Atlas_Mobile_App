import 'package:v01/kit/home/home.dart';
import 'package:flutter/material.dart';
import 'package:v01/kargo/cargo_add/kargooptions.dart';
import 'package:v01/kargo/cargo_add/cargo_add.dart';
import 'package:v01/kargo/constants.dart';
import 'package:v01/kargo/home/kargohome.dart';
import 'package:v01/kit/home/body.dart';
import 'package:v01/welcome.dart';
import '../login.dart';

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Color.fromARGB(255, 114, 112, 112),
      ),
      labelText: text,
      labelStyle: TextStyle(color: Color.fromARGB(255, 100, 89, 89).withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Color.fromARGB(255, 255, 255, 255),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}


SizedBox reusableTextField_1(String text, IconData icon,/* bool isPasswordType,
    TextEditingController controller*/) {
  return SizedBox(
      height: 50,
      width: 1000,
      child: TextField(

      /*controller: controller,
      obscureText: isPasswordType,
      enableSuggestions: !isPasswordType,
      autocorrect: !isPasswordType,*/
      cursorColor: Colors.white,
      //cursorHeight: 100,
      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      decoration: InputDecoration(
        suffixIcon: Icon(icon),
        isDense: true,
        /*prefixIcon: Icon(
          icon,
          color: Color.fromARGB(255, 114, 112, 112),
        ),*/
        labelText: text,
        labelStyle: TextStyle(color: Color.fromARGB(255, 100, 89, 89).withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Color.fromARGB(255, 230, 230, 230),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
            gapPadding: 100000.0)
      )/*,
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,*/
  ),
  );
}

SizedBox SearchButton(String text, IconData icon,/* bool isPasswordType,
    TextEditingController controller*/) {
  return SizedBox(
    height: 50,
    width: 1000,
    child: TextField(

      /*controller: controller,
      obscureText: isPasswordType,
      enableSuggestions: !isPasswordType,
      autocorrect: !isPasswordType,*/
        cursorColor: Colors.white,
        //cursorHeight: 100,
        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        decoration: InputDecoration(
            suffixIcon: Icon(icon),
            isDense: true,
            /*prefixIcon: Icon(
          icon,
          color: Color.fromARGB(255, 114, 112, 112),
        ),*/
            labelText: text,
            labelStyle: TextStyle(color: Color.fromARGB(255, 100, 89, 89).withOpacity(0.9)),
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            fillColor: Color.fromARGB(255, 230, 230, 230),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                gapPadding: 100000.0)
        ),/*,
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,*/
      onTap: (){
        var context;
        showSearch(context: context,
          delegate: MySearchDelegate(),
      );}
    ),
  );
}

class MySearchDelegate extends SearchDelegate {
  List<String> searchResults = [
    'Astım Kiti',
    'Hijyen Kiti',
    'Pandemi Kiti',
    'Kalp Krizi Kiti',
  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null),
      icon: Icon(Icons.clear));
  @override
  List<Widget>? buildActions(BuildContext context) => [

  ];
  @override
  Widget buildResults(BuildContext context) => Center(
    child: Text(
      query,
      style: TextStyle(fontSize: 64),
    ),
  );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((searchResult){
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList as List<String>;

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions [index];

        return ListTile(
          title: Text(suggestion),
          onTap: (){
            query = suggestion;
          },
        );
  }
      );
  }
}

Container firebaseUIButton_1(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width/2,
    height: 45,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Çıkış Onay'),
          content: const Text('Uygulamadan çıkış yapmak istediğinize emin misiniz?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'İptal'),
              child: const Text('İptal',
              style: TextStyle(color: kitPrimaryColor),),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'Onayla');
                Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const LogosPage(),
                  ),
                );
              },
              child: const Text('Onayla'),
            ),
          ],
        ),
      ),
      child: Text(
        'Çıkış yap',
        style: const TextStyle(
            color: Color.fromARGB(221, 255, 255, 255), fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Color.fromARGB(66, 255, 255, 255);
            }
            return kargoredColor;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}
Container firebaseUIButton(BuildContext context, String title, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width/2,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      // ignore: sort_child_properties_last
      child: Text(
        title,
        style: const TextStyle(
            color: Color.fromARGB(221, 255, 255, 255), fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Color.fromARGB(66, 255, 255, 255);
            }
            return kitgreenColor;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}

Container firebaseUIButton_2(BuildContext context, String title, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width*20,
    height: 50,
    margin: const EdgeInsets.fromLTRB(10, 30, 10, 50),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      // ignore: sort_child_properties_last
      child: Text(
        title,
        style: const TextStyle(
            color: Color.fromARGB(221, 255, 255, 255), fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Color.fromARGB(66, 255, 255, 255);
            }
            return kitgreenColor;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}

class textbox extends StatelessWidget {
  const textbox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          
  // ignore: prefer_const_constructors
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
              text: '•Kargo ekle tuşuna basınız.\n\n•Kargonuzun ait olduğu firma adını seçiniz.\n\n•Sipariş numaranızı giriniz.\n\n•Kargomu getir tuşuna basarak kaydınızı oluşturunuz.\n',
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,
        decoration: TextDecoration.none
              )),
              
        // can add more TextSpans here...
      ],
        ),
        ),
        
      ),
      
    ),
    
  ),
        )
      ),  
    );
  }
}

class addButton extends StatelessWidget {
  const addButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
          onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => KargoAddScreen()),
                      );
                      },
          color: kargogreenColor,
          textColor: Colors.white,
          // ignore: sort_child_properties_last
          child: Icon(
            Icons.add,
            size: 100,
          ),
          // padding: EdgeInsets.all(16),
          shape: CircleBorder(),
        );
  }
}

SizedBox firebaseUIButton_deneme(BuildContext context, String title, Function onTap) {
  return SizedBox(
    height: 500,
    width: 500,
    child: Container(
      width: MediaQuery.of(context).size.width/2,
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        // ignore: sort_child_properties_last
        child: Text(
          title,
          style: const TextStyle(
              color: Color.fromARGB(221, 255, 255, 255), fontWeight: FontWeight.bold, fontSize: 16),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Color.fromARGB(66, 255, 255, 255);
              }
              return kitgreenColor;
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
      ),
    )
  );
}
/*SizedBox kit_button(BuildContext context) {
  return SizedBox(
    height: 100,
    width: 500,
      child: Container(
        height: 100,
        width: 100,
        child: InkWell(
          onTap: (){
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => KargoKitTalepScreen()));
        },
          child: Ink(
            color: Color.fromARGB(255, 230, 230, 230),
            height: 100,
            width: 100,
        ),
      ),
        /*decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey,
      ),*/
    )
  );
}*/

SizedBox kit_button(BuildContext context, String assetName, Function onTab) {
  return SizedBox(
      height: MediaQuery.of(context).size.height/5,
      width: MediaQuery.of(context).size.width,
      child: GestureDetector( onTap: (){
                onTab();
              },
        child: InkWell(
          child: Ink(
            decoration: BoxDecoration(
                // color: kbackgroundColor,
                image: DecorationImage(
                  image: AssetImage(
                      assetName),
                  fit: BoxFit.fill,
                )
            )
          ),
        ),
      )
  );
}


SizedBox kit_button1(BuildContext context, String text, String assetName) {
  return SizedBox(
      height: 145,
      width: MediaQuery.of(context).size.width/1.2,
      child: ClipRRect(
        // borderRadius: BorderRadius.circular(18),
        child: Material(
          child: InkWell(
            onTap: (){
              /*Navigator.push(context,
                  MaterialPageRoute(builder: (context) => KitPopUp()));*/
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('AlertDialog Title'),
                  content: const Text('AlertDialog description'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
              },
            child: Ink(
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(

                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: kbackgroundColor,
                image: DecorationImage(
                  image: AssetImage(
                    assetName),
                  fit: BoxFit.fill,
                  )
                )
              ),
            ),
          ),
        )
  );
}

SizedBox mykargosbutton(BuildContext context, Function onTab,kit_adi,kit_durumu,siparis_tarihi,siparis_numarasi) {
  var status_color;

  if (kit_durumu == "İptal edildi"){
    status_color = kitPrimaryColor;
  }
  else if(kit_durumu == "Teslim Edildi"){
    status_color = kitgreenColor;
  }
  else{
    status_color = Color.fromARGB(255, 199, 125, 68);
  }

  return SizedBox(
      height: MediaQuery.of(context).size.height/4.3,
      width: MediaQuery.of(context).size.width/1.2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Material(
          child: InkWell(
            onTap: (){
              onTab();
            },
            child: Ink(
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 250, 250, 250)),
                borderRadius: BorderRadius.all(
                    Radius.circular(25)
                ),
                color: Color.fromARGB(255, 255, 255, 255),
                // boxShadow: [
                //   BoxShadow(
                //     color: Color.fromARGB(255, 47, 155, 17).withOpacity(0.5),
                //     spreadRadius: 25,
                //     blurRadius: 15,
                //     offset: Offset(3, 3), // changes position of shadow
                //   ),
                // ],
                  /*image: DecorationImage(
                    image: AssetImage(
                      assetName),
                    fit: BoxFit.fill,
                    )*/
            ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 50, 10, 10),
                child:RichText(
                  maxLines: 5,
                  text: TextSpan(
                    text: "",
                    style: TextStyle(fontSize: 18,color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(text: "Kit Adı: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
                      TextSpan(text: kit_adi+"\n",style: TextStyle(fontSize: 18,color: Colors.black),),
                      TextSpan(text: "Sipariş Tarihi: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
                      TextSpan(text: siparis_tarihi+"\n",style: TextStyle(fontSize: 18,color: Colors.black),),
                      TextSpan(text: "Sipariş Numarası: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
                      TextSpan(text: siparis_numarasi+"\n",style: TextStyle(fontSize: 18,color: Colors.black),),
                      TextSpan(text: "Kit Durumu: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
                      TextSpan(text: kit_durumu+"\n",style: TextStyle(fontSize: 18,color: status_color,),),
                    ]
                  )
              ),
            ),
          ),
        ),
      ),
    )
  );
}

Container taleplerimbutton(BuildContext context, Function onTab,kit_adi,kit_durumu,siparis_tarihi,siparis_numarasi) {
  return Container(
    // color: Colors.red,
    child: Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height/22,
          
        ),
        mykargosbutton(context, onTab,kit_adi,kit_durumu,siparis_tarihi,siparis_numarasi),
        SizedBox(
          height: MediaQuery.of(context).size.height/50,
        )
      ],
    ),
  );
}

class KitPopUp extends StatelessWidget {
  const KitPopUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: kitPrimaryColor,
          image: DecorationImage(
            image: AssetImage(
              'assets/kitlogo.png',
            ),
              fit: BoxFit.fill
          )
        ),
        child: AlertDialog(
          backgroundColor: Colors.white,
          title: Text("UYARI"),
          content: Text(
              "Kit seçiminiz tamamlandı, devam etmek istediğinizden emin misiniz?"),
          actions: [
            TextButton(
              onPressed: (() {
                Navigator.pop(context);
              }),
              child: Text(
                "İptal",
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
                onPressed: (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => KitHomePage()));
                }),
                child: Text(
                  "Onayla",
                  style: TextStyle(color: Colors.green),
                )),
          ],
        ),
      ),
    );
  }
}

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}


InkWell WarningForKits (BuildContext context) {
  return InkWell(
    onTap: () => showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('AlertDialog Title'),
        content: const Text('AlertDialog description'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    ),
    child: const Text('Show Dialog'),
  );
}

Widget _card() {
  return Container(
    height: 80,
    margin: EdgeInsets.only(top: 5,left: 8,right: 8),
    decoration: new BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color:Colors.orangeAccent[100],
    ),
    child: Center(
      child: ListTile(
        leading: CircleAvatar(
          radius : 28 ,
          backgroundColor:  Colors.white ,
          child: CircleAvatar(
            radius:  26,
            backgroundImage:  NetworkImage(
                "https://i.pinimg.com/originals/71/83/70/7183704aac01413c86805c19c1586e2b.jpg"),
          ),
        ),
        title: Text(
          "Freedom Fighter",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700,color: Colors.deepPurple),
        ),
        subtitle: Text(
          'Freedom Fighter',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.white),
        ),
        trailing: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: 50,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('5',
                      style: TextStyle(
                          fontSize: 20, color: Colors.grey)),
                  SizedBox(
                    width: 1,
                  ),
                  Icon(
                    Icons.access_alarms_outlined,
                    textDirection: TextDirection.rtl,
                    size: 20,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
        ),

      ),
    ),
  );
}
