import 'dart:convert';

import 'package:http/http.dart' as http;
//import 'package:my_quran/model/detail_surah.dart';
import 'package:my_quran/model/surah.dart';

void main() async {
  //SECTION 1: MENAMPILKAN SELURUH SURAH BUAT LIST AWALAN

  //LANGKAH 1: GET API
  Uri url = Uri.parse("https://api.quran.gading.dev/surah/");
  var res = await http.get(url);
  print(res.headers);
  print("=====================================================");
  print(res.body);

  //LANGKAH 2: UBAH RESPONSE STRING JADI MAP(PROSES DECODE)
  //*tapi diambil isian dari ["data"] yg tipe datanya List

  List surahLengkap = (jsonDecode(res.body) as Map<String, dynamic>)["data"];
  //Surah surahFromJson(String str) => Surah.fromJson(json.decode(str));
  print("============================================================");
  print(surahLengkap[0]); //ambil contoh surat al-fatihah

  //LANGKAH 3: MAU BIKIN OBJECT KELAS DART
  //BERHUBUNGAN DENGAN MODEL

  Surah surahFatihah = Surah.fromJson(surahLengkap[0]);
  print(surahFatihah.name.long);
  print(surahFatihah.name.short);

//SECTION 2: MENAMPILKAN SATU SURAH BESERTA ISINYA

//LANGKAH 1: GET API SURAT AL-FATIHAH
  Uri urlFatihah =
      Uri.parse("https://api.quran.gading.dev/surah/${surahFatihah.number}");
  var resFatihah = await http.get(urlFatihah);
  print("=================================================================");
  print(resFatihah.headers);
  print(resFatihah.body);

//LANGKAH 2: UBAH RESPONSE STRING JADI MAP(PROSES DECODE)
//AKKAS
  print("==================================================================");
  Map<String, dynamic> aSurah = jsonDecode(resFatihah.body)["data"];
  print(aSurah);

//LANGKAH 3: JADIIN OBJEK
  print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");

  //DetailSurah? oneSurah = DetailSurah.fromJson(aSurah);

  // if (oneSurah.preBismillah != null) {
  //   print(oneSurah.preBismillah.text?.arab);
  // } else {
  //   print("Bismillah is null");
  // }

  //print(oneSurah.preBismillah.text.arab);
  //print(oneSurah.verses[3].text.arab);
}
