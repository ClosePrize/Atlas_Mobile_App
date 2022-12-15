import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:v01/kit/kit_talep/saglik/cart_model_saglik.dart';
import 'package:v01/kit/taleplerim/taleplerim.dart';
import '../../kargo/constants.dart';
import '../home/home.dart';
import '../kit_talep/besin/cart_model_besin.dart';
import 'package:v01/kit/kit_talep/yol/cart_model_yol.dart';

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
        padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: 500,
              child: Text(
                'Sepetiniz',
                style: GoogleFonts.notoSerif(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                ),
              )
            ),
            SizedBox(
              height: 130,
              width: 600,
              child: SingleChildScrollView(
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
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                      /*Consumer<CartModelSaglik>(
                      builder: (context, value, child) {
                      return Container(
                        //padding: EdgeInsets.fromLTRB(100, 100, 100, 100),
                        child:
                            ListView.builder(
                                itemCount: value.cartItems.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
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
                                            Provider.of<CartModelSaglik>(context, listen: false)
                                                .removeItemFromCart(index),
                                      )
                                  );
                                },
                              ),

                        );
                      },*/
                    )
                     )
                  ]
                )
              )
            ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
                height: 130,
                width: 600,
                child: SingleChildScrollView(
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black)
                    ),
                    child: Column(
                        children: [
                          SizedBox(
                            child: Text(
                                'Yol Yardım Kitleri'
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
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
              )
            ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
                height: 130,
                width: 600,
                child: SingleChildScrollView(
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black)
                    ),
                    child: Column(
                        children: [
                          SizedBox(
                            child: Text(
                                'Besin Kitleri'
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
                                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                )
            ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(160, 30, 0, 0),
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
