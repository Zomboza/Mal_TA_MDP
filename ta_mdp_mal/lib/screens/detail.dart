import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailPage extends StatefulWidget {
  final int item;
  final String title;
  const DetailPage({Key? key, required this.item, required this.title})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Future<Episode> episodes;

  @override
  void initState() {
    super.initState();
    episodes = fetchEpisodes(widget.item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
          title: Text(
            widget.title,
            style: GoogleFonts.roboto(
                fontSize: 20, 
                fontWeight: FontWeight.bold, color: Colors.white
                ),
            )
          ),
        body: SingleChildScrollView(
            child: FutureBuilder<Episode>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Image.network(
                      snapshot.data!.image_url,
                      width: 300,
                      height: 300,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Text(
                      snapshot.data!.title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(color: Colors.lightBlue),
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Text(
                      'Score: ${snapshot.data!.score} ⭐',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(color: Colors.black),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Text(
                    'Broadcast: ${snapshot.data!.broadcast}',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(color: Colors.black),
                      fontSize: 18,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      snapshot.data!.synopsis,
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(color: Colors.black),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong :('));
          }
          return const CircularProgressIndicator(
            color: Colors.white,
          );
        },
        future: episodes,
      )
      )
    );
  }
}

class Episode {
  final String title;
  final int mal_id;
  final String image_url;
  final String synopsis;
  final String broadcast;
  final num score;

  Episode({
    required this.title,
    required this.mal_id,
    required this.image_url,
    required this.synopsis,
    required this.broadcast,
    required this.score,
    });

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      title: json['title'],
      mal_id: json['mal_id'],
      image_url: json['image_url'],
      synopsis: json['synopsis'],
      broadcast: json['broadcast'],
      score: json['score'],
    );
  }
}

Future<Episode> fetchEpisodes(id) async {
  final response = await http
      .get(Uri.parse('https://api.jikan.moe/v3/anime/$id'));

  if (response.statusCode == 200) {
    return Episode.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load episodes');
  }
}
