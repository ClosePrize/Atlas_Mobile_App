import 'package:flutter/material.dart';

class OptionsBox extends StatefulWidget {
  const OptionsBox({Key? key}) : super(key: key);
 
  @override
  _OptionsBoxState createState() => _OptionsBoxState();
}
 
class _OptionsBoxState extends State<OptionsBox> {
   
  // Initial Selected Value
  String dropdownvalue = 'Seçiniz';  
 
  // List of items in our dropdown menu
  var items = [  
    'Ptt Avm', 
    'Trendyol Grup',
    'Hepsiburada',
    'n11',
    'eBay',
    'Amazon Turkiye',
    'Seçiniz',
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            // textBaseline:,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                   width: MediaQuery.of(context).size.width/2,
                    height: 50,
                padding: const EdgeInsets.all(8),
  decoration:  BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Colors.white,),
                child: DropdownButton(
                  // focusColor:Colors.white ,
                  dropdownColor: Colors.white,
                   borderRadius: BorderRadius.circular(25),
                  // Initial Value
                  value: dropdownvalue,
                   
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),   
                   
                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
    );
  }
}