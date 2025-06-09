import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double porcentaje;

  const RadialProgress({super.key, required this.porcentaje});

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double porcentajeAnterior;

  @override
  void initState() {
    super.initState();
    porcentajeAnterior = widget.porcentaje;
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiradialProgress(
              (widget.porcentaje - diferenciaAnimar) +
                  (diferenciaAnimar * controller.value),
            ),
          ),
        );
      },
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
