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

class DisplayEarth extends StatelessWidget {
  // const DisplayEarth({super.key});
  const DisplayEarth({Key? key}) : super(key: key);
//   @override
//   State<DisplayEarth> createState() => _DisplayEarthState();
// }

// class _DisplayEarthState extends State<DisplayEarth> {
//   // MatrixHelper matrixHelper = MatrixHelper();
//   // String updatedValue = '';
//     late ServerController serverController = Get.put(ServerController());

//   @override
//   void initState() {
//     super.initState();
//     // getRandomRowIndex(const Duration(seconds: 2));
//         serverController.fetchData();
//     // matrixHelper.sta();
//     // updateMatrixValue(1);
//     // startMatrixUpdates();
//   }

  // int getRandomRowIndex(Duration delay) {
  //   Random random = Random();
  //   int rowIndex = random.nextInt(8);
  //   updateMatrixValue(rowIndex);
  //   print(rowIndex);

  //   return rowIndex;
  // }

  // void updateMatrixValue(int rowIndex) {
  //   setState(() {
  //     updatedValue = matrixHelper.matrix[rowIndex][2];
  //     // getRandomRowIndex();
  //     print('updatedValue:' + updatedValue);
  //   });
  // }
  // @override
  // Widget build(BuildContext context) {
  //   return Row(
  //     children: [
  //       Container(
  //           height: 280,
  //           width: 170,
  //           decoration: const BoxDecoration(
  //             // color: Colors.red,
  //           ),
  //           child:  Column(children: [//
  //             Padding(
  //               padding: EdgeInsets.only(left: 20,bottom: 5),
  //               child: Align(
  //                 alignment: Alignment.topLeft,
  //                 child: Text('THERMOSTAT',
  //                     style: TextStyle(
  //                       color: Colors.white,
  //                       fontSize: 15,
  //                     )),
  //               ),
  //             ),
  //             Padding(
  //               padding: EdgeInsets.only(left:20,top: 10),
  //               child: Align(
  //                           alignment: Alignment.topLeft,
  //                 child: Text( '30°C',
  //                     style: TextStyle(
  //                       color: Colors.white,
  //                       fontSize: 50,
  //                     )),
  //               ),
  //             ),
  //                  const Padding(
  //           padding: EdgeInsets.only(left:20,top: 20),
  //           child: IntrinsicHeight(
  //               child: Row(
  //                    crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Column(
  //                 children: [
  //                   Align(
  //                           alignment: Alignment.topLeft,
  //                           child: Text(' Pollution',style: TextStyle(color: Colors.white,fontSize: 12))),
  //                   SizedBox(height: 10,),
  //                   Align(
  //                       alignment: Alignment.topLeft,
  //                     child: Text('455 K',
  //                         style: TextStyle(color: Colors.white, fontSize: 20)),
  //                   ),
  //                 ],
  //               ),
  //               VerticalDivider(
  //                 color: Colors.white,
  //                 thickness: 0.6,
  //               ),
  //        Column(
  //                     children: [
  //                       Align(
  //                           alignment: Alignment.topLeft,
  //                           child: Text(' Air Quality',
  //                               style: TextStyle(
  //                                   color: Colors.white, fontSize: 12))),
  //                       SizedBox(
  //                         height: 10,
  //                       ),
  //                       Align(
  //                         alignment: Alignment.topCenter,
  //                         child: Text('455 L',
  //                             style:
  //                                 TextStyle(color: Colors.white, fontSize: 20)),
  //                       ),
  //                     ],
  //                   ),
  //             ],
  //           )),
  //         ),

  //           ])),
  //      const SizedBox(width: 10,),
  //       Expanded(

  //         child:  Container(
  //             height: 999,
  //             width: 170,
  //             decoration: const BoxDecoration(
  //               // color: Colors.red,

  //               //   border: Border.all(
  //               //     color: Colors.black,
  //               //     width: 20,

  //               //   ),
  //             ),
  //             child: const Image(
  //             image: AssetImage('assets/net.png'),
  //           ),
  //           ),
  //       ),

  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

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
              width: 200,
              decoration: const BoxDecoration(
                  // color: Colors.red,
                  ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: screenHeight * 0.05,
                      bottom: screenHeight * 0.012,
                    ),

                    
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'THERMOSTAT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeight * 0.015,
                        ),
                      ),
          
                    //-------------------------------------------------------------







                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: screenHeight * 0.05,
                      top: screenHeight * 0.01,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        controller.matrix[1][2] != ""
                            ? '${ServerController.serverr.matrix[1][2]}°C'
                            : '30°C',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeight * 0.045,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: screenHeight * 0.05,
                      top: screenHeight * 0.02,
                    ),
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  ' Pollution',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenHeight * 0.015,
                                  ),
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  '455 K',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenHeight * 0.02,
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
                                    fontSize: screenHeight * 0.015,
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
                                    fontSize: screenHeight * 0.02,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: screenHeight * 0.109),
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
       Positioned(
              top: screenHeight / 2 -
                  100, // Half the height of the screen minus half the height of the image
              left: 70,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(
                    math.pi), // Apply a horizontal scale transformation
                child: Image(
                  image: AssetImage('assets/earth.png'),
                  width: screenHeight / 2 * 0.26,
                ),
              ),
            ),


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
