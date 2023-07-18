import 'package:flutter/material.dart';
import 'package:my_app/Home.dart';
import 'package:my_app/Street.dart';
import 'package:my_app/all_item.dart';
import 'package:my_app/green_all_item.dart';
import 'package:my_app/greenhouse.dart';
import 'package:my_app/street_all_item.dart';

// import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:my_app/matrix_helper.dart';
import 'package:my_app/display_earth.dart';
import 'package:my_app/small_list.dart';
import 'dart:math' as math;
import 'package:my_app/controller.dart';
import 'package:my_app/server.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/services.dart';
// import 'package:liquid_swipe/liquid_swipe.dart';
// import 'package:my_app/Home.dart';
// import 'package:my_app/all_item.dart';

// class Swiper extends StatelessWidget {
//   const Swiper({super.key});

// @override
//   Widget build(BuildContext context) {
//     return  MaterialApp(
//       home: Builder(builder: (context) => LiquidSwipe(pages: pages, slideIconWidget:Icon(Icons.arrow_back_ios))	),
//     );
//   }

// }final pages = [
//   Container(
//     child: Home(),
//   ),
//   Container(
//     child: AllItem(),
//   )

//  ];

class Swiper extends StatelessWidget {
  // const Swiper({super.key});
  final VoidCallback restartAppCallback;

  Swiper({required this.restartAppCallback});

@override
  Widget build(BuildContext context) {
   return Scaffold(
            // scrollDirection: Axis.vertical,
            

    body: PageView(
              scrollDirection: Axis.vertical,

children: [
// ElevatedButton(
//             onPressed: () {
//               restartAppCallback();
//             },
//             child: Text('Restart App'),
//           ),

   Home(),
   AllItem(),
   Street(),
   StreetAllItem(),
   GreenHouse(),
   GreenAllItem(),
],
    ),
   );
  }

}