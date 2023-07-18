
import 'package:flutter/material.dart';
import 'package:my_app/Home.dart';
import 'package:my_app/Street.dart';
import 'package:my_app/all_item.dart';
import 'package:my_app/green_all_item.dart';
import 'package:my_app/greenhouse.dart';
import 'package:my_app/load.dart';
import 'package:my_app/street_all_item.dart';

// import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:my_app/matrix_helper.dart';
import 'package:my_app/display_earth.dart';
import 'package:my_app/small_list.dart';
import 'dart:math' as math;
import 'package:my_app/controller.dart';
import 'package:my_app/server.dart';
import 'package:flutter/services.dart';

class SwiperNew extends StatelessWidget {
  final String arrayName;

  SwiperNew({required this.arrayName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          if (arrayName == "matrix") GreenHouse(),
          if (arrayName == "matrix") GreenAllItem(),
            if (arrayName == "soil") Street(),
          if (arrayName == "soil") StreetAllItem(),
            if (arrayName == "smart") Home(),
          if (arrayName == "smart") AllItem(),
          if(arrayName=="work")Loading(),
        ],
      ),
    );
  }
}
