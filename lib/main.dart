import 'package:first_job/MainScreen/main_screen.dart';
import 'package:first_job/Theme/Colors/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme:
            const AppBarTheme(backgroundColor: ThemeColor.displayWhite),
        useMaterial3: true,
      ),
      routes: {
        "/": (context) => const MainScreenWidget(),
      },
      initialRoute: "/",
    );
  }
}
