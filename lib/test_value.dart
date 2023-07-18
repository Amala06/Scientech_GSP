import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  generateNewStringWithDelay(const Duration(seconds: 2));
}

String generateNewStringWithDelay(Duration delay) {
  String a = "";
  Timer.periodic(delay, (Timer timer) {
    a = generateString(8);
    debugPrint(a);
  });
  return a;
}

String generateString(int length) {
  Random random = Random();
  List<int> numbers = List.generate(length, (_) => random.nextInt(100) + 1);
  return numbers.join(', ');
}
