import 'package:flutter/material.dart';
  import 'package:movie_app/utils/text.dart';

  class TV extends StatelessWidget {
  final List<Map<String, dynamic>> tv;

  const TV({
  Key? key,
  required this.tv,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          ModifiedText(text: "Popular TV Shows", size: 26,),

          Container(height: 260,
            child: ListView.builder(itemCount: tv.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {

                    },

                    child: Container(
                      width: 320,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            width: 200,
                            height: 220,
                            decoration: BoxDecoration
                              (borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      (tv[index]['backdrop_path'] ?? ''), //
                                ),
                                fit: BoxFit.cover,

                              ),
                            ),
                          ),

                            SizedBox(height: 10),
                          Container(child:
                          ModifiedText(
                            text: tv[index]
                            ['Original Name'] ??
                                tv[index]['Original Name']?? //
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
