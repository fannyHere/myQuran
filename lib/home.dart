import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_quran/surah_list.dart';
import 'package:my_quran/theme/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = '/HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text(
                "Al-Quran Media",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  //color: Color(0xFF431AA1),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                "Apakah kamu sudah membaca al-Quran hari ini?",
                style: TextStyle(
                  //color: Colors.grey,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(20),
              width: 200,
              height: 200,
              child: Lottie.asset(
                "assets/lottie/home3.json",
                fit: BoxFit.fill,
                repeat: true,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, surah_list.routeName);
              },
              child: Text("KLIK ME"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  isDarkMode ? appWhite : appPurple,
                ),
                foregroundColor: MaterialStateProperty.all<Color>(
                  isDarkMode ? appPurple : appWhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
