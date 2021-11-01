import 'package:flutter/material.dart';
import 'package:quotez/ui/home.dart';
import 'package:quotez/ui/saved_quotes_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/home_screen",
      routes: {
        '/home_screen': (context) => HomeScreen(),
        '/saved_quotes_screen': (context) => SavedQuotesScreen(),
      },
    );
  }
}
