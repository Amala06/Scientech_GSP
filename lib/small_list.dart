import 'package:flutter/material.dart';
// import 'package:my_app/data.dart';
import 'dart:async';
import 'dart:math';
import 'package:my_app/matrix_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/all_item.dart';
import 'package:my_app/controller.dart';
import 'package:my_app/Home.dart';
import 'package:my_app/swiper.dart';




class SmallList extends StatelessWidget {
  
//   @override
//   _SmallListState createState() => _SmallListState();
// }

// class _SmallListState extends State<SmallList> {
//     late ServerController serverController = Get.put(ServerController());

  

//   // List<List<String>> matrix = [
//   //   ["assets/i3.png", "Temp", "0"],
//   //   ["assets/i2.png", "Humidity", "0"],
//   //   ["assets/i1.png", "Pollution", "0"],
//   //   ["assets/i1.png", "Quality", "0"],
//   //   ["assets/i2.png", "Oxygen", "0"],
//   //   ["assets/i3.png", "Sulphur", "0"],
//   //   ["assets/i1.png", "Carbon", "0"],
//   //   ["assets/i2.png", "Mild", "0"]
//   // ];

//   // String updatedValue = '';

//   @override
//    void initState() {
//     super.initState();
//    serverController.fetchData();
//   }


  // void initState() {
  //   super.initState();
  //   generateNewStringWithDelay(const Duration(seconds: 2));
  // }

  // void generateNewStringWithDelay(Duration delay) {
  //   Timer.periodic(delay, (Timer timer) {
  //     String value = generateString(8);
  //     debugPrint(value);
  //     setState(() {
  //       updateMatrixValues(value);
  //     });
  //   });
  // }

  // String generateString(int length) {
  //   Random random = Random();
  //   List<int> numbers = List.generate(length, (_) => random.nextInt(100) + 1);
  //   return numbers.join(', ');
  // }

  // void updateMatrixValues(String value) {
  //   List<String> wordArray = value.split(', ');
  //   for (var i = 0; i < matrix.length; i++) {
  //     matrix[i][2] = wordArray[i];
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ServerController>(builder: (controller) {
          if (ServerController.serverr.matrix.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else{
            return Column(
      children: [
        Expanded(
   child:GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of columns
              ),
              itemCount: 3, // Number of rows
              itemBuilder: (BuildContext context, int index) {

//---------------------------------------------------------------------------------------//
// String array_name="";
//                     // String ind=ServerController.serverr.matrix[0][2];
//                     if(ServerController.serverr.matrix[0][2]=='1'){
//                    array_name="matrix";
//                     }
//                     else if(ServerController.serverr.soil[0][2] == '2'){
//                    array_name = "soil";
//                     }
//                     else{
//                     array_name = "smart";
//                     }

String array_name = "";

                    if (ServerController.serverr.matrix[0][2] == '1') {
                      array_name = "matrix";
                    } else if (ServerController.serverr.street[0][2] == '2') {
                      array_name = "street";
                    } else {
                      array_name = "smart";
                    }

                    List<String?> rowDataVal;

                    switch (array_name) {
                      case "matrix":
                        rowDataVal = ServerController.serverr.matrix[index];
                        break;
                      case "street":
                        rowDataVal = ServerController.serverr.street[index];
                        break;
                      default:
                        rowDataVal = ServerController.serverr.smart[index];
                        break;
                    }

                  // List<String?> rowDataVal =ServerController.serverr.${array_name}[index];
//----------------------------------------------------------------------------------------//

        
                    String image = rowDataVal[0] ?? "";
                    String value = rowDataVal[1] ?? "";
                    String updatedValue = rowDataVal[2] ?? "";




                  //  List<String?> rowData = ServerController.serverr.matrix[index];
                  //   String image = rowData[0] ?? "";
                  //   String value = rowData[1] ?? "";
                  //   String updatedValue = rowData[2] ?? "";

                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient:const LinearGradient(
                      colors: [
                        Color.fromRGBO(255, 255, 255, 0.5),
                        Color.fromRGBO(255, 255, 255, 0.2),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      transform: GradientRotation(pi / 4),
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
                      // const SizedBox(height: 10),
                      Text(
                        value,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                      // const SizedBox(height: 5),
                      Text(
                        updatedValue,
                        style:const  TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          // fontWeight: FontWeight.bold
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
    );
    
    
    
    
    
  }
}
