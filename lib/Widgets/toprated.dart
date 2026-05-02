import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

class Toprated extends StatelessWidget {
  final List<Map<String, dynamic>> topratedmovies ;

  const Toprated({
    Key? key,
    required this.topratedmovies,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          ModifiedText(text: "Top Rated Movies", size: 26,),

          Container(height: 270,
            child: ListView.builder(itemCount: topratedmovies.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {

                    },

                    child: Container(
                      width: 190,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 240,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        (topratedmovies[index]['poster_path'] ??
                                            ''),
                              ),
                            ),
                          ),
                      ), //


                          Container(
                            child: ModifiedText(
                              text: topratedmovies[index]['title'] ??
                              topratedmovies[index]['name'] ??
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

  }}

