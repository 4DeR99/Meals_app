import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:meals_app/features/tabs/UI/tabs.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 136, 207, 163),
  ),
  textTheme: GoogleFonts.latoTextTheme(
    const TextTheme(
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  ),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const TabsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
