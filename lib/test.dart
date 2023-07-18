import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/all_item.dart';
import 'package:my_app/controller.dart';

// import 'package:my_app/server.dart';
import 'package:my_app/Home.dart';
import 'package:my_app/swiper.dart';

class AnotherScaffold extends StatelessWidget {
  final serverController = Get.find<ServerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matrix Values'),
      ),
      body: GetBuilder<ServerController>(
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.matrix.length,
            itemBuilder: (BuildContext context, int index) {
              final rowData = controller.matrix[index];
              final image = rowData[0];
              final value = rowData[1];
              final updatedValue = rowData[2];
              return ListTile(
                leading: Image.asset(
                  image,
                  width: 50,
                  height: 50,
                ),
                title: Text(value),
                subtitle: Text(updatedValue),
              );
            },
          );
        },
      ),
    );
  }
}
