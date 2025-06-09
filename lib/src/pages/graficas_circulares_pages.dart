import 'package:disenos_app/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraficasCircularesPages extends StatefulWidget {
  const GraficasCircularesPages({super.key});

  @override
  State<GraficasCircularesPages> createState() =>
      _GraficasCircularesPagesState();
}

class _GraficasCircularesPagesState extends State<GraficasCircularesPages> {
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: RadialProgress(porcentaje: porcentaje),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            porcentaje += 10;
            if (porcentaje > 100) {
              porcentaje = 0;
            }
          });
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
