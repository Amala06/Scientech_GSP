import 'package:get/get.dart';
import 'package:my_app/server.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:io';

class ServerController extends GetxController {
  static ServerController get serverr => Get.find();

  Server? server;
  List<String> serverLogs = [];
  String s = "Not Connected";
  TextEditingController messageController = TextEditingController();

  @override
  void onInit() {
    server = Server(onData, onError);
    startServer();
    fetchData();
    super.onInit();
  }

  void fetchData() {
    // Simulate fetching data from server and populate the matrix list
    // Replace this with your actual data fetching logic
    matrix = [
      ["assets/i1.png", "temp", "0"],
      ["assets/i2.png", "humidity", "0"],
      ["assets/i3.png", "pollution", "0"],
      ["assets/i1.png", "quality", "0"],
      ["assets/i2.png", "oxygen", "0"],
      ["assets/i3.png", "sulphur", "0"],
      ["assets/i1.png", "carbon", "0"],
      ["assets/i2.png", "jkjkj", "0"],
    ];
    
  }

  startServer() async {
    // server = Server(onData: onData, onError: onError);
    if (server!.running) {
      await server!.stop();
      serverLogs.clear();
    } else {
      await server!.start();
      // await server.start();

// Inside the onData callback
      void handleData(Uint8List data) {
        String receivedMessage = String.fromCharCodes(data);
        // Process the received message
        if (receivedMessage == "connected") {
          updateConnection();
        }
        if (receivedMessage != "connected") {
          updateMatrixValues(receivedMessage);
        }

        print('Received message: $receivedMessage');
        serverLogs.add(receivedMessage);
        update();
      }

// Set the onData callback

      server?.onData = handleData;
    }
    update();
  }

  void onData(Uint8List data) {
    final recievedData = String.fromCharCodes(data);
    if (recievedData != "connected") {
      updateMatrixValues(recievedData);
    }
    print('Received message: $recievedData');

    serverLogs.add(recievedData);
    //    debugPrint('$recievedData');
    update();
  }

  void onError(dynamic error) {
    debugPrint("Eroor:$error");
  }

  void handleMessage() {
    server!.send(messageController.text);
    serverLogs.add(messageController.text);
    messageController.clear();
    update();
  }

  List<List<String>> matrix = [
    ["assets/net.png", "temp", "lp"],
    ["assets/earth.png", "humidity", "lp"],
    ["assets/build.png", "pollution", "lp"],
    ["assets/net.png", "quality", "lp"],
    ["assets/earth.png", "oxygen", "lp"],
    ["assets/build.png", "sulphur", "lp"],
    ["assets/net.png", "carbon", "lp"],
    ["assets/build.png", "pmp", "lp"],
  ];

  void updateMatrixValues(String value) {
    List<String> wordArray = value.split(',');
    if (wordArray.length >= 8) {
      for (var i = 0; i < matrix.length; i++) {
        matrix[i][2] = wordArray[i].trim();
        // Use trim() to remove any leading/trailing whitespace
        // print(matrix[i][2]);
      }
    }
    update();
    for (int i = 0; i < matrix.length; i++) {
      print(matrix[i][0]);
      print(matrix[i][1]);
      print(matrix[i][2]);
      print(' ');
    }
  }

  void updateConnection() {
    s = "  Connected";
    update();
  }
}
