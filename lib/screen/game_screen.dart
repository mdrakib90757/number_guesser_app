// import 'package:flutter/material.dart';
// import '../data/game_data.dart';
//
// class GameScreen extends StatefulWidget {
//   const GameScreen({super.key});
//
//   @override
//   State<GameScreen> createState() => _GameScreenState();
// }
//
// class _GameScreenState extends State<GameScreen> {
//   int _currentStep = 0;
//   int _calculatedNumber = 0;
//   final List<List<int>> _numberLists = GameData.generateNumberLists();
//
//   void _handleAnswer(bool isPresent) {
//     if (isPresent) {
//       _calculatedNumber += GameData.cardValues[_currentStep];
//     }
//
//     if (_currentStep < 6) {
//       setState(() {
//         _currentStep++;
//       });
//     } else {
//       Navigator.pushReplacementNamed(
//         context,
//         '/result',
//         arguments: _calculatedNumber,
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Step ${_currentStep + 1} of 7',
//                 style: const TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 'Is your number in this list?',
//                 style: TextStyle(fontSize: 18, color: Colors.black54),
//               ),
//               const SizedBox(height: 20),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Wrap(
//                     spacing: 10.0,
//                     runSpacing: 15.0,
//                     children: _numberLists[_currentStep].map((number) {
//                       return Container(
//                         padding: const EdgeInsets.symmetric(
//                           vertical: 8,
//                           horizontal: 16,
//                         ),
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.grey.shade300),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Text(
//                           number.toString(),
//                           style: const TextStyle(fontSize: 16),
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.teal,
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 40,
//                         vertical: 15,
//                       ),
//                     ),
//                     onPressed: () => _handleAnswer(true),
//                     child: const Text("Yes, it's there"),
//                   ),
//                   const SizedBox(width: 20),
//                   OutlinedButton(
//                     style: OutlinedButton.styleFrom(
//                       side: const BorderSide(color: Colors.red),
//                       foregroundColor: Colors.red,
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 40,
//                         vertical: 15,
//                       ),
//                     ),
//                     onPressed: () => _handleAnswer(false),
//                     child: const Text('No, not there'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

///
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/game_data.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int _currentStep = 0;
  int _calculatedNumber = 0;
  late List<List<int>> _numberLists;

  @override
  void initState() {
    super.initState();
    _initializeAndShuffleLists();
  }

  void _initializeAndShuffleLists() {
    final rawData = GameData.generateNumberLists();

    final random = Random();


    _numberLists = rawData.map((list) {
      var shuffledList = List<int>.from(list);
      shuffledList.shuffle(random);
      return shuffledList;
    }).toList();
  }

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


  ///
  // final List<List<int>> _numberLists = GameData.generateNumberLists();
  //
  // void _handleAnswer(bool isPresent) {
  //   if (isPresent) {
  //     _calculatedNumber += GameData.cardValues[_currentStep];
  //   }
  //
  //   if (_currentStep < 6) {
  //     setState(() {
  //       _currentStep++;
  //     });
  //   } else {
  //     Navigator.pushReplacementNamed(
  //       context,
  //       '/result',
  //       arguments: _calculatedNumber,
  //     );
  //   }
  // }
  ///








  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFFF1EB), Color(0xFFACE0F9)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5),
                        ],
                      ),
                      child: Text(
                        'Level ${_currentStep + 1}/7',
                        style: GoogleFonts.fredoka(
                          fontSize: 18,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.stars_rounded,
                      color: Colors.orangeAccent,
                      size: 35,
                    ),
                  ],
                ),
              ),

              Text(
                'Is your number here?',
                style: GoogleFonts.nunito(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 15),

              Expanded(
                child: Container(
                  //margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: SingleChildScrollView(
                    child: Wrap(
                      spacing: 10.0,
                      runSpacing: 10.0,
                      alignment: WrapAlignment.center,
                      children: _numberLists[_currentStep].map((number) {
                        return Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.2),
                                blurRadius: 4,
                                offset: const Offset(2, 3),
                              ),
                            ],
                            border: Border.all(
                              color: Colors.blueAccent.withOpacity(0.3),
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              number.toString(),
                              style: GoogleFonts.fredoka(
                                fontSize: 20,
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
                child: Row(
                  children: [
                    // No Button
                    Expanded(
                      child: _buildGameButton(
                        label: "NO",
                        icon: Icons.close_rounded,
                        color: const Color(0xFFFF80AB), // Pinkish Red
                        onTap: () => _handleAnswer(false),
                      ),
                    ),
                    const SizedBox(width: 20),
                    // Yes Button
                    Expanded(
                      child: _buildGameButton(
                        label: "YES",
                        icon: Icons.check_rounded,
                        color: const Color(0xFF00BFA5), // Teal Green
                        onTap: () => _handleAnswer(true),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGameButton({
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 8,
              offset: const Offset(0, 4), // 3D Shadow effect
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 28),
            const SizedBox(width: 8),
            Text(
              label,
              style: GoogleFonts.fredoka(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
