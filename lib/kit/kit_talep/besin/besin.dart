import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v01/kargo/constants.dart';
import 'package:v01/kit/widgets/bottomnavigationbar.dart';
import 'package:v01/kit/widgets/items.dart';
import '../../sepetim/cart_page.dart';
import 'cart_model.dart';

class BesinPage extends StatefulWidget {
  const BesinPage({super.key});

  @override
  State<BesinPage> createState() => _BesinPageState();
}

class _BesinPageState extends State<BesinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
          backgroundColor:kitPrimaryColor,
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left, color: Colors.white, size: 30,),
            onPressed: () => Navigator.pop(context, false)
          ),
          elevation: 1,
      ),
          bottomNavigationBar: KitBottomNavBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CartPage();
            },
          ),
        ),),
           body: Container(
             child: Padding(
            padding: EdgeInsets.fromLTRB(27,60, 27, 7),
            child: Consumer<CartModel>(
             builder: (context, value, child) {
               return GridView.builder(
                //  padding: const EdgeInsets.only(right:0, left:30),
                 // physics: const NeverScrollableScrollPhysics(),
                 itemCount: value.shopItems.length,
                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 1,
                   mainAxisSpacing: 25,
                   mainAxisExtent: 160
                   // childAspectRatio: 1 / 1.2,
                 ),
                 itemBuilder: (context, index) {
                   return CardItems(
                     kitName: value.shopItems[index][0],
                     // itemPrice: value.shopItems[index][1],
                     imagePath: value.shopItems[index][1],
                     // color: value.shopItems[index][3],
                     onPressed: () =>
                         Provider.of<CartModel>(context, listen: false)
                             .addItemToCart(index),
                   );
                 },
               );
             },
             ),),
           ),
    );
  }
}
