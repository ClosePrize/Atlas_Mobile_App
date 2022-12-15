import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:v01/kit/kit_talep/saglik/cart_model_saglik.dart';
import 'package:v01/kit/taleplerim/taleplerim.dart';
import '../../kargo/constants.dart';
import '../home/home.dart';
import '../kit_talep/besin/cart_model_besin.dart';

class CartPage1 extends StatelessWidget {
  const CartPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:kitPrimaryColor,
        leading: IconButton(
            icon: Icon(
              Icons.close_rounded, color: Colors.white, size: 30,),
            onPressed: () => Navigator.pop(context, false)
        ),
        elevation: 1,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(40, 50, 40, 0),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: 500,
              child: Text(
                'Sepetiniz',
                style: TextStyle(
                  fontSize: 45,
                ),
              )
            ),
            SizedBox(
              height: 100,
              width: 600,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black)
                ),
                child: Column(
                  children: [
                    SizedBox(
                      child: Text(
                        'Sağlık Kitleri'
                      ),
                    ),

                    Consumer<CartModel>(
                      builder: (context, value, child) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: ListView.builder(
                                itemCount: value.cartItems.length,
                                padding: EdgeInsets.all(12),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(12.0),
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
                          ),
                        ],
                        );
                      },
                    )
                  ]
                )
              )
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
                height: 100,
                width: 600,
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black)
                    ),
                    child: Column(
                        children: [
                          SizedBox(
                            child: Text(
                                'Sağlık Kitleri'
                            ),
                          ),

                          Consumer<CartModel>(
                            builder: (context, value, child) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                ],
                              );
                            },
                          )
                        ]
                    )
                )
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
                height: 100,
                width: 600,
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black)
                    ),
                    child: Column(
                        children: [
                          SizedBox(
                            child: Text(
                                'Sağlık Kitleri'
                            ),
                          ),

                          Consumer<CartModel>(
                            builder: (context, value, child) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                              );
                            },
                          )
                        ]
                    )
                )
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(160, 80, 0, 0),
                child: SizedBox(
                    height: 70,
                    width: MediaQuery.of(context).size.width/2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Material(
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => TaleplerimScreen()));
                          },
                          child: Ink(
                              child: Center(
                                child: Text(
                                  'Sepeti Onayla',
                                  style: TextStyle(

                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
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
            )
          ],
        ),
      )
    );
  }
}
      /*Consumer<CartModel>(
        builder: (context, value, child) {
          return Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Let's order fresh items for you
              SizedBox(
                height: 25,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "Sepetim",
                  style: GoogleFonts.notoSerif(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),


              // list view of cart
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListView.builder(
                    itemCount: value.cartItems.length,
                    padding: EdgeInsets.all(12),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
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
              ),

              // total amount + pay now

              /*Padding(
                padding: const EdgeInsets.all(36.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.green,
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /*Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [

                          const SizedBox(height: 8),

                        ],
                      ),*/

                      // pay now
                      /*Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green.shade200),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: const [
                            Text(
                              'Kiti Talep Et',
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),*/
                    ],
                  ),
                ),
              )*/
              Padding(
                  padding: const EdgeInsets.fromLTRB(230, 20, 22, 60),
                  child: SizedBox(
                      height: 60,
                      width: MediaQuery.of(context).size.width/3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Material(
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => TaleplerimScreen()));
                            },
                            child: Ink(
                                child: Center(
                                  child: Text(
                                    'Sepeti Onayla',
                                    style: TextStyle(

                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
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
              )
            ],
          );
        },
      ),
    );
  }
}*/

/*Padding(
                  padding: const EdgeInsets.fromLTRB(230, 20, 22, 60),
                  child: SizedBox(
                      height: 60,
                      width: MediaQuery.of(context).size.width/3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Material(
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => TaleplerimScreen()));
                            },
                            child: Ink(
                                child: Center(
                                  child: Text(
                                    'Sepeti Onayla',
                                    style: TextStyle(

                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
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
              )*/
