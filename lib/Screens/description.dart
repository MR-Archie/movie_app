import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    String name = args['name'];
    String details = args['details'];
    String bannerUrl = args['bannerUrl'];
    String posterUrl = args['posterUrl'];
    String ratings = args['ratings'];
    String releaseDate = args['releaseDate'];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          name,
          style: GoogleFonts.baskervville(),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 250,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  right: 10,
                  child: Container(
                    child: Text(
                      " ⭐ Average Rating :- $ratings",
                      style: GoogleFonts.encodeSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: Text(
              name,
              style: GoogleFonts.encodeSans(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 5, top: 2),
            child: Text(
              "Releasing on :- $releaseDate",
              style: GoogleFonts.encodeSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 2),
            child: Row(
              children: [
                Container(
                  height: 200,
                  width: 150,
                  padding: const EdgeInsets.all(3),
                  child: Image.network(posterUrl),
                ),
                Flexible(
                  child: Container(
                    width: 250,
                    height: 200,
                    child: Text(
                      details,
                      style: GoogleFonts.encodeSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
