import 'package:get/get.dart';
import 'package:my_app/server.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:io';

class ServerController extends GetxController {
  static ServerController get serverr=>Get.find();

  Server? server;
  List<String> serverLogs = [];
  String s = "Not Connected";
  TextEditingController messageController = TextEditingController();

  @override
  void onInit(){
    server = Server(onData, onError);
    startServer();
    fetchData();
    super.onInit();
  }
  


  void fetchData() {
    // Simulate fetching data from server and populate the matrix list
    // Replace this with your actual data fetching logic
    matrix = [
      ["assets/i1.png", "Green House ", "0"],
      ["assets/i2.png", "Temp", "0"],
      ["assets/i3.png", "Humidity", "0"],
      ["assets/i1.png", "Gas Detect", "0"],
      ["assets/i2.png", "UV Index", "0"],
      ["assets/i3.png", "Water Level", "0"],
   
    ];
    street=[
      ["assets/i1.png", "Street Light", "0"],
      ["assets/i2.png", "Voltage", "0"],
      ["assets/i3.png", "LDR", "0"],
      ["assets/i1.png", "PIR", "0"],
      ["assets/i2.png", "Soldier Panel voltage", "0"],
      ["assets/i3.png", "Battery Voltage", "0"],
    ];
    smart=[
     ["assets/i1.png", "IOT Smart Training System", "0"],
      ["assets/i2.png", "Water Level", "0"],
      ["assets/i3.png", "LDR Sensor", "0"],
      ["assets/i1.png", "Acc : X axis", "0"],
      ["assets/i2.png", "Acc : y axis", "0"],
      ["assets/i3.png", "Acc : z axis", "0"],
      ["assets/i1.png", "Temp", "0"],
      ["assets/i2.png", "Humidity", "0"],
      ["assets/i3.png", "Tilt", "0"],
    ];
    work=[];

   
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
     ["assets/i1.png", "Green House ", "0"],
    ["assets/i2.png", "Temp", "0"],
    ["assets/i3.png", "Humidity", "0"],
    ["assets/i1.png", "Gas Detect", "0"],
    ["assets/i2.png", "UV Index", "0"],
    ["assets/i3.png", "Water Level", "0"],
  ];
    List<List<String>> street = [
    ["assets/i1.png", "Street Light", "0"],
    ["assets/i2.png", "Voltage", "0"],
    ["assets/i3.png", "LDR", "0"],
    ["assets/i1.png", "PIR", "0"],
    ["assets/i2.png", "Soldier Panel voltage", "0"],
    ["assets/i3.png", "Battery Voltage", "0"],

  ];
    List<List<String>> smart = [
    ["assets/i1.png", "IOT Smart Training System", "0"],
    ["assets/i2.png", "Water Level", "0"],
    ["assets/i3.png", "LDR Sensor", "0"],
    ["assets/i1.png", "Acc : X axis", "0"],
    ["assets/i2.png", "Acc : y axis", "0"],
    ["assets/i3.png", "Acc : z axis", "0"],
    ["assets/i1.png", "Temp", "0"],
    ["assets/i2.png", "Humidity", "0"],
    ["assets/i3.png", "Tilt", "0"],
    
  ];
List<List<String>> work=[];
  void updateMatrixValues(String value) {
    List<String> wordArray = value.split(',');

    //changes //
    //----------------------------------------------------------------------------------------//
    if(wordArray[0]=='1'){
 for (var i = 0; i < matrix.length; i++) {
        matrix[i][2] = wordArray[i].trim();
        // Use trim() to remove any leading/trailing whitespace
        // print(matrix[i][2]);
      }
    }
    if(wordArray[0]=='2'){
       for (var i = 0; i < street.length; i++) {
        street[i][2] = wordArray[i].trim();
        // Use trim() to remove any leading/trailing whitespace
        // print(matrix[i][2]);
      }
    }
    if (wordArray[0] == '3') {
      for (var i = 0; i < smart.length; i++) {
        smart[i][2] = wordArray[i].trim();
        // Use trim() to remove any leading/trailing whitespace
        // print(matrix[i][2]);
      }
    }
//------------------------------------------------------------------------------//
    // if (wordArray.length >= 8) {
    //   for (var i = 0; i < matrix.length; i++) {
    //     matrix[i][2] = wordArray[i].trim();
    //     // Use trim() to remove any leading/trailing whitespace
    //     // print(matrix[i][2]);
    //   }
    // }
    update();
    // for (int i = 0; i < matrix.length; i++) {
    //   print(matrix[i][0]);
    //   print(matrix[i][1]);
    //   print(matrix[i][2]);
    //   print(' ');
    // }
  }

  void updateConnection() {
    s = "  Connected";
    update();
  }
}
