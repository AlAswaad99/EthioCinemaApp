import 'package:flutter/material.dart';
import 'package:trial_one_flutter/pages/admin_pages/admin_edit_movies_page.dart';

class AdminMovieDetailsPage extends StatelessWidget {
  final String title;
  final String time;
  final String poster;

  AdminMovieDetailsPage({this.title, this.time, this.poster});

  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false, title: Text("Movies/$title")),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(children: [
                  Container(
                    color: Colors.black,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Center(
                          child: Image(
                        image: AssetImage(poster),
                        height: 300,
                        fit: BoxFit.fitWidth,
                      )),
                    ),
                  ),
                ]),
                SizedBox(
                  height: 30,
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Duration",
                          style: TextStyle(color: Colors.black26),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "108 Min",
                          style: TextStyle(
                              color: Colors.black26,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "IMDB Rating",
                          style: TextStyle(color: Colors.black26),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "7.5/10",
                          style: TextStyle(
                              color: Colors.black26,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.0,
                      wordSpacing: 5,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.edit),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AdminEditMovie(
                          title: title,
                          time: time,
                          poster: poster,
                        )));
          },
        ),
      ),
    );
  }
}
