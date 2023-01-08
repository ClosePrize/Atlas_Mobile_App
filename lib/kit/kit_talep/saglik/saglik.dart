import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../kargo/constants.dart';
import '../../sepetim/cart_page_klon.dart';
import '../../widgets/bottomnavigationbar.dart';
import '../../widgets/items.dart';
import 'cart_model_saglik.dart';

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
        backgroundColor: kitgreenColor,
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
          child: Consumer<CartModelSaglik>(
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
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Kit Onay'),
                        content: const Text('Bu kiti seçmek istediğinize emin misiniz?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'İptal'),
                            child: const Text('İptal',
                              style: TextStyle(color: kitPrimaryColor),),
                          ),
                          TextButton(
                            onPressed: () { Navigator.pop(context, 'Onayla');
                            Provider.of<CartModelSaglik>(context, listen: false)
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