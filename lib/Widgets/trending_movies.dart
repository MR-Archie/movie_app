// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrendingMovies extends StatelessWidget {
  List trendingMovies;

  TrendingMovies(this.trendingMovies);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: Text(
              "Trending Movies",
              style: GoogleFonts.acme(fontSize: 28, color: Colors.white),
            ),
          ),
          Container(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return trendingMovies[index]['title'] != null
                      ? Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: InkWell(
                                child: Container(
                                  width: 150,
                                  height: 180,
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500${trendingMovies[index]['poster_path']}',
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/description',
                                    arguments: {
                                      'name': trendingMovies[index]['title'],
                                      'details': trendingMovies[index]
                                          ['overview'],
                                      'bannerUrl':
                                          'https://image.tmdb.org/t/p/w500${trendingMovies[index]['backdrop_path']}',
                                      'posterUrl':
                                          'https://image.tmdb.org/t/p/w500${trendingMovies[index]['poster_path']}',
                                      'ratings': trendingMovies[index]
                                              ['vote_average']
                                          .toString(),
                                      'releaseDate': trendingMovies[index]
                                          ['release_date']
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
                                  trendingMovies[index]['title'],
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
                itemCount: trendingMovies.length),
          ),
        ],
      ),
    );
  }
}
