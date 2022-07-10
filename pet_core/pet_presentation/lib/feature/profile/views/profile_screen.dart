// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pet_project_flutter/features/profile/views/profile_background.dart';

// class ProfileScreen extends StatefulWidget {
//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0.0,
//         backgroundColor: Colors.blue[50],
//         leading: InkWell(
//           splashColor: Colors.transparent,
//           highlightColor: Colors.transparent,
//           child: Icon(
//             Icons.navigate_before,
//             size: 40,
//             color: Color.fromRGBO(125, 170, 206, 1),
//           ),
//           onTap: () => Get.back(),
//         ),
//       ),
//       body: Stack(children: [
//         ProfileBackground(),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               width: size.width * 0.3,
//               height: size.width * 0.3,
//               decoration: BoxDecoration(
//                 color: Color.fromRGBO(125, 170, 206, 1),
//                 shape: BoxShape.circle,
//               ),
//               padding: EdgeInsets.all(size.width * 0.01),
//               child: CircleAvatar(
//                 backgroundColor: Colors.white,
//                 backgroundImage: AssetImage(
//                   'assets/images/avatar.jpg',
//                 ),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.only(top: 10),
//               alignment: Alignment.center,
//               child: Text(
//                 'ABC... XYZ',
//                 style: TextStyle(
//                     color: Colors.blue[50], fontWeight: FontWeight.w600),
//               ),
//             )
//           ],
//         )
//       ]),
//     );
//   }
// }
