import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  ThemeData _currentTheme = ThemeData.light();

  bool get darkTheme => _darkTheme;
  bool get customTheme => _customTheme;
  ThemeData get currentTheme => _currentTheme;

  ThemeChanger(int theme) {
    switch (theme) {
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light().copyWith(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.red, // Color de fondo del AppBar
            foregroundColor:
                Colors.white, // Color de los iconos y texto en el AppBar
          ),
          iconTheme: IconThemeData(
            color: Colors.blue, // Custom color for icons
            size: 24.0,
            opacity: 1.0,
          ),
        );
        break;

      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xff16202b),
          appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
          foregroundColor:
              Colors.white, // Color de los iconos y texto en el AppBar
        ),
          textTheme: TextTheme(bodySmall: TextStyle(color: Colors.white)),
          iconTheme: IconThemeData(
            color: Colors.red, // Custom color for icons
            size: 24.0,
            opacity: 1.0,
          ),
        );
        break;

      case 3:
        _darkTheme = false;
        _customTheme = true;
        break;

      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
    }
  }

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;

    if (value) {
      _currentTheme = ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff16202b),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
          foregroundColor:
              Colors.white, // Color de los iconos y texto en el AppBar
        ),
        textTheme: TextTheme(bodySmall: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(
          color: Colors.red, // Custom color for icons
          size: 24.0,
          opacity: 1.0,
        ),
      );
    } else {
      _currentTheme = ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor:
              Colors.white, // Color de los iconos y texto en el AppBar
        ),
        iconTheme: IconThemeData(
          color: Colors.blue, // Custom color for icons
          size: 24.0,
          opacity: 1.0,
        ),
      );
    }

    notifyListeners();
  }

  set customTheme(bool value) {
    _customTheme = value;
    _darkTheme = false;

    if (value) {
      _currentTheme = ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
          foregroundColor:
              Colors.white, // Color de los iconos y texto en el AppBar
        ),
        iconTheme: IconThemeData(
          color: Colors.red, // Custom color for icons
          size: 24.0,
          opacity: 1.0,
        ),
      );
    } else {
      _currentTheme = ThemeData.light().copyWith(
        // primaryColorLight: Colors.white,
        textTheme: TextTheme(bodySmall: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(
          color: Colors.blue, // Custom color for icons
          size: 24.0,
          opacity: 1.0,
        ),
      );
    }

    notifyListeners();
  }
}
