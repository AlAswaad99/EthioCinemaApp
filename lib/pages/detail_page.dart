import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:trial_one_flutter/pages/appbar.dart';
import 'package:trial_one_flutter/pages/booking_page.dart';

class DetailsPage extends StatelessWidget {
  final String title;
  final String time;
  final String poster;
  final int bezat = 5;

  DetailsPage({this.title, this.time, this.poster});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 8.0),
          child: Container(
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
                          style: TextStyle(color: Colors.black54),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "108 Min",
                          style: TextStyle(
                              color: Colors.black54,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "IMDB Rating",
                          style: TextStyle(color: Colors.black54),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "7.5/10",
                          style: TextStyle(
                              color: Colors.black54,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Now Showing"),
                    ),
                  ],
                ),
                Divider(
                  thickness: 2,
                  endIndent: 10,
                  indent: 10,
                ),
                Container(
                  child: bezat > 0
                      ? nowShowingHorizontalListView(bezat)
                      : Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "No Cinema Showing this Movie",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                  height: 250,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget nowShowingHorizontalListView(int bezat) {
    return GridView.builder(
        //scrollDirection: Axis.horizontal,
        itemCount: bezat,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Container(
            child: Card(
              elevation: 5,
              child: Hero(
                tag: Text("Cinema $index"),
                child: Material(
                  child: InkWell(
                    onTap: () => Navigator.of(context).push(
                        new MaterialPageRoute(
                            builder: (context) => BookingPage())),
                    child: GridTile(
                      child: Icon(
                        Icons.location_city,
                        size: 80,
                      ),
                      footer: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "Cinema ${++index}",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
