import 'package:flutter/material.dart';
import 'views/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

    //devDiariesWithVee on Instagram
    //devDiariesWithVee on Youtube
    //vaidehi2701 on Github

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xff091A2A),
        fontFamily: 'Poppins',
      ),
      home: const HomePage(),
    );
  }
}
