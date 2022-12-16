import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v01/kit/kit_talep/saglik/cart_model_saglik.dart';
import 'package:v01/kit/taleplerim/taleplerim.dart';
import '../../kargo/constants.dart';
import '../kit_talep/besin/cart_model_besin.dart';
import 'package:v01/kit/kit_talep/yol/cart_model_yol.dart';
import 'package:v01/kit/taleplerim/talep_onay.dart';

class CartPage1 extends StatelessWidget {
  const CartPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
                padding: const EdgeInsets.fromLTRB(160, 30, 0, 0),
                  child: SizedBox(
                      height: 70,
                      width: MediaQuery.of(context).size.width/2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Material(
                          child: InkWell(
                            onTap: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Sepet Onay'),
                              content: const Text('Sepeti onaylamak istediğinize emin misiniz?'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'İptal'),
                                  child: const Text('İptal'),
                                ),
                                TextButton(
                                  onPressed: () { Navigator.pop(context, 'Onayla');
                                    //Navigator.push(context,
                                      //MaterialPageRoute(builder: (context)=> KitTalepOnayPage())).then((value){});
                                  Navigator.pushReplacement<void, void>(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) => const KitTalepOnayPage(),
                                    ),
                                  );
                                  Provider.of<CartModelSaglik>(context, listen: false)
                                      .removeItemFromCart(1);
                                  Provider.of<CartModelYol>(context, listen: false)
                                      .removeItemFromCart(1);
                                  Provider.of<CartModel>(context, listen: false)
                                      .removeItemFromCart(1);
                                  },
                                  child: const Text('Onayla'),
                                ),
                              ],
                            ),
                            ),
                            child: Ink(
                                // ignore: sort_child_properties_last
                                child: const Center(
                                  child: Text(
                                    'Sepeti Onayla',
                                    style: TextStyle(
                                      fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                decoration: const BoxDecoration(
                                  color: kitgreenColor,
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
                  )
              ),
      appBar: AppBar(
        backgroundColor:kitPrimaryColor,
        leading: IconButton(
            icon: const Icon(
              Icons.close_rounded, color: Colors.white, size: 30,),
            onPressed: () => Navigator.pop(context, false)
        ),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(30, 40, 30, 40),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
                // width: 500,
                // child: Text(
                //   'Sepetiniz',
                //   style: GoogleFonts.notoSerif(
                //   fontSize: 36,
                //   fontWeight: FontWeight.bold,
                //   ),
                // )
              ),
              Container(
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
                boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3), // changes position of shadow
      ),
    ],
              ),
              child: Column(
                children: [
                  const SizedBox(
                    child: Text(
                      'Sağlık Kitleri', 
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: kitgreenColor, 
                              shadows:[
            Shadow(
                 blurRadius:5.0,  // shadow blur
                  color: Colors.grey, // shadow color
                  offset: Offset(0.5,0.5), // how much shadow will be shown
            ),
        ],
                              ),
                    ),
                  ),
                  SizedBox(
                      child: Consumer<CartModelSaglik>(
                  builder: (context, value, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: ListView.builder(
                            shrinkWrap: true,
                              itemCount: value.cartItems.length,
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                
                                  child: ListTile(
                                    leading: Text(
                                      value.cartItems[index][0],
      
                                    ),
                                
                                    trailing: IconButton(
                                      icon: const Icon(Icons.cancel),
                                      onPressed: () =>
                                          Provider.of<CartModelSaglik>(context, listen: false)
                                              .removeItemFromCart(index),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
      
                      ],
                    );
                  }
                    
                  )
                   )
                ]
              )
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                  decoration: BoxDecoration(
                // border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
                boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3), // changes position of shadow
      ),
    ],
              ),
                  child: Column(
                      children: [
                        const SizedBox(
                          child: Text(
                            
                              'Yol Yardım Kitleri',
                               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red,
                              shadows:[
            Shadow(
                 blurRadius:5.0,  // shadow blur
                  color: Colors.grey, // shadow color
                  offset: Offset(0.5,0.5), // how much shadow will be shown
            ),
        ],
                              ),
                          ),
                        ),
              SizedBox(
                  child: Consumer<CartModelYol>(
                      builder: (context, value, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: value.cartItems.length,
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  
                                    child: ListTile(
                                      leading: Text(
                                        value.cartItems[index][0],
      
                                      ),
                                      trailing: IconButton(
                                        icon: const Icon(Icons.cancel),
                                        onPressed: () =>
                                            Provider.of<CartModelYol>(context, listen: false)
                                                .removeItemFromCart(index),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      }
                    )
                  )
                ]
              )
                ),
              const SizedBox(
                height: 30,
              ),
              Container(
                  decoration: BoxDecoration(
                // border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
                boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3), // changes position of shadow
      ),
    ],
              ),
                  child: Column(
                      children: [
                        const SizedBox(
                          child: Text(
                              'Besin Kitleri',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue,
                              shadows:[
            Shadow(
                 blurRadius:5.0,  // shadow blur
                  color: Colors.grey, // shadow color
                  offset: Offset(0.5,0.5), // how much shadow will be shown
            ),
        ],
                              ),
                          ),
                        ),
                        SizedBox(
                            child: Consumer<CartModel>(
                                builder: (context, value, child) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: value.cartItems.length,
                                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                              // child: Container(
                                              //   decoration: BoxDecoration(
                                              //       color: Colors.white,
                                              //       // borderRadius: BorderRadius.circular(8)
                                              //       ),
                                              child: ListTile(
                                                leading: Text(
                                                  value.cartItems[index][0],
      
                                                ),
                                                // title: Text(
                                                //   value.cartItems[index][0],
                                                //   style: const TextStyle(fontSize: 18),
                                                // ),
                                                // subtitle: Text(
                                                //   '\$' + value.cartItems[index][1],
                                                //   style: const TextStyle(fontSize: 12),
                                                // ),
                                                trailing: IconButton(
                                                  icon: const Icon(Icons.cancel),
                                                  onPressed: () =>
                                                      Provider.of<CartModel>(context, listen: false)
                                                          .removeItemFromCart(index),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                }
                            )
                        )
                      ]
                  )
              ),
              
            ],
          ),
        ),
      )
    );
  }
} //https://www.youtube.com/watch?v=ErP_xomHKTw&t=1s
