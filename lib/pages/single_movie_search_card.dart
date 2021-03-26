import 'package:flutter/material.dart';

import 'detail_page.dart';

class SingleMovieCard extends StatelessWidget {
  final String title;
  final String time;
  final String poster;

  SingleMovieCard({this.title,this.time,this.poster});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: title,
        child: Material(
          child: InkWell(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(title: title, time: time, poster: poster)));},
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontStyle: FontStyle.italic),),
                  ),
                  trailing: Text(time),
                ),
              ),
              child: Image(
                image: AssetImage(poster),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
