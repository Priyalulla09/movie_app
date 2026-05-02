import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

class Description extends StatelessWidget{
  final String name;
 final String  description;
  final String bannerurl;
  final String posterurl;
  final String vote;
  final String launch_on;

  const Description({super.key, required this.name,
    required this.description,
    required this.bannerurl, required this.posterurl,
    required this.vote,
    required this.launch_on});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton( icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },),
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(bannerurl, fit:BoxFit.cover,
                        errorBuilder: (context, error, stackTrace){
                          return Container(
                            color: Colors.grey,
                              child: Center(
                                child: Icon(Icons.broken_image,
                                color: Colors.white),
                              ),
                          );

                        }),
                      )),
                  Positioned(bottom: 10,
                      child: ModifiedText(text: ' ⭐ Average Rating - $vote, size: 18 '))
                ],
              ),
            ),
            SizedBox(height: 15,),
        Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ModifiedText(text: name, size: 24),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: ModifiedText(text: 'Releasing on - $launch_on', size: 14),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 200,
                    width: 100,
                    child: Image.network(posterurl,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.broken_image, color: Colors.white);
                    }),
                  ),
                  Flexible(
                    child: Container(
                      child: ModifiedText(text: description, size: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        ],
      ),

    ),
    );
          }
}
