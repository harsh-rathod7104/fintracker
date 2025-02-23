import 'package:dynamic_color/dynamic_color.dart';
import 'package:fintracker/screens/main_screen/views/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Fintracker",
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      theme: ThemeData(
        brightness: Brightness.light,
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      home: MainScreen(),
    );
  }
}
