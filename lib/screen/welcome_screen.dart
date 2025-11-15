import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Lottie.asset(
            'assets/two-people-thinking.json',
            width: 200,
            height: 200,
            fit: BoxFit.fill,
          ),
              const SizedBox(height: 32),
              const Text(
                'Think of a number between 1 and 100',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                "Don't tell me! Just keep it in your mind.",
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/game');
                },
                child: const Text('Get Started',style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
