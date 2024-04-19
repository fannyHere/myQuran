import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_quran/model/detail_surah.dart';

class ObjectDetailSurah {
  static Future<DetailSurah> getDetailSurah(String? id) async {
    Uri url = Uri.parse("https://api.quran.gading.dev/surah/$id");
    var res = await http.get(url);
    print(res.body);

    Map<String, dynamic> detailsurah = (jsonDecode(res.body))["data"];
    print(detailsurah[0]); //ambil contoh surat al-fatihah

    // Surah surahFatihah = Surah.fromJson(detailsurah[0]);
    // print(surahFatihah.name.long);
    // print(surahFatihah.name.short);
    return DetailSurah.fromJson(
        detailsurah); //nah ini proses pembuatan bikin objectnya
  }
}
