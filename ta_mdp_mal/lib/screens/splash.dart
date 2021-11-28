import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ta_mdp_mal/screens/home.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  startTime() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Image.asset(
               "images/heh.png",
               width: 300,
               height: 300,
             ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text("Definitely Tidak Copas",
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(color: Colors.lightBlue),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 25),
            //   child: CircularProgressIndicator(
            //       color: Color.fromRGBO(0, 50, 255, 1)),
            // )
          ],
        ),
      ),
    );
  }
}
