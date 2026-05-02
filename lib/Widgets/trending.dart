import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/description.dart';


class TrendingMovies extends StatelessWidget {
  final List<Map<String, dynamic>> trending;

  const TrendingMovies({
    Key? key,
    required this.trending,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          ModifiedText(text: "Trending Movies", size: 26,),

          Container(height: 270,
            child: ListView.builder(itemCount: trending.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final movie = trending[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute
                        (builder: (context)=>Description(
                        name: movie['title'] ?? 'No Title',

                        bannerurl: movie['backdrop_path'] != null
                            ? 'https://image.tmdb.org/t/p/w500${movie['backdrop_path']}'
                            : 'https://via.placeholder.com/500x250',

                        posterurl: movie['poster_path'] != null
                            ? 'https://image.tmdb.org/t/p/w500${movie['poster_path']}'
                            : 'https://via.placeholder.com/100x200',

                        description: movie['overview'] ?? 'No description available',

                        vote: movie['vote_average']?.toString() ?? '0',

                        launch_on: movie['release_date'] ?? 'Unknown',
                      ),));

                    },

                    child: Container(
                      width: 150,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500${movie['poster_path']}',
                                  ),
                                fit: BoxFit.cover,

                              ),
                            ),
                          ),


                          Container(child:
                          ModifiedText(
                            text: trending[index]
                            ['title'] ??
                                trending[index]['title'] ?? //
                                'Loading',
                          ),

                          ),

                        ],

                      ),
                    ),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}