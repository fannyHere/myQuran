import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_quran/model/detail_surah.dart';

void main() async {
  //Future<DetailSurah> getDetailSurah() async {
  int index = 0;
  Uri url = Uri.parse("https://api.quran.gading.dev/surah/${index + 1}");
  var res = await http.get(url);
  print(res.body);
  print("===================================================================");
  Map<String, dynamic> detailsurah =
      (jsonDecode(res.body) as Map<String, dynamic>)["data"];
  print(detailsurah); //ambil contoh surat al-fatihah

  // Surah surahFatihah = Surah.fromJson(detailsurah[0]);
  // print(surahFatihah.name.long);
  // print(surahFatihah.name.short);
  //return DetailSurah.fromJson(detailsurah);
  DetailSurah.fromJson(detailsurah);
}
