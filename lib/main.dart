import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:v01/firebase_options.dart';
import 'kit/kit_talep/saglik/cart_model_saglik.dart';
import 'kit/kit_talep/besin/cart_model_besin.dart';
import 'kit/kit_talep/yol/cart_model_yol.dart';
import 'welcome.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

/*class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child:  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ATLAS",
      home: const LogosPage(),
    ),);
  }
}*/

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartModel>(
          create: (_) => CartModel(),
        ),
        ChangeNotifierProvider<CartModelSaglik>(
          create: (_) => CartModelSaglik(),
        ),
        ChangeNotifierProvider<CartModelYol>(
          create: (_) => CartModelYol())
        /*ChangeNotifierProvider<CartModelTaleplerim>(
          create: (_) => CartModelSaglik(),
        ),*/
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "ATLAS",
        home: const LogosPage(),
      )
    );
  }
}
