// import 'dart:typed_data';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:get/get.dart';
import 'package:my_app/matrix_helper.dart';
// import 'package:my_app/display_earth.dart';
// import 'package:my_app/small_list.dart';
import 'dart:math' as math;
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:my_app/all_item.dart';
import 'package:my_app/controller.dart';
import 'package:my_app/Home.dart';
import 'package:my_app/swiper.dart';
// import 'package:get/get.dart';
// import 'package:my_app/controller.dart';

// import 'package:my_app/server.dart';

class GreenEarth extends StatelessWidget {
  const GreenEarth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
        final currentWidth = MediaQuery.of(context).size.width;


    return GetBuilder<ServerController>(builder: (controller) {
      if (controller.matrix.isEmpty) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Row(
          children: [
            Container(
              height: screenHeight * 0.3,
              width: currentWidth,
              decoration: const BoxDecoration(
                  // color: Colors.red,
                  ),
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(
                      bottom: screenHeight * 0.01,
                    ),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'THERMOSTAT',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenHeight * 0.017,
                          ),
                        ),
                  
                        //-------------------------------------------------------------
                      ),
                  ),
                  
                  Padding(
                    padding: EdgeInsets.only(
                      // left: screenHeight * 0.05,
                      top: screenHeight * 0.01,
                      bottom: screenHeight*0.01,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        controller.matrix[1][2] != ""
                            ? '${ServerController.serverr.matrix[1][2]}°C'
                            : '30°C',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeight * 0.055,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: screenHeight * 0.15,
                      top: screenHeight * 0.02,
                    ),
                    child: Align(
// alignment: Alignment.center,
                      child: IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    ' Pollution',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenHeight * 0.017,
                                    ),
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '455 K',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenHeight * 0.03,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            VerticalDivider(
                              color: Colors.white,
                              thickness: 0.6,
                            ),
                            Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    ' Air Quality',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenHeight * 0.017,
                                    ),
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    '455 L',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenHeight * 0.03,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(width: screenHeight * 0.109),
            // Align(
            //    alignment: Alignment.centerRight,
            //   child: Expanded(
            //     child: Container(
            //       height: double.infinity,
            //       width: 180,
            //       decoration: const BoxDecoration(
            //           // color: Colors.red,
            //           ),
            //       child: Image(
            //         image: AssetImage('assets/net.png'),
            //       ),
            //     ),
            //   ),
            // ),

            // Expanded(
            //   child: Container(
            //     height: double.infinity,
            //     width: screenHeight * 0.5,
            //     decoration: const BoxDecoration(),
            //     child: Image(
            //       image: AssetImage('assets/net.png'),
            //     ),
            //   ),
            // )
          ],
        );
      }
    });
  }
}
