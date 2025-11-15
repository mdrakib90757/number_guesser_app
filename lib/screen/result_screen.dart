import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final guessedNumber = ModalRoute.of(context)!.settings.arguments as int;

    Widget resultWidget;

    if (guessedNumber > 0 && guessedNumber <= 100) {
      resultWidget = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/Trophy.json',
            width: 200,
            height: 200,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 32),
          const Text(
            'The number you were thinking of is',
            style: TextStyle(fontSize: 20, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            guessedNumber.toString(),
            style: const TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
          ),
        ],
      );
    } else {
      resultWidget = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.warning_amber_rounded,
            color: Colors.orange,
            size: 80,
          ),
          const SizedBox(height: 20),
          const Text(
            'Probably your number is out of 1-100 or you gave a wrong answer',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            "Please don't tell a lie",
            style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
          ),
        ],
      );
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              resultWidget,
              const SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/',
                    (route) => false,
                  );
                },
                child: const Text('Try Again',style: TextStyle(
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
