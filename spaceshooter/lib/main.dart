import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Container(
            decoration: BoxDecoration(color: Colors.red),
            child: CustomPaint(
              painter: spaceShuttle(
                  leftpoint: Offset(50, 300),
                  topPoint: Offset(100, 200),
                  rightPoint: Offset(150, 300)),
            )),
      ),
    );
  }
}

class spaceShuttle extends CustomPainter {
  final Offset leftpoint;
  final Offset topPoint;
  final Offset rightPoint;
  spaceShuttle(
      {required this.leftpoint,
      required this.topPoint,
      required this.rightPoint});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    paint.color = Colors.blue;
    paint

    canvas.drawLine(leftpoint, topPoint, paint);
    canvas.drawLine(topPoint, rightPoint, paint);
    canvas.drawLine(rightPoint, leftpoint, paint);
  }

  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
