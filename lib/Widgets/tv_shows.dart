// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PopularTvShows extends StatelessWidget {
  List tvShows;

  PopularTvShows(this.tvShows);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: Text(
              "Popular Tv Shows",
              style: GoogleFonts.acme(fontSize: 28, color: Colors.white),
            ),
          ),
          Container(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return tvShows[index]['original_name'] != null
                      ? Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: InkWell(
                                child: Container(
                                  width: 220,
                                  height: 170,
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500${tvShows[index]['backdrop_path']}',
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/description',
                                    arguments: {
                                      'name': tvShows[index]['original_name'],
                                      'details': tvShows[index]['overview'],
                                      'bannerUrl':
                                          'https://image.tmdb.org/t/p/w500${tvShows[index]['backdrop_path']}',
                                      'posterUrl':
                                          'https://image.tmdb.org/t/p/w500${tvShows[index]['poster_path']}',
                                      'ratings': tvShows[index]['vote_average']
                                          .toString(),
                                      'releaseDate': tvShows[index]
                                          ['first_air_date']
                                    },
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                width: 180,
                                child: Text(
                                  tvShows[index]['original_name'],
                                  style: GoogleFonts.encodeSans(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                  softWrap: true,
                                  overflow: TextOverflow.fade,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container();
                },
                itemCount: tvShows.length),
          ),
        ],
      ),
    );
  }
}
