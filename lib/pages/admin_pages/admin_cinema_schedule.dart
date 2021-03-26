import 'package:flutter/material.dart';
import 'package:trial_one_flutter/classes/cinemas.dart';
import 'package:trial_one_flutter/pages/admin_pages/admin_add_schedule.dart';
import 'package:trial_one_flutter/pages/admin_pages/admin_edit_cinema_schedule.dart';

class AdminCinemaSchedule extends StatefulWidget {
  static const routeName = 'cinemaSchedule';

  final Cinema cinema;

  AdminCinemaSchedule({this.cinema});

  @override
  _AdminCinemaScheduleState createState() => _AdminCinemaScheduleState();
}

class _AdminCinemaScheduleState extends State<AdminCinemaSchedule>
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
          title: Text(widget.cinema.name),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(30.0),
            child: TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.white30,
              tabs: [
                Tab(
                  child: Text("MONDAY"),
                ),
                Tab(
                  child: Text("TUESDAY"),
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
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              setState(() {
                Navigator.of(context).pushNamed(AdminAddSchedule.routeName,
                    arguments: widget.cinema);
              });
            }));
  }

  Widget _buildCinemaSchedule(List<String> moviesList) {
    if (moviesList.length == 0) {
      return Scaffold(
        body: Center(child: Text("No Movies in this Date")),
      );
    }
    return Scaffold(
      body: ListView.builder(
          itemCount: moviesList.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: Text(
                  "${moviesList[index]}",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Location: " + moviesList[index]),
                leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.location_city)),
                trailing: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          moviesList.remove(moviesList[index]);
                        });
                      },
                    )),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => (AdminEditCinemaSchedule()))));
          }),
    );
  }
}
