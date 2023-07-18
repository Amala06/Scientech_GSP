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

class StreetAllItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;

    return Builder(
      builder: (BuildContext scaffoldContext) {
        return Scaffold(
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  title: const Text('Item 1'),
                  onTap: () {
                    // Handle item 1 click
                  },
                ),
                ListTile(
                  title: const Text('Item 2'),
                  onTap: () {
                    // Handle item 2 click
                  },
                ),
              ],
            ),
          ),
          body: GetBuilder<ServerController>(
            builder: (controller) {
              if (ServerController.serverr.matrix.isEmpty) {
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
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          'assets/bg1.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Scaffold.of(scaffoldContext).openDrawer();
                                print('hello');
                              },
                              child: Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
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
                          top: 40,
                          left: currentWidth * 0.22,
                        ),
                        child: Text(
                          rowDataVal.length > 1
                              ? rowDataVal[1] ?? '30°C'
                              : '30°C',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Gidugu',
                            fontSize: screenHeight * 0.04,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 90, left: 150),
                        child: Text(
                          'Living Area',
                          style: TextStyle(
                            color: Colors.white70,
                            fontFamily: 'Gidugu',
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 1.2,
                        height: screenHeight, // Set the desired height for the GridView
margin: EdgeInsets.only(top: screenHeight-650,left: 18),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child:  FractionallySizedBox(
                            widthFactor:
                                0.8, // Adjust this value to control the size of the GridView
                            heightFactor: 1.0, 
                        
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemCount: () {
                                switch (array_name) {
                                  case "matrix":
                                    return ServerController
                                            .serverr.matrix.length -
                                        1;
                                  case "soil":
                                    return ServerController
                                            .serverr.street.length -
                                        1;
                                  default:
                                    return ServerController.serverr.smart.length -
                                        1;
                                }
                              }(),
                              itemBuilder: (BuildContext context, index) {
                                switch (array_name) {
                                  case "matrix":
                                    rowDataVal = ServerController
                                        .serverr.matrix[index + 1];
                                    break;
                                  case "soil":
                                    rowDataVal = ServerController
                                        .serverr.street[index + 1];
                                    break;
                                  default:
                                    rowDataVal =
                                        ServerController.serverr.smart[index + 1];
                                    break;
                                }
                      
                                String image = rowDataVal[0] ?? "";
                                String value = rowDataVal[1] ?? "";
                                String updatedValue = rowDataVal[2] ?? "";
                      
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color.fromRGBO(255, 255, 255, 0.5),
                                        Color.fromRGBO(255, 255, 255, 0.2),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      transform: GradientRotation(math.pi / 4),
                                    ),
                                  ),
                                  margin: const EdgeInsets.all(5),
                                  padding: const EdgeInsets.all(0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        image,
                                        width: 70,
                                        height: 50,
                                      ),
                                      Text(
                                        value,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                      Text(
                                        updatedValue,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 19,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}
