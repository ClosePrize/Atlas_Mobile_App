import 'package:flutter/material.dart';
import 'package:v01/kit/sepetim/cart_page_klon.dart';
import '../../../kargo/constants.dart';
import '../../widgets/bottomnavigationbar.dart';
import 'body.dart';
import 'package:provider/provider.dart';
import 'package:v01/kargo/constants.dart';
import 'package:v01/kargo/widgets/reusable_widgets.dart';
import 'package:v01/kit/widgets/bottomnavigationbar.dart';
import 'package:v01/kit/widgets/items.dart';
import '../../sepetim/cart_page.dart';
import 'package:v01/kit/kit_talep/besin//cart_model_besin.dart';

class SaglikPage extends StatefulWidget{
  const SaglikPage({super.key});

  @override
  State<SaglikPage> createState() => _SaglikPageState();
}

class _SaglikPageState extends State<SaglikPage> {
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
      bottomNavigationBar: KitBottomNavBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CartPage1();
            },
          ),
        ),
        child: const Icon(Icons.shopping_bag
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(27,60, 27, 7),
          child: Consumer<CartModel>(
            builder: (context, value, child) {
              return GridView.builder(
                //  padding: const EdgeInsets.only(right:0, left:30),
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: value.shopItems1.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 25,
                    mainAxisExtent: 160
                  // childAspectRatio: 1 / 1.2,
                ),
                itemBuilder: (context, index) {
                  return CardItems(
                    kitName: value.shopItems1[index][0],
                    // itemPrice: value.shopItems[index][1],
                    imagePath: value.shopItems1[index][1],
                    // color: value.shopItems[index][3],
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Kit Onay'),
                        content: const Text('Bu kiti seçmek istediğinize emin misiniz?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'İptal'),
                            child: const Text('İptal'),
                          ),
                          TextButton(
                            onPressed: () { Navigator.pop(context, 'Onayla');
                            Provider.of<CartModel>(context, listen: false)
                                .addItemToCart(index);},
                            child: const Text('Onayla'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}




/*class SaglikPage extends StatelessWidget{
  const SaglikPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kbackgroundColor,
      bottomNavigationBar: KitBottomNavBar(),
      body: KitOzelScreen(),
    );
  }
}*/