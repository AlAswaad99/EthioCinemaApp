import 'package:flutter/material.dart';
import 'package:trial_one_flutter/classes/movies.dart';
import 'package:trial_one_flutter/pages/admin_pages/amdin_movie_detail_page.dart';
import 'package:trial_one_flutter/pages/detail_page.dart';

class AdminMoviesListPage extends StatefulWidget {
  AdminMoviesListPage({Key key}) : super(key: key);

  @override
  _AdminMoviesListPageState createState() => _AdminMoviesListPageState();
}

class _AdminMoviesListPageState extends State<AdminMoviesListPage> {
  List filteredmovies = [];

  Movies movies = new Movies();

  bool isSearching = false;

  var fetcheddata = [
    {
      "title": "Batman",
      "time": "12:15",
      "poster": "assets/images/Batman.jpeg",
    },
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

  var itemtoadd = {
    "title": "Angry Birds",
    "time": "13:00",
    "poster": "assets/images/angry.jpg",
  };

  // @override
  // void initState() {
  //   setState(() {
  //     filteredmovies = fetcheddata;
  //     print(filteredmovies);
  //   });
  //   super.initState();
  // }

  // void filtermovies(value) {
  //   print(fetcheddata.where((movies) => movies['title'] == value).toList());

  //   setState(() {
  //     filteredmovies = fetcheddata
  //         .where((movies) => movies['title']
  //             .toLowerCase()
  //             .startsWith(value.toString().toLowerCase()))
  //         .toList();
  //     print(filteredmovies);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _buildmovieslist(fetcheddata),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            fetcheddata.add(itemtoadd);
          });
        },
      ),
    );
  }

  ListView _buildmovieslist(fetcheddata) {
    return ListView.builder(
        itemCount: fetcheddata.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              fetcheddata[index]['title'],
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Showing Time: " + fetcheddata[index]['time']),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage(fetcheddata[index]['poster']),
                height: 150,
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  fetcheddata.remove(fetcheddata[index]);
                });
              },
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AdminMovieDetailsPage(
                            title: fetcheddata[index]['title'],
                            time: fetcheddata[index]['time'],
                            poster: fetcheddata[index]['poster'],
                          )));
            },
          );
        });
  }
}
