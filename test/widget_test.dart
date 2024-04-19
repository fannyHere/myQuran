import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_quran/model/detail_surah.dart';
//import 'package:my_quran/model/detail_surah.dart';
import 'package:my_quran/model/surah.dart';

void main() async {
  Uri url = Uri.parse("https://api.quran.gading.dev/surah/");
  //await http.get(url); //tadinya kaya gini
  var res = await http
      .get(url); //buat dapat response soalnya await itu type datanya future
  //print(res.body);

  ////res itu tipe datanya object udah ditegaskan pake var
  //body itu kan tipe datanya String nah mau diambil tuh bagian bodynya yaitu
  //{"code":200,"status":"OK.","message":"Success fetching all surah.", data":[{"number":1,"sequence":5,"numberOfVerses":7,"name":{"short":"الفاتحة","long":"سُورَةُ ٱلْفَاتِحَةِ","transliteration":{"en":"Al-Faatiha",
  //tp yg mau diambil bagian "datanya aja"
  //print(
  //    "==========================================================================");
  //var data = json.encode(res.body) //asalnya dia itu tipe data json.encodenya dynamic
  //karena datanya susah diambil klo dynamic akhrinya dijadiin Map

  //lanjut 1
  //var data = (json.decode(res.body) as Map<String, dynamic>);
  //print(data); //ini klo diprint hasilnya sama kaya print(rest.body) karena semuanya diambil bagian bodynya tapi tipe datanya Map

  //lanjut 2
  //jangan diambil semua datanya,ambil mulaidari "data" aja yg bentuknya list
  List data = (json.decode(res.body) as Map<String, dynamic>)["data"];
  //karena bentuknya list maka bisa pakai indexberurutan dari 0-113
  //print(data[0]);
  //jadinya kaya gini outputnya bentuk list
  //[{number: 1, sequence: 5, numberOfVerses: 7, name: {short: الفاتحة, long: سُورَةُ ٱلْفَاتِحَةِ, transliteration: {en: Al-Faatiha, id: Al-Fatihah}, translation: {en: The Opening, id: Pembukaan}},

//si data itu print(data[0]); masih dalam bentuk list of dynamic belum object, maka harus di apain?
//data dari raw API ==> model (object) disetarain satu2
  Surah surahAnnas = Surah.fromJson(data[113]);
  //panggil tipe data Surah bikin variabel surahAnnas
  //Surah.fromJson(data[0]): Ini adalah pemanggilan sebuah metode bernama fromJson yang ada di dalam kelas Surah. Ketika Anda melihat Surah.fromJson, itu berarti Anda menggunakan metode yang bertugas untuk membuat objek Surah dari data JSON.

  //Jadi, secara keseluruhan, Surah.fromJson(data[0]) berarti kita memanggil metode fromJson yang ada di dalam kelas Surah
  //untuk membuat objek Surah dari data JSON yang diperoleh dari elemen pertama dalam list data. Metode fromJson ini
  //mengambil data JSON sebagai input dan mengembalikan objek Surah.
  print(surahAnnas.tafsir.id);
  print(surahAnnas.number);
  // print("=================================================================");
  // print(
  //   surahAnnas.toJson(),
  // ); //ngeprint semua objek yg ada di surahAnnas secara keseluruhan

//BUAT AMBIL DETAIL SURAH AN-NASS

  Uri urlAnnas =
      Uri.parse("https://api.quran.gading.dev/surah/${surahAnnas.number}");
  var resAnnas = await http.get(urlAnnas);
  print(resAnnas.body);

  print("==================================================================");

  Map<String, dynamic> dataAnnas = jsonDecode(resAnnas.body)["data"];
  print(dataAnnas);

  print("==================================================================");

  DetailSurah annas = DetailSurah.fromJson(dataAnnas);
  print(annas.verses?[5].text.arab);
  print(annas.verses?[5].text.transliteration.en);
  print(annas.verses?[5].audio.primary);
}
