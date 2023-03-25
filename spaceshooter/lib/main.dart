import 'package:flutter/material.dart';
import 'dart:math';

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
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
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

class spaceShooterGame extends StatefulWidget {

  @override
  spaceShooterGameState createState() => spaceShooterGameState();
}

class spaceShuttle extends CustomPainter {
  final Offset leftpoint;
  final Offset topPoint;
  final Offset rightPoint;
  final double gunWidth = 10;
  final double gunheight = 20;
  final List<Offset> leftGunCoordinates;
  spaceShuttle(
      {required this.leftpoint,
      required this.topPoint,
      required this.rightPoint,
      
      });

  void drawLeftGun(Path path) {
    path.moveTo(leftpoint.dx + (topPoint.dx - leftpoint.dx) / 2,
        leftpoint.dy - (leftpoint.dy - topPoint.dy) / 2);
    path.lineTo(x, y)
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    paint.color = Colors.blue;

    Path path = Path();
    path.moveTo(leftpoint.dx, leftpoint.dy);
    path.lineTo(topPoint.dx, topPoint.dy);
    path.lineTo(rightPoint.dx, rightPoint.dy);
    path.close();
    canvas.drawPath(path, paint);
  }

  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class CirclePainter extends CustomPainter {
  final Color borderColor;
  final Color fillColor;
  final double borderWidth;

  CirclePainter({
    required this.borderColor,
    required this.fillColor,
    required this.borderWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2) - borderWidth / 2;

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    final fillPaint = Paint()..color = fillColor;

    canvas.drawCircle(center, radius, borderPaint);
    canvas.drawCircle(center, radius - borderWidth / 2, fillPaint);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) =>
      borderColor != oldDelegate.borderColor ||
      fillColor != oldDelegate.fillColor ||
      borderWidth != oldDelegate.borderWidth;
}
