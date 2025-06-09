import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({super.key});

  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage>
    with SingleTickerProviderStateMixin {
  double porcentaje = 0.0;
  double nuevoPorcentaje = 0.0;

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    controller.addListener(() {
      // print('Valor controller: ${controller.value}');

      setState(() {
        porcentaje = lerpDouble(porcentaje, nuevoPorcentaje, controller.value)!;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          porcentaje += nuevoPorcentaje;
          nuevoPorcentaje += 10;
          if (nuevoPorcentaje > 100) {
            porcentaje = 0;
            nuevoPorcentaje = 0;
          }

          controller.forward(from: 0.0);
          setState(() {});
        },
        backgroundColor: Colors.pink,
        child: Icon(Icons.refresh),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5),
          width: 300,
          height: 300,
          // color: Colors.red,
          child: CustomPaint(painter: _MiradialProgress(porcentaje)),
        ),
      ),
    );
  }
}

class _MiradialProgress extends CustomPainter {
  final double porcentaje;

  _MiradialProgress(this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {
    // Circulo completado
    final paint =
        Paint()
          ..strokeWidth = 5
          ..color = Colors.grey
          ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width * 0.5, size.height / 2);
    final double radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);

    // arco
    final paintArco =
        Paint()
          ..strokeWidth = 10
          ..color = Colors.pink
          ..style = PaintingStyle.stroke;

    // Parte que se deberá ir llenando
    double arcAngle = 2 * pi * (porcentaje / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio),
      -pi / 2,
      arcAngle,
      false,
      paintArco,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
