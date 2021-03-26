import 'package:flutter/material.dart';

class AdminEditCinemaSchedule extends StatefulWidget {
  AdminEditCinemaSchedule({Key key}) : super(key: key);

  @override
  _AdminEditCinemaScheduleState createState() =>
      _AdminEditCinemaScheduleState();
}

class _AdminEditCinemaScheduleState extends State<AdminEditCinemaSchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Edit Cinema Schedule",
          style: TextStyle(fontSize: 72),
        ),
      ),
    );
  }
}
