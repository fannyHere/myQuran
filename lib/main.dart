import 'package:flutter/material.dart';
import 'package:my_quran/detail_surah/detail.dart';
import 'all_surah/surah_list.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        //fontFamily: GoogleFonts.dosis().fontFamily,
      ),
      home: HomePage(),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        surah_list.routeName: (context) => surah_list(),
        Detail_all_surah.routeName: (context) => Detail_all_surah(),
      },
    );
  }
}
