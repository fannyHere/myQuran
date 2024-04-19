import 'package:flutter/material.dart';
import '../all_surah/object_surah.dart';
import '../model/surah.dart';

class surah_list extends StatefulWidget {
  const surah_list({super.key});

  static const routeName = '/surah_list';

  @override
  State<surah_list> createState() => _surah_listState();
}

class _surah_listState extends State<surah_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Surah"),
      ),
      body: FutureBuilder(
        future: ObjectSurah.getAllSurah(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text("Loading..."),
            );
          } else {
            return ListView.separated(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Surah surah = snapshot.data![index];
                // print(surah);
                return ListTile(
                  leading: CircleAvatar(
                    child: Text("${index + 1}"),
                    backgroundColor: Colors.blueAccent,
                  ),
                  title: Text(surah.name.transliteration.id),
                  subtitle: Text(
                      "Ayat: ${surah.numberOfVerses.toString()} || ${surah.revelation.id}"),
                  trailing: Text(surah.name.short),
                  onTap: () {
                    Navigator.pushNamed(context, '/Detail_all_surah',
                        arguments: surah);
                  },
                );
              },
              separatorBuilder: (context, index) => Divider(),
            );
          }
        },
      ),
    );
  }
}
