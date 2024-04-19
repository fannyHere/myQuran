import 'package:flutter/material.dart';
import 'package:my_quran/detail_surah/object_detail_surah.dart';
import 'package:my_quran/model/detail_surah.dart' as detail;
import 'package:my_quran/model/surah.dart';

class Detail_all_surah extends StatefulWidget {
  const Detail_all_surah({super.key});

  static const routeName = '/Detail_all_surah';

  @override
  State<Detail_all_surah> createState() => _Detail_all_surahState();
}

class _Detail_all_surahState extends State<Detail_all_surah> {
  Surah? surah;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    surah = ModalRoute.of(context)?.settings.arguments as Surah;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            surah!.name.transliteration.id,
          ),
          backgroundColor: Colors.blue,
          bottom: TabBar(
            tabs: [
              Tab(text: "Baca"),
              Tab(text: "Tafsir"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              padding: EdgeInsets.all(20),
              children: [
                Column(
                  children: [
                    Text(
                      "Surah: ${surah!.name.transliteration.id} || ${surah!.name.long}",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                        "${surah!.numberOfVerses.toString()} Ayat || ${surah!.revelation.id}"),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(),
                  ],
                ),
                FutureBuilder<detail.DetailSurah>(
                  future: ObjectDetailSurah.getDetailSurah(
                    surah!.number.toString(),
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Text("Tidak ada data. Error: ${snapshot.error}");
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.verses?.length,
                        itemBuilder: (context, index) {
                          detail.Verse? ayat = snapshot.data?.verses?[index];
                          return Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.blue,
                                    child: Text(
                                      "${index + 1}",
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        ayat!.text.arab,
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        ayat.text.transliteration.en,
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        ayat.translation.id,
                                        textAlign: TextAlign.end,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          IconButton(
                                            //PR nambahin audio dan pas di klik itu kebuka si iconnyapake if-else
                                            onPressed: () {
                                              ayat.audio;
                                            },
                                            icon: Icon(
                                              Icons.play_arrow,
                                            ),
                                          ),
                                          Icon(Icons.share),
                                          Icon(Icons.save_rounded),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Text(
                      surah!.tafsir.id,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
