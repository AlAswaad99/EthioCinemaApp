import 'package:flutter/material.dart';
import 'package:trial_one_flutter/classes/movies.dart';
import 'package:trial_one_flutter/pages/appbar.dart';
import 'package:trial_one_flutter/pages/detail_page.dart';
import 'package:trial_one_flutter/pages/single_movie_search_card.dart';

class MoviesListPage extends StatefulWidget {
  @override
  _MoviesListPageState createState() => _MoviesListPageState();
}

class _MoviesListPageState extends State<MoviesListPage> {
  @override
  Widget build(BuildContext context) {
    //List<Movies> movies = [];
    var fetcheddata = [
      {
        "title": "Cyberpunk 2077: Edgerunners",
        "time": "10:15",
        "poster": "assets/images/Cyberpunk2077.jpeg",
      },
      {
        "title": "Despicable Me 3",
        "time": "6:40",
        "poster": "assets/images/despicableme3.jpeg",
      },
      {
        "title": "Hitman",
        "time": "00:45",
        "poster": "assets/images/Hitman.jpeg",
      },
      {
        "title": "Johnny Silverhand",
        "time": "17:00",
        "poster": "assets/images/imagessilverhand.jpeg",
      },
      {
        "title": "Cyberpunk 2077: V's Redemption",
        "time": "03:55",
        "poster": "assets/images/imagesv.jpeg",
      },
      {
        "title": "Ghost of Tsushima",
        "time": "01:30",
        "poster": "assets/images/Samurai.jpeg",
      },
      {
        "title": "Batman",
        "time": "12:15",
        "poster": "assets/images/Batman.jpeg",
      },
      {
        "title": "Logan",
        "time": "08:20",
        "poster": "assets/images/Wolverine.jpeg",
      },
      {
        "title": "Spiderman: Into the Spider Verse",
        "time": "11:00",
        "poster": "assets/images/SpiderMan.jpeg",
      },
    ];
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: _buildmovies(fetcheddata),
      ),
    );
  }

  GridView _buildmovies(fetcheddata) {
    return GridView.builder(
      itemCount: fetcheddata.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
      itemBuilder: (context, index) {
        return SingleMovieCard(
          title: fetcheddata[index]['title'],
          time: fetcheddata[index]['time'],
          poster: fetcheddata[index]['poster'],
        );

        /*ListTile(
          title: Text("this is the shit"),
          subtitle: Text("trial $index"),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(image: AssetImage("assets/angry.jpg"),height: 150,),
          ),
          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(image: "assets/angry.jpg", index: index,)));},
        );*/
      },
    );
  }
}
