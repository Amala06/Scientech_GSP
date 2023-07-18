

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

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   //  ServerController serverController = Get.put(ServerController());
//   // String updatedValue = '';

//   // @override
//   // void initState() {
//   //   super.initState();
  //   serverController.startServer();
//   //   serverController.fetchData();
//   // }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
       
      body: GetBuilder<ServerController>(
        builder: (controller) {
          if (controller.matrix.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            String array_name = "";

            if (ServerController.serverr.matrix[0][2] == '1') {
              array_name = "matrix";
            } else if (ServerController.serverr.street[0][2] == '2') {
              array_name = "soil";
            } else {
              array_name = "smart";
            }

            List<String?> rowDataVal;

            switch (array_name) {
              case "matrix":
                rowDataVal = ServerController.serverr.matrix.length > 3
                    ? ServerController.serverr.matrix[0]
                    : [];
                break;
              case "soil":
                rowDataVal = ServerController.serverr.street.length > 3
                    ? ServerController.serverr.street[0]
                    : [];
                break;
              default:
                rowDataVal = ServerController.serverr.smart.length > 3
                    ? ServerController.serverr.smart[0]
                    : [];
                break;
            }

            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(0, 0, 0, 1),
                    Color.fromRGBO(4, 27, 151, 1),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  transform: GradientRotation(math.pi / 4),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: -20,
                    child: Transform.translate(
                      offset: const Offset(-70, -10),
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromRGBO(202, 15, 206, 1),
                              Colors.transparent,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            transform: GradientRotation(math.pi / 4),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                        Spacer(),
                        Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight * 0.07,
                      left: currentWidth * 0.22,
                    ),
                    // child: Text(
                    //   'SMART BUILDING',
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontFamily: 'Gidugu',
                    //     fontSize: screenHeight * 0.04,
                    //   ),
                    // ),
                     child: Text(
                                            rowDataVal.length > 1 ? rowDataVal[1] ?? '30°C' : '30°C',

                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Gidugu',
                        fontSize: screenHeight * 0.04,                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight * 0.15,
                      left: currentWidth * 0.4,
                    ),
                    child: Text(
                      'Living Area',
                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'Gidugu',
                        fontSize: screenHeight * 0.035,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: screenHeight * 0.22, left: screenHeight * 0.189),
                    child: Text(
                      controller.s,
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
             
                  // Center(
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       color: ServerController.serverr.server!.running
                  //           ? Colors.green[400]
                  //           : Colors.red[400],
                  //     ),
                  //     padding: EdgeInsets.all(5),
                  //     child:
                  //         Text(ServerController.serverr.server!.running ? "ON" : "OFF"),
                  //   ),
                  // ),
                  // Center(
                  //   child: TextButton(
                  //       onPressed: () async {
                  //         debugPrint("hellp");
                  //         await  ServerController.serverr.startServer();
                  //       },
                  //       child: Text(
                  //           ServerController.serverr.server!.running
                  //           ? "Stop Server"
                  //           : "Start Server")),
                  // ),
                  Center(
                    child: DisplayEarth(),
                  ),
                  // DisplayEarth(),
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.75),
                    child: SmallList(),
                  ),
// SmallList(),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image(
                      image: AssetImage('assets/build.png'),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
