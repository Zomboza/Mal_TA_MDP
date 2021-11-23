import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatefulWidget {
  const AboutPage();
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        elevation: 10,
        // shape: RoundedRectangleBorder(
        //     borderRadius:
        //         BorderRadius.vertical(bottom: Radius.elliptical(50, 50))),
        title: Text(
          'Tentang',
          style: GoogleFonts.roboto(
              fontSize: 30, fontWeight: FontWeight.normal, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Padding(
            //     padding: const EdgeInsets.only(bottom: 100),
            //     child: Image.asset(
            //       //"images/about.png",
            //       width: 250,
            //       height: 250,
            //     )),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                'Definitely Tidak Copas',
                style: GoogleFonts.roboto(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue),
              ),
            ),
            Text(
              'Why Are We Still Here Just To Suffer...',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}