import 'package:flutter/material.dart';
import '../data/game_data.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int _currentStep = 0;
  int _calculatedNumber = 0;
  final List<List<int>> _numberLists = GameData.generateNumberLists();

  void _handleAnswer(bool isPresent) {
    if (isPresent) {
      _calculatedNumber += GameData.cardValues[_currentStep];
    }

    if (_currentStep < 6) {
      setState(() {
        _currentStep++;
      });
    } else {
      Navigator.pushReplacementNamed(
        context,
        '/result',
        arguments: _calculatedNumber,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Step ${_currentStep + 1} of 7',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Is your number in this list?',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: 10.0,
                    runSpacing: 10.0,
                    children: _numberLists[_currentStep].map((number) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          number.toString(),
                          style: const TextStyle(fontSize: 16),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                    ),
                    onPressed: () => _handleAnswer(true),
                    child: const Text("Yes, it's there"),
                  ),
                  const SizedBox(width: 20),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.red),
                      foregroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                    ),
                    onPressed: () => _handleAnswer(false),
                    child: const Text('No, not there'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
