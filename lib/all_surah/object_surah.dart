import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/surah.dart';

class ObjectSurah {
  static Future<List<Surah>> getAllSurah() async {
    Uri url = Uri.parse("https://api.quran.gading.dev/surah/");
    var res = await http.get(url);
    //print(res.body);

    List surahLengkap = (jsonDecode(res.body) as Map<String, dynamic>)["data"];
    print(surahLengkap[0]); //ambil contoh surat al-fatihah

    // Surah surahFatihah = Surah.fromJson(surahLengkap[0]);
    // print(surahFatihah.name.long);
    // print(surahFatihah.name.short);
    return surahLengkap.map((e) => Surah.fromJson(e)).toList();
  }
}
