import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/all_item.dart';
import 'package:my_app/controller.dart';
import 'package:my_app/Home.dart';
import 'package:my_app/swiper.dart';


class MyAppLisa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: Lisa(),
    );
  }
}


class Lisa extends StatefulWidget {
  const Lisa({Key? key}) : super(key: key);

  @override
  State<Lisa> createState() => _LisaState();
}

class _LisaState extends State<Lisa> {
  late ServerController serverController = Get.put(ServerController());

  @override
  void initState() {
    super.initState();
    serverController.fetchData(); // Fetch data or initialize the matrix list
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Server"),
      ),
      body: GetBuilder<ServerController>(
        builder: (controller) {
          if (controller.matrix.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: controller.matrix.length,
                    itemBuilder: (BuildContext context, index) {
                      List<String?> rowData = controller.matrix[index];
                      String image = rowData[0] ?? "";
                      String value = rowData[1] ?? "";
                      String updatedValue = rowData[2] ?? "";

                      return Container(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.asset(
                              image,
                              width: 70,
                              height: 50,
                            ),
                            Text(
                              value,
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              updatedValue,
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
