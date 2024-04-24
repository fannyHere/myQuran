import 'package:flutter/material.dart';
import 'package:my_quran/detail.dart';
import 'surah_list.dart';
import 'home.dart';
import 'theme/color.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // themeMode: ThemeMode.dark, //atur di sini
      // darkTheme: MyThemes2.darkTheme, //atur disini
      themeMode: ThemeMode.light,
      darkTheme: MyThemes1.lightTheme,
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
