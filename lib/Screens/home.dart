import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../Widgets/trending_movies.dart';
import '../Widgets/top_rated_movies.dart';
import '../Widgets/tv_shows.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    loadLists();
    super.initState();
  }

  var isLoaded = true;

  List trendingMovies = [];
  List topRatedMovies = [];
  List popularTv = [];

  Map trending = {};
  Map topRated = {};
  Map tv = {};

  final String apiKey = '339b3002e97ae12883deaaac3c0de7f7';
  final String accessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzMzliMzAwMmU5N2FlMTI4ODNkZWFhYWMzYzBkZTdmNyIsInN1YiI6IjYzMjcxYzNjYTY3MjU0MDA3ZDVlN2Y2NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.mTFbOtiNEmwKixo-EyLugwBVOrok0eH8U-HBgwjtezg';

  loadLists() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apiKey, accessToken),
      logConfig: const ConfigLogger(
        showLogs: true, //must be true than only all other logs will be shown
        showErrorLogs: true,
      ),
    );
    try {
      isLoaded = true;
      trending = await tmdbWithCustomLogs.v3.trending.getTrending();
      topRated = await tmdbWithCustomLogs.v3.movies.getTopRated();
      tv = await tmdbWithCustomLogs.v3.tv.getPopular();
    } finally {
      isLoaded = false;
    }

    setState(() {
      trendingMovies = trending['results'];
      topRatedMovies = topRated['results'];
      popularTv = tv['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "M o v i e h o l i c  ❤️",
          style: GoogleFonts.breeSerif(fontSize: 26, color: Colors.redAccent),
        ),
      ),
      body: isLoaded == true
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                PopularTvShows(popularTv),
                TrendingMovies(trendingMovies),
                TopRated(topRatedMovies),
              ],
            ),
    );
  }
}
