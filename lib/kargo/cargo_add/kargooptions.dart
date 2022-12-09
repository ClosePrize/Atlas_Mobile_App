import 'package:flutter/material.dart';
import 'package:v01/kargo/widgets/reusable_widgets.dart';
class KargoOptions extends StatefulWidget {
  const KargoOptions({super.key});

  @override
  State<KargoOptions> createState() => _KargoOptionsState();
}

class _KargoOptionsState extends State<KargoOptions> {
      TextEditingController _siparisTextController = TextEditingController();

  final items = ["Trendyol Grup", "n11","Amazon Türkiye", "Ptt AVM"];
  String? value;
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 50,),
               SizedBox(
                width: double.infinity,
                child: Container (
                  child: Text(
                    "Kargonun Alınacağı Şirket",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ) ,
              ),
            const SizedBox(height: 15,),
            Container(
              width: MediaQuery.of(context).size.width/1.2,
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical:4,
              ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30)
            ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  borderRadius: BorderRadius.circular(30),
                  value: value,
                  iconSize: 36,
                  icon: const Icon(Icons.arrow_drop_down,color: Colors.black,),
                  isExpanded: true,
                  items: items.map(buildMenuItem).toList(), 
                  onChanged: (value)=>setState(() => 
                    this.value= value,
                  ),
                  ),
              ),
            ),
            const SizedBox(
              height: 50,),
              SizedBox(
                width: double.infinity,
                child: Container (
                  // ignore: prefer_const_constructors
                  child: Text(
                    "Sipariş No",
                    textAlign: TextAlign.left,
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ) ,
              ),
              const SizedBox(
              height: 15,),
       reusableTextField(
            "Sipariş Numarası", Icons.abc,false, _siparisTextController), 
                 const SizedBox(
              height: 60,),
              firebaseUIButton(context, "Kargomu Getir", (){})   ],
        ),
      ),
      
    );
  }
  DropdownMenuItem<String> buildMenuItem (String item) =>
  DropdownMenuItem(value: item,
  child: Text(
    item, style: const TextStyle(
      fontWeight: FontWeight.normal, fontSize: 17),),);
  
}