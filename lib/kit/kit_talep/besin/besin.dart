import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v01/kargo/constants.dart';
import 'package:v01/kargo/widgets/reusable_widgets.dart';
import 'package:v01/kit/widgets/bottomnavigationbar.dart';
import 'package:v01/kit/widgets/items.dart';
import '../../sepetim/cart_page.dart';
import 'cart_model_besin.dart';
import 'package:v01/kit/sepetim/cart_page_klon.dart';
import 'package:v01/kit/taleplerim/body.dart';

class BesinPage extends StatefulWidget {
  const BesinPage({super.key});

  @override
  State<BesinPage> createState() => _BesinPageState();
}

class _BesinPageState extends State<BesinPage> {
  final TaleplerimBody tal123 = new TaleplerimBody();
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
                     onPressed: () => showDialog<String>(
                       context: context,
                       builder: (BuildContext context) => AlertDialog(
                         title: const Text('Kit Onay'),
                         content: const Text('Bu kiti seçmek istediğinize emin misiniz?'),
                         actions: <Widget>[
                           TextButton(
                             onPressed: () { Navigator.pop(context, 'İptal');
                             },
                             child: const Text('İptal',
                               style: TextStyle(color: kitPrimaryColor),),
                           ),
                           TextButton(
                             onPressed: () { Navigator.pop(context, 'Onayla');
                                 Provider.of<CartModel>(context, listen: false)
                                 .addItemToCart(index);
                             tal123.method();
                             //sendDemand();
                             },
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

  /*void sendDemand() async {
    print("çalışıyor");
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    var uid = user?.uid.toString();
    var _uidTextController = uid.toString();
    user1 = User1(name: _userNameTextController.text, phone: _phoneTextController.text, email: _emailTextController.text ,password: _passwordTextController.text, uid: _uidTextController);
    var response = await http.post(Uri.parse("http://172.28.32.111:8000/api/register/"),
        headers: {"Content-type": "application/json"},
        body: json.encode(user1.toJson()));
    print(response.body);}*/
}
