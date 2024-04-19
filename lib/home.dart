import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_quran/all_surah/surah_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = '/HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                padding:
                    MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                elevation: MaterialStateProperty.all<double>(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
