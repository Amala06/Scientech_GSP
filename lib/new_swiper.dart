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

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
            } else if (ServerController.serverr.smart[0][2] == '3') {
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

            // Check if array_name is "matrix"
            if (array_name == "matrix") {
              return Home(); // Return the Home widget if array_name is "matrix"
            }

            // Return the desired widget based on the conditions
            return Container(
              child: Text(
                "hello"
              ),
                );
          }
        },
      ),
    );
  }
}
