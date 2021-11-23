import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:ta_mdp_mal/screens/detail.dart';
// import 'package:http/http.dart' as http;
import 'package:ta_mdp_mal/screens/top.dart';
import 'package:ta_mdp_mal/screens/about.dart';
import 'package:ta_mdp_mal/screens/all.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    AnimePage(),
    AnimePage1(),
    AboutPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 10,
      //   // shape: RoundedRectangleBorder(
      //   //     borderRadius:
      //   //         BorderRadius.vertical(bottom: Radius.elliptical(50, 50))),
      //   title: Text(
      //     'Top Anime',
      //     style: GoogleFonts.roboto(
      //         fontSize: 30, fontWeight: FontWeight.normal, color: Colors.white),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Color.fromRGBO(0, 40, 255, 1),
      // ),
      body: IndexedStack(
        children: _pages,
        index: _selectedIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'All Time',
          ),
                    BottomNavigationBarItem(
            icon: Icon(Icons.bolt_outlined),
            label: 'Seasonal',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            label: 'About',
          ),  
        ],
        currentIndex: _selectedIndex,
        // unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}

// class AnimePage extends StatefulWidget {
//   const AnimePage();
//   @override
//   _AnimePageState createState() => _AnimePageState();
// }

// class _AnimePageState extends State<AnimePage> {
//   late Future<List<Show>> shows;
//   late Future<List<ShowAir>> showsAir;

//   @override
//   void initState() {
//     super.initState();
//     shows = fetchShows();
//     showsAir = fetchShowsAir();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           // Container(
//           //   margin: EdgeInsets.all(10),
//           //   child: Text(
//           //     'Top Anime All Time',
//           //     style: GoogleFonts.nunito(
//           //         fontSize: 20,
//           //         fontWeight: FontWeight.bold,
//           //         color: Color.fromRGBO(253, 1, 40, 1)),
//           //   ),
//           // ),
//           Expanded(
//             child: FutureBuilder(
//               builder: (context, AsyncSnapshot<List<Show>> snapshot) {
//                 if (snapshot.hasData) {
//                   return Center(
//                     child: ListView.builder(
//                         scrollDirection: Axis.vertical,
//                         shrinkWrap: true,
//                         itemCount: snapshot.data!.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return Card(
//                             elevation: 5,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20)),
//                             color: Colors.white,
//                             child: ListTile(
//                               contentPadding: const EdgeInsets.symmetric(
//                                   horizontal: 20, vertical: 10),
//                               leading: CircleAvatar(
//                                 radius: 30,
//                                 backgroundImage: NetworkImage(
//                                     snapshot.data![index].imageUrl),
//                               ),
//                               title: Text(
//                                 snapshot.data![index].title,
//                                 style: GoogleFonts.nunito(
//                                     fontSize: 16, fontWeight: FontWeight.bold),
//                               ),
//                               subtitle: Text(
//                                 'Score: ${snapshot.data![index].score}',
//                                 style: GoogleFonts.nunito(fontSize: 14),
//                               ),
//                               onTap: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => DetailPage(
//                                           item: snapshot.data![index].malId,
//                                           title: snapshot.data![index].title),
//                                     ));
//                               },
//                             ),
//                           );
//                         }),
//                   );
//                 } else if (snapshot.hasError) {
//                   return const Center(child: Text('Something went wrong :('));
//                 }
//                 return const CircularProgressIndicator(
//                   color: Colors.white,
//                 );
//               },
//               future: shows,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class Show {
//   final int malId;
//   final String title;
//   final String imageUrl;
//   final num score;

//   Show({
//     required this.malId,
//     required this.title,
//     required this.imageUrl,
//     required this.score,
//   });

//   factory Show.fromJson(Map<String, dynamic> json) {
//     return Show(
//       malId: json['mal_id'],
//       title: json['title'],
//       imageUrl: json['image_url'],
//       score: json['score'],
//     );
//   }
// }

// Future<List<Show>> fetchShows() async {
//   final response =
//       await http.get(Uri.parse('https://api.jikan.moe/v3/top/anime/1'));

//   if (response.statusCode == 200) {
//     var topShowsJson = jsonDecode(response.body)['top'] as List;
//     return topShowsJson.map((show) => Show.fromJson(show)).toList();
//   } else {
//     throw Exception('Failed to load shows');
//   }
// }