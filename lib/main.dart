// import 'package:disenos_app/src/labs/circular_progress_page.dart';
// import 'package:disenos_app/src/pages/graficas_circulares_pages.dart';
// import 'package:disenos_app/src/pages/pinterest_page.dart';
// import 'package:disenos_app/src/pages/slideshow_page.dart';
import 'package:disenos_app/src/pages/emergency_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: EmergencyPage(),
    );
  }
}
