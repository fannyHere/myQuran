import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_quran/model/ayat.dart';

void main() async {
  // static Future<Ayat> getAyat() async {
  Uri url = Uri.parse("https://api.quran.gading.dev/surah/108/1");
  var res = await http.get(url);
  //print(res.body);

  Map<String, dynamic> data = (jsonDecode(res.body))["data"];

  //klo cuma mau ambil bagian tertentu aja misalnya diambil semua kecuali bagian surah
  Map<String, dynamic> dataToModel = {
    "number": data["number"],
    "meta": data["meta"],
    "text": data["text"],
    "translation": data["translation"],
    "audio": data["audio"],
  };

  Ayat ayat = Ayat.fromJson(dataToModel);
  print(ayat);
  //return Ayat.fromJson(ayat);
  //print(ayat);
  //}
}
