// import 'package:flutter/material.dart';
// import 'package:my_app/controller.dart';

// class Loading extends StatelessWidget {
//   const Loading({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.black, // Set the background color to black
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'assets/logo.png', // Replace 'your_image.png' with your image path
//               height: 100,
//               width: 100,
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Finding Devices ',
//               style: TextStyle(
//                 color: Colors.white, // Set the text color to white
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 20),
//             CircularProgressIndicator(),
//                 Padding(
//               padding: EdgeInsets.only(
//                   // top: screenHeight * 0.22, left: screenHeight * 0.189),
//               child: Text(
//                 controller.s,
//                 style: TextStyle(color: Colors.blue),
//               ),
//             ),
//                 )
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:my_app/matrix_helper.dart';
import 'package:my_app/display_earth.dart';
import 'package:my_app/small_list.dart';
import 'dart:math' as math;
import 'package:my_app/controller.dart';
import 'package:my_app/server.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';

// Function to terminate and restart the application

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: GetBuilder<ServerController>(
        builder: (controller) {
        

            return Container(
                color: Colors.black, // Set the background color to black
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png', // Replace 'your_image.png' with your image path
              height: 100,
              width: 100,
            ),
            SizedBox(height: 20),
            Text(
              'Finding Devices ',
              style: TextStyle(
                color: Colors.white, // Set the text color to white
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(),
                Padding(
              padding: EdgeInsets.only(
                  top: 12),
              child: Text(
                controller.s,
                style: TextStyle(color: Colors.blue),
              ),
            ),
              ] , ),
          
        ),
      );
        }
            ));
          }
}
      

