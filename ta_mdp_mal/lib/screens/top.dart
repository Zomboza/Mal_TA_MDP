import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ta_mdp_mal/screens/detail.dart';
// import 'package:ta_mdp_mal/screens/desc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AnimePage1 extends StatefulWidget {
  const AnimePage1();
  @override
  _AnimePage1State createState() => _AnimePage1State();
}

class _AnimePage1State extends State<AnimePage1> {
  late Future<List<ShowAir>> showsAir;

  @override
  void initState() {
    super.initState();
    showsAir = fetchShowsAir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        elevation: 10,
        title: Text(
          'Top Seasonal Anime',
          style: GoogleFonts.roboto(
              fontSize: 30, fontWeight: FontWeight.normal, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: FutureBuilder(
              builder: (context, AsyncSnapshot<List<ShowAir>> snapshot) {
                if (snapshot.hasData) {
                  return Center(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: Colors.white,
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              leading:  
                                Image.network(snapshot.data![index].imageUrl),
                              title: Text(
                                snapshot.data![index].title,
                                style: GoogleFonts.nunito(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                'Score: ${snapshot.data![index].score}⭐',
                                style: GoogleFonts.nunito(fontSize: 14),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                          item: snapshot.data![index].malId,
                                          title: snapshot.data![index].title),
                                    ));
                              },
                            ),
                          );
                        }),
                  );
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Something went wrong :('));
                }
                return const CircularProgressIndicator(
                  color: Colors.white,
                );
              },
              future: showsAir,
            ),
          )
        ],
      ),
    );
  }
}

class ShowAir {
  final int malId;
  final String title;
  final String imageUrl;
  final num score;

  ShowAir({
    required this.malId,
    required this.title,
    required this.imageUrl,
    required this.score,
  });

  factory ShowAir.fromJson(Map<String, dynamic> json) {
    return ShowAir(
      malId: json['mal_id'],
      title: json['title'],
      imageUrl: json['image_url'],
      score: json['score'],
    );
  }
}

Future<List<ShowAir>> fetchShowsAir() async {
  final response =
      await http.get(Uri.parse('https://api.jikan.moe/v3/top/anime/1/airing'));

  if (response.statusCode == 200) {
    var topShowsJson = jsonDecode(response.body)['top'] as List;
    return topShowsJson.map((show) => ShowAir.fromJson(show)).toList();
  } else {
    throw Exception('Failed to load shows');
  }
}