// import 'package:disenos_app/src/labs/circular_progress_page.dart';
// import 'package:disenos_app/src/pages/graficas_circulares_pages.dart';
// import 'package:disenos_app/src/pages/pinterest_page.dart';
// import 'package:disenos_app/src/pages/slideshow_page.dart';
// import 'package:disenos_app/src/pages/emergency_page.dart';
// import 'package:disenos_app/src/pages/sliver_list_page.dart';
import 'package:disenos_app/src/pages/launcher_page.dart';
import 'package:disenos_app/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeChanger(2),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTheme = context.watch<ThemeChanger>().currentTheme;

    return  MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: LauncherPage(),
    );
  }
}
