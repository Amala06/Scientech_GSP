import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
class MatrixHelper {
  List<List<String>> matrix = [
    ["assets/i3.png", "Temp", "0"],
    ["assets/i2.png", "Humidity", "0"],
    ["assets/i1.png", "Pollution", "0"],
    ["assets/i1.png", "Quality", "0"],
    ["assets/i2.png", "Oxygen", "0"],
    ["assets/i3.png", "Sulphur", "0"],
    ["assets/i1.png", "Carbon", "0"],
    ["assets/i2.png", "Mild", "0"]
  ];

  void updateMatrixValues(String value) {
    List<String> wordArray = value.split(', ');
    for (var i = 0; i < matrix.length; i++) {
      matrix[i][2] = wordArray[i];
    }
  }
  

  String generateString(int length) {
    Random random = Random();
    List<int> numbers = List.generate(length, (_) => random.nextInt(100) + 1);
          print(numbers);

    return numbers.join(',    ');
      //     debugPrint(value);

  }
    int getRowCount() {
    return matrix.length;
  }

  Stream<String> generateNewStringsWithDelay(Duration delay) async* {
    while (true) {
      await Future.delayed(delay);
      yield generateString(8);
    }
  }
}
