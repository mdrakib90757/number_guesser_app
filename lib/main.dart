import 'package:flutter/material.dart';
import 'package:number_guesser_app/screen/game_screen.dart';
import 'package:number_guesser_app/screen/result_screen.dart';
import 'package:number_guesser_app/screen/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Guesser',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/game': (context) => const GameScreen(),
        '/result': (context) => const ResultScreen(),
      },
    );
  }
}