import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  static const String _themeKey = 'selected_theme';

  // Definindo as 5 opções de cores
  static const Map<String, Color> themeColors = {
    'Roxo Profundo': Colors.deepPurple,
    'Azul Oceano': Colors.blue,
    'Verde Natureza': Colors.green,
    'Laranja Vibrante': Colors.orange,
    'Rosa Elegante': Colors.pink,
  };

  String _selectedTheme = 'Roxo Profundo';

  String get selectedTheme => _selectedTheme;

  Color get primaryColor => themeColors[_selectedTheme] ?? Colors.deepPurple;

  ThemeData get themeData {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
      useMaterial3: true,
    );
  }

  Future<void> setTheme(String themeName) async {
    if (themeColors.containsKey(themeName)) {
      _selectedTheme = themeName;
      notifyListeners();

      // Salvar a preferência
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_themeKey, themeName);
    }
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    _selectedTheme = prefs.getString(_themeKey) ?? 'Roxo Profundo';
    notifyListeners();
  }
}

