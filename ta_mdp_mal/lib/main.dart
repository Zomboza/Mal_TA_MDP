import 'package:flutter/material.dart';
import 'package:ta_mdp_mal/screens/splash.dart';
import 'package:ta_mdp_mal/screens/home.dart';
import 'package:ta_mdp_mal/screens/detail.dart';
// import 'package:ta_mdp_mal/screens/desc.dart';

void main() async {
  runApp(const AnimeApp());
}

class AnimeApp extends StatelessWidget {
  const AnimeApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime app',
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashPage(),
        '/home': (context) => const HomePage(),
        '/detail': (context) => const DetailPage(item: 0, title: ''),
        // '/desc': (context) => const DescPage(item: 0, title: '')
      },
    );
  }
}
