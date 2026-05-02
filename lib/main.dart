import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/toprated.dart';
import 'package:movie_app/Widgets/trending.dart';
import 'package:movie_app/Widgets/tv.dart';
import 'package:movie_app/utils/text.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> trendingmovies = [];
  List<Map<String, dynamic>> topratedmovies = [];
  List<Map<String, dynamic>> tv = [];

  final String apikey = '75fdb5b8b367099d6bb675f15e4b0c46';
  final String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NWZkYjViOGIzNjcwOTlkNmJiNjc1ZjE1ZTRiMGM0NiIsIm5iZiI6MTc3NTY1Mzg2Ni44OCwic3ViIjoiNjlkNjUzZWFkYTljOThjYTY2Y2E4OTE2Iiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.9mTLW5ebrXWvErRqIrxrOqnhuqGpcJrB_fRDpkKt-OU';

  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  loadmovies() async {
    print('LOADMOVIES CALLED');
    try {
      TMDB tmdb = TMDB(
        ApiKeys(apikey, readaccesstoken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ),
      );

      Map trendingresult = await tmdb.v3.trending.getTrending();
      print('TRENDING DATA: ${trendingresult['results']}');
      Map topratedresult = await tmdb.v3.movies.getTopRated();
      print('TOPRATED DATA: ${topratedresult['results']}');
      Map tvresult = await tmdb.v3.tv.getPopular();
      print('TV DATA: ${tvresult['results']}'); //
      setState(() {
        trendingmovies = List<Map<String, dynamic>>
            .from(trendingresult['results'])
            .where((m) => m['poster_path'] != null)
            .toList();
        topratedmovies = List<Map<String, dynamic>>
            .from(topratedresult['results'])
            .where((m) => m['poster_path'] != null)
            .toList();
        tv = List<Map<String, dynamic>>
            .from(tvresult['results'])
            .where((m) => m['poster_path'] != null)
            .toList();
      });
    } catch (e) {
      print('API ERROR $e');
      print('ERROR TYPE: ${e.runtimeType}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: ModifiedText(text: 'Flutter Movie App❤️'),
      ),
      body: ListView(
        children: [
          TV(tv: tv,),
          Toprated(topratedmovies: topratedmovies),
          TrendingMovies(trending: trendingmovies),
        ],
      ),
    );
  }
}





















