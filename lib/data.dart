import 'package:flutter/material.dart';
import 'package:my_app/test_value.dart';

List<List<String>> matrix = [
  ["assets/net.png", "temp", "lp"],
  ["assets/earth.png", "humidity", "lp"],
  ["assets/build.png", "pollution", "lp"],
  ["assets/net.png", "quality", "lp"],
  ["assets/earth.png", "oxygen", "lp"],
  ["assets/build.png", "sulphur", "lp"],
  ["assets/net.png", "carbon", "lp"],
  ["assets/build.png", "mild", "lp"]
];

void updateMatrixValues(String value) {
  List<String> wordArray = value.split(', ');
  for (var i = 0; i < matrix.length; i++) {
    matrix[i][2] = wordArray[i];
  }
}

void main() {
  String value = generateNewStringWithDelay(const Duration(seconds: 2));
  updateMatrixValues(value);

  // Print the updated matrix values
  for (var row in matrix) {
    debugPrint(row.toString());
  }
}
