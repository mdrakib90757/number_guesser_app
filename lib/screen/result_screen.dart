import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
            'assets/Winners Lottie Animation.json',
            width: 220,
            height: 220,
            fit: BoxFit.fill,
            repeat: false,
          ),
          const SizedBox(height: 20),
          Text(
            'Hurray! I Found It!',
            style: GoogleFonts.fredoka(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'The number in your mind was:',
            style: GoogleFonts.nunito(
              fontSize: 18,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),

          // গেম স্টাইল নাম্বার ডিসপ্লে
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.orange.withOpacity(0.5),
                  blurRadius: 30,
                  spreadRadius: 10,
                ),
              ],
              border: Border.all(color: Colors.orangeAccent, width: 6),
            ),
            child: Center(
              child: Text(
                guessedNumber.toString(),
                style: GoogleFonts.fredoka(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      resultWidget = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/Paul R. Bear Fail.json',
            width: 200,
            height: 200,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 20),
          Text(
            'Oh no! Wrong Info!',
            style: GoogleFonts.fredoka(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Probably your number is out of 1-100 or you gave a wrong answer.',
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                fontSize: 18,
                color: Colors.black54,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Please don't tell a lie 🤥",
            style: GoogleFonts.nunito(
              fontSize: 16,
              color: Colors.grey.shade600,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      );
    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            // নাম্বার অনুযায়ী ব্যাকগ্রাউন্ড কালার চেঞ্জ হবে (সবুজ অথবা লাল)
            colors: (guessedNumber > 0 && guessedNumber <= 100)
                ? [const Color(0xFF84FAB0), const Color(0xFF8FD3F4)] // Win Colors
                : [const Color(0xFFFF9A9E), const Color(0xFFFECFEF)], // Fail Colors
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    // এখানে আমাদের তৈরি করা resultWidget বসবে
                    resultWidget,

                    const SizedBox(height: 50),

                    // Play Again Button (Gaming Style)
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/',
                              (route) => false,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                        decoration: BoxDecoration(
                          color: (guessedNumber > 0 && guessedNumber <= 100)
                              ? Colors.deepPurpleAccent
                              : Colors.redAccent,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.replay_rounded, color: Colors.white, size: 28),
                            const SizedBox(width: 10),
                            Text(
                              'Try Again',
                              style: GoogleFonts.fredoka(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

///
///
//
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class ResultScreen extends StatelessWidget {
//   const ResultScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final int number = ModalRoute.of(context)!.settings.arguments as int;
//
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Color(0xFF84FAB0), Color(0xFF8FD3F4)],
//           ),
//         ),
//         child: SafeArea(
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Lottie.asset(
//                     'assets/Winners Lottie Animation.json',
//                     width: 200,
//                     height: 200,
//                     fit: BoxFit.fill,
//                     repeat: false,
//                   ),
//
//                   const SizedBox(height: 20),
//
//                   Text(
//                     'Hurray! I Found It!',
//                     style: GoogleFonts.fredoka(
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.deepPurple,
//                     ),
//                   ),
//
//                   const SizedBox(height: 10),
//
//                   Text(
//                     'The number in your mind was:',
//                     style: GoogleFonts.nunito(
//                       fontSize: 18,
//                       color: Colors.black54,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//
//                   const SizedBox(height: 30),
//
//                   Container(
//                     width: 150,
//                     height: 150,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       shape: BoxShape.circle,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.orange.withOpacity(0.5),
//                           blurRadius: 30,
//                           spreadRadius: 10,
//                         ),
//                       ],
//                       border: Border.all(color: Colors.orangeAccent, width: 5),
//                     ),
//                     child: Center(
//                       child: Text(
//                         '$number',
//                         style: GoogleFonts.fredoka(
//                           fontSize: 80,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.orange,
//                         ),
//                       ),
//                     ),
//                   ),
//
//                   const SizedBox(height: 50),
//
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pushNamedAndRemoveUntil(
//                         context,
//                         '/',
//                         (route) => false,
//                       );
//                     },
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 40,
//                         vertical: 15,
//                       ),
//                       decoration: BoxDecoration(
//                         color: Colors.deepPurpleAccent,
//                         borderRadius: BorderRadius.circular(50),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.deepPurple.withOpacity(0.4),
//                             blurRadius: 10,
//                             offset: const Offset(0, 5),
//                           ),
//                         ],
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           const Icon(
//                             Icons.replay_rounded,
//                             color: Colors.white,
//                             size: 28,
//                           ),
//                           const SizedBox(width: 10),
//                           Text(
//                             'Play Again',
//                             style: GoogleFonts.fredoka(
//                               fontSize: 22,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
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
///
///
///
// ///
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:audioplayers/audioplayers.dart';
//
// class ResultScreen extends StatefulWidget {
//   const ResultScreen({super.key});
//
//   @override
//   State<ResultScreen> createState() => _ResultScreenState();
// }
//
// class _ResultScreenState extends State<ResultScreen> {
//   final AudioPlayer _audioPlayer = AudioPlayer();
//
//   // এই ভেরিয়েবল দিয়ে আমরা ট্র্যাক করব রেজাল্ট সঠিক নাকি ভুল
//   bool _isSuccess = true;
//
//   @override
//   void initState() {
//     super.initState();
//     // স্ক্রিন আসার সাথে সাথে জেতার সাউন্ড বাজবে
//     _playSound('success.mp3');
//   }
//
//   Future<void> _playSound(String fileName) async {
//     try {
//       await _audioPlayer.stop(); // আগের সাউন্ড বন্ধ করে দেবে
//       await _audioPlayer.play(AssetSource(fileName));
//     } catch (e) {
//       print("Audio Error: $e");
//     }
//   }
//
//   // যদি ভুল হয় তখন এই ফাংশন কল হবে
//   void _showFailState() {
//     setState(() {
//       _isSuccess = false;
//     });
//     _playSound('fail.mp3'); // দুঃখের সাউন্ড বাজবে
//   }
//
//   @override
//   void dispose() {
//     _audioPlayer.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final int? number = ModalRoute.of(context)!.settings.arguments as int?;
//
//     // যদি নাম্বার ০ হয়, তার মানে ইউজার সব 'No' সিলেক্ট করেছে, তাই সরাসরি ফেইল দেখাবে
//     if (number == 0 && _isSuccess) {
//       // এটি বিল্ড টাইমে সমস্যা করতে পারে, তাই আমরা এটি এড়িয়ে ডিফল্ট ভিউতে রাখলাম
//       // তবে আপনি চাইলে লজিক দিয়ে প্রথমেই ফেইল দেখাতে পারেন।
//     }
//
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             // জিপলে সবুজ/নীল, হারলে লাল/ধূসর ব্যাকগ্রাউন্ড
//             colors: _isSuccess
//                 ? [const Color(0xFF84FAB0), const Color(0xFF8FD3F4)]
//                 : [const Color(0xFFFF9A9E), const Color(0xFFFECFEF)],
//           ),
//         ),
//         child: SafeArea(
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // 1. ANIMATION SECTION
//                   Lottie.asset(
//                     _isSuccess
//                         ? 'assets/Winners Lottie Animation.json' // জেতার এনিমেশন
//                         : 'assets/sad_animation.json',           // হারার এনিমেশন (LottieFiles থেকে নামিয়ে নিন)
//                     width: 200,
//                     height: 200,
//                     fit: BoxFit.fill,
//                     repeat: !_isSuccess, // হারলে লুপ হবে, জিতলে একবার
//                   ),
//
//                   const SizedBox(height: 20),
//
//                   // 2. TEXT SECTION
//                   Text(
//                     _isSuccess ? 'Hurray! I Found It!' : 'Oh no! Something wrong!',
//                     style: GoogleFonts.fredoka(
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                       color: _isSuccess ? Colors.deepPurple : Colors.redAccent,
//                     ),
//                   ),
//
//                   const SizedBox(height: 10),
//
//                   Text(
//                     _isSuccess ? 'The number in your mind was:' : 'You might have missed a step!',
//                     style: GoogleFonts.nunito(
//                       fontSize: 18,
//                       color: Colors.black54,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//
//                   const SizedBox(height: 30),
//
//                   // 3. NUMBER DISPLAY (সব সময় দেখাবে)
//                   Container(
//                     width: 150,
//                     height: 150,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       shape: BoxShape.circle,
//                       boxShadow: [
//                         BoxShadow(
//                           color: _isSuccess ? Colors.orange.withOpacity(0.5) : Colors.red.withOpacity(0.3),
//                           blurRadius: 30,
//                           spreadRadius: 10,
//                         ),
//                       ],
//                       border: Border.all(
//                           color: _isSuccess ? Colors.orangeAccent : Colors.redAccent,
//                           width: 5
//                       ),
//                     ),
//                     child: Center(
//                       child: Text(
//                         '${number ?? 0}',
//                         style: GoogleFonts.fredoka(
//                           fontSize: 80,
//                           fontWeight: FontWeight.bold,
//                           color: _isSuccess ? Colors.orange : Colors.grey,
//                         ),
//                       ),
//                     ),
//                   ),
//
//                   const SizedBox(height: 30),
//
//                   // 4. BUTTONS SECTION
//                   // যদি জিতি, তাহলে অপশন দেব "ভুল হয়েছে?" বলার
//                   if (_isSuccess)
//                     TextButton(
//                       onPressed: _showFailState,
//                       child: Text(
//                         "Wait! This is wrong number 😕",
//                         style: GoogleFonts.nunito(
//                           fontSize: 16,
//                           color: Colors.deepPurple.shade700,
//                           decoration: TextDecoration.underline,
//                         ),
//                       ),
//                     ),
//
//                   const SizedBox(height: 20),
//
//                   // Play Again Button
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pushNamedAndRemoveUntil(
//                         context,
//                         '/',
//                             (route) => false,
//                       );
//                     },
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 40,
//                         vertical: 15,
//                       ),
//                       decoration: BoxDecoration(
//                         color: _isSuccess ? Colors.deepPurpleAccent : Colors.redAccent,
//                         borderRadius: BorderRadius.circular(50),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black26,
//                             blurRadius: 10,
//                             offset: const Offset(0, 5),
//                           ),
//                         ],
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           const Icon(
//                             Icons.replay_rounded,
//                             color: Colors.white,
//                             size: 28,
//                           ),
//                           const SizedBox(width: 10),
//                           Text(
//                             'Play Again',
//                             style: GoogleFonts.fredoka(
//                               fontSize: 22,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
///
///
