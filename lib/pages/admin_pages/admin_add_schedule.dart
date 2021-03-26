import 'package:flutter/material.dart';
import 'package:trial_one_flutter/classes/cinemas.dart';
import 'package:trial_one_flutter/classes/schedule.dart';

class AdminAddSchedule extends StatefulWidget {
  static const routeName = 'addSchedule';

  final Cinema cinema;

  AdminAddSchedule({this.cinema});

  @override
  _AdminAddScheduleState createState() => _AdminAddScheduleState();
}

class _AdminAddScheduleState extends State<AdminAddSchedule> {
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

  List<String> weekdays = [
    "Monday",
    "Tuesday",
    "Wedenesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  String _movie = "";
  String _showingTime = "";
  String _date = "";
  String _dateOfWeek = "";
  String _dimension = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text("${widget.cinema.name}/addSchedule")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        return (showDialog(
                          context: context,
                          builder: (context) => new AlertDialog(
                            title: new Text(
                              'Movies',
                            ),
                            content: _buildmovieslist(fetcheddata),
                          ),
                        ));
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Text("Movies:"),
                          ),
                          Row(
                            children: [
                              Text("$_movie"),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        return _selectShowingTime(context);
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Text("Showing Time:"),
                          ),
                          Row(
                            children: [
                              Text("$_showingTime"),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        return _selectDate(context);
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Text("Date:"),
                          ),
                          Row(
                            children: [
                              Text("$_date"),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        return (showDialog(
                          context: context,
                          builder: (context) => new AlertDialog(
                            title: new Text('Date of Week'),
                            content: _buildWeekdaysList(weekdays),
                          ),
                        ));
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Text("Date of Week:"),
                          ),
                          Row(
                            children: [
                              Text("$_dateOfWeek"),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        return (showDialog(
                          context: context,
                          builder: (context) => new AlertDialog(
                              title: new Text('Dimension'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    title: Text("2D"),
                                    onTap: () {
                                      setDimension("2D");
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  ListTile(
                                    title: Text("3D"),
                                    onTap: () {
                                      setDimension("3D");
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              )),
                        ));
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Text("Dimension:"),
                          ),
                          Row(
                            children: [
                              Text("$_dimension"),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xff13c7ff),
                          borderRadius: BorderRadius.circular(10)),
                      child: MaterialButton(
                        onPressed: () {
                          Schedule _schedule = new Schedule(
                              movieTitle: _movie,
                              showingTime: _showingTime,
                              date: _date,
                              dateOfWeek: _dateOfWeek,
                              dimension: _dimension);

                          return (showDialog(
                            context: context,
                            builder: (context) => new AlertDialog(
                                title: new Text('Schedule Successfully Added'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      leading: Text("Movie:"),
                                      trailing: Text(_schedule.movieTitle),
                                    ),
                                    ListTile(
                                      leading: Text("Showing Time:"),
                                      trailing: Text(_schedule.showingTime),
                                    ),
                                    ListTile(
                                      leading: Text("Date:"),
                                      trailing: Text(_schedule.date),
                                    ),
                                    ListTile(
                                      leading: Text("Date of Week:"),
                                      trailing: Text(_schedule.dateOfWeek),
                                    ),
                                    ListTile(
                                      leading: Text("Dimension:"),
                                      trailing: Text(_schedule.dimension),
                                    ),
                                  ],
                                )),
                          ));
                        },
                        textColor: Colors.black45,
                        child: Text(
                          "ADD",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
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
            onTap: () {
              setMovie(fetcheddata[index]['title']);
              Navigator.of(context).pop();
            },
          );
        });
  }

  ListView _buildWeekdaysList(weekdays) {
    return ListView.builder(
        itemCount: weekdays.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              weekdays[index],
              style: TextStyle(fontSize: 17),
            ),
            onTap: () {
              setDateOfWeek(weekdays[index]);
              Navigator.of(context).pop();
            },
          );
        });
  }

  Future<void> _selectShowingTime(BuildContext context) async {
    final TimeOfDay timePicked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, widget) {
          return MediaQuery(
            child: widget,
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          );
        });

    if (timePicked != null && timePicked != TimeOfDay.now()) {
      setState(() {
        _showingTime =
            "${timePicked.hour.toString()}:${timePicked.minute.toString()}";
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime datePicked = await showDatePicker(
        context: context,
        firstDate: DateTime(2020),
        lastDate: DateTime(2025),
        initialDate: DateTime.now(),
        builder: (context, widget) {
          return MediaQuery(
            child: widget,
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          );
        });

    if (datePicked != null && datePicked != DateTime.now()) {
      setState(() {
        _date = "${datePicked.day}/${datePicked.month}/${datePicked.year}";
      });
    }
  }

  void setMovie(String movie) {
    setState(() {
      _movie = movie;
    });
  }

  void setDimension(String dimension) {
    setState(() {
      _dimension = dimension;
    });
  }

  void setDateOfWeek(String dateOfWeek) {
    setState(() {
      _dateOfWeek = dateOfWeek;
    });
  }
}
