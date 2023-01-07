// import 'package:flutter/material.dart';
// import 'package:v01/kargo/constants.dart';
// import 'package:v01/kargo/widgets/reusable_widgets.dart';
// import 'package:v01/kit/home/home.dart';
// import 'package:v01/welcome.dart';

// class KitProfileScreen extends StatefulWidget{
//   const KitProfileScreen({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _KitProfileScreenState createState() => _KitProfileScreenState();
// }

// class _KitProfileScreenState extends State<KitProfileScreen>{

//   Future<bool> _onWillPop() async {
//     return (await showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Çıkış Onay'),
//         content: const Text('Uygulamadan çıkış yapmak istediğinize emin misiniz?'),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () => Navigator.pop(context, 'İptal'),
//             child: const Text('İptal',
//               style: TextStyle(color: Colors.red),),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context, 'Onayla');
//               Navigator.pushReplacement<void, void>(
//                 context,
//                 MaterialPageRoute<void>(
//                   builder: (BuildContext context) => LogosPage(),
//                 ),
//               );
//             },
//             child: const Text('Onayla'),
//           ),
//         ],
//       ),
//     )) ?? false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//     onWillPop: _onWillPop,
//       child: Scaffold(
//       backgroundColor: kbackgroundColor,
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor:kitPrimaryColor,
//         leading: IconButton(
//             icon: Icon(
//               Icons.close_rounded, color: Colors.white, size: 30,),
//             onPressed: () => Navigator.pushReplacement<void, void>(
//               context,
//               MaterialPageRoute<void>(
//                 builder: (BuildContext context) => const KitHomePage(),
//               ),
//             )
//         ),
//         elevation: 1,
//       ),
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height:MediaQuery.of(context).size.height,
//         decoration: const BoxDecoration(
//           color: kbackgroundColor,),
//           /*image: DecorationImage(
//             image: AssetImage(
//                 'assets/atlaslogodeneme.png'),
//             /*fit: ,*/
//           ),
//           shape: BoxShape.circle,
//       )*/
//         child: SingleChildScrollView(
//             child: Padding(
//           padding: const EdgeInsets.fromLTRB(22, 120, 22, 0),
//           child: Column(
//             children: <Widget>[
//               Image.asset(
//                 'assets/profile.png',
//                 height: 100,
//                 width: 100,),
//               const SizedBox(
//                 height: 10,
//               ),
//               SizedBox(
//                 width: double.infinity,
//                 child: Container (
//                   color: kbackgroundColor,
//                   child: const Text(
//                     "  Ad-Soyad",
//                     textAlign: TextAlign.left,
//                     style: TextStyle(
//                       fontSize: 15,
//                     ),
//                   ),
//                 ) ,
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               reusableTextField_1('Datadan alınan ad-soyad',Icons.drive_file_rename_outline,),
//               const SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 width: double.infinity,
//                 child: Container (
//                   color: kbackgroundColor,
//                   child: const Text(
//                     "  E-Posta",
//                     textAlign: TextAlign.left,
//                     style: TextStyle(
//                       fontSize: 15,
//                     ),
//                   ),
//                 ) ,
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               reusableTextField_1("Datadan alınan mail",Icons.drive_file_rename_outline,),
//               const SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 width: double.infinity,
//                 child: Container (
//                   color: kbackgroundColor,
//                   child: const Text(
//                     "  Şifre",
//                     textAlign: TextAlign.left,
//                     style: TextStyle(
//                       fontSize: 15,
//                     ),
//                   ),
//                 ) ,
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               reusableTextField_1("datadan alınan şifre",Icons.drive_file_rename_outline,),
//               const SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 width: double.infinity,
//                 child: Container (
//                   color: kbackgroundColor,
//                   child: const Text(
//                     "  Cep Telefonu",
//                     textAlign: TextAlign.left,
//                     style: TextStyle(
//                       fontSize: 15,
//                     ),
//                   ),
//                 ) ,
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               reusableTextField_1("Datadan alınan tel no",Icons.drive_file_rename_outline,),
//               const SizedBox(
//                 height: 35,
//               ),
//             ],
//           ),
//         ),
//      )),
//       floatingActionButton: firebaseUIButton_1(context),
//     ),
//     );
// }
// }