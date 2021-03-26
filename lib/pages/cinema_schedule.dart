import 'package:flutter/material.dart';
import 'package:trial_one_flutter/classes/cinemas.dart';
import 'package:trial_one_flutter/pages/booking_page.dart';

class CinemaSchedule extends StatefulWidget {
  static const routeName = 'cinemaSchedule';

  final Cinema cinema;

  CinemaSchedule({this.cinema});

  @override
  _CinemaScheduleState createState() => _CinemaScheduleState();
}

class _CinemaScheduleState extends State<CinemaSchedule>
    with SingleTickerProviderStateMixin {
  TabController _cinemaScheduleController;

  @override
  void initState() {
    super.initState();
    _cinemaScheduleController =
        TabController(length: 7, vsync: this, initialIndex: 0);
  }

  List<String> movies = ["Avengers", "MUkera", "Sereyet", "measbeyalesh man"];
  List<String> movies2 = [];
  List<String> movies3 = ["Avengers", "MUkera", "Sereyet"];
  List<String> movies4 = ["Avengers", "Sereyet"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(widget.cinema.name),
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: TabBar(
            isScrollable: true,
            unselectedLabelColor: Colors.white30,
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                child: Text("MONDAY"),
              ),
              Tab(
                child: Text("TEUSDAY"),
              ),
              Tab(
                child: Text("WEDENESDAY"),
              ),
              Tab(
                child: Text("THURSDAY"),
              ),
              Tab(
                child: Text("FRIDAY"),
              ),
              Tab(
                child: Text("SATURDAY"),
              ),
              Tab(
                child: Text("SUNDAY"),
              ),
            ],
            controller: _cinemaScheduleController,
          ),
        ),
      ),
      body: TabBarView(
        children: [
          _buildCinemaSchedule(movies),
          _buildCinemaSchedule(movies2),
          _buildCinemaSchedule(movies4),
          _buildCinemaSchedule(movies3),
          _buildCinemaSchedule(movies4),
          _buildCinemaSchedule(movies),
          _buildCinemaSchedule(movies2),
        ],
        controller: _cinemaScheduleController,
      ),
    );
  }

  Widget _buildCinemaSchedule(List<String> movies) {
    if (movies.length == 0) {
      return Center(child: Text("No Movies in this Date"));
    }
    return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(
                "${movies[index]}",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Location: " + movies[index]),
              leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.location_city)),
              // onTap: () => Navigator.of(context).push(
              //     MaterialPageRoute(builder: (context) => (BookingPage())))
              onTap: () {
                Navigator.of(context).pushNamed(BookingPage.routeName);
              });
        });
  }
}
