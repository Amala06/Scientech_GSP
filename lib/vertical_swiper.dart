// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';


// class SwipePage extends StatefulWidget {
//   @override
//   _SwipePageState createState() => _SwipePageState();
// }

// class _SwipePageState extends State<SwipePage> {
//   bool isComponentVisible = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Swipe Page'),
//       ),
//       body: Column(
//         children: [
//           if (isComponentVisible) ComponentA(),
//           GestureDetector(
//             onVerticalDragUpdate: (details) {
//               // Adjust the sensitivity as needed
//               if (details.delta.dy < -10) {
//                 setState(() {
//                   isComponentVisible = false;
//                 });
//               }
//             },
//             onVerticalDragEnd: (_) {
//               setState(() {
//                 isComponentVisible = true;
//               });
//             },
//             child: Container(
//               color: Colors.transparent,
//               height: MediaQuery.of(context).size.height,
//             ),
//           ),
//           if (!isComponentVisible) ComponentB(),
//         ],
//       ),
//     );
//   }
// }
