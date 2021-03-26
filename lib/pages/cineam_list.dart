import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trial_one_flutter/classes/cinemas.dart';
import 'package:trial_one_flutter/pages/cinema_detail.dart';
import 'package:trial_one_flutter/pages/cinema_schedule.dart';

class CinemaListTrial extends StatefulWidget {
  CinemaListTrial({Key key}) : super(key: key);
  static const routeName = '/Cinemas';

  @override
  _CinemaListTrialState createState() => _CinemaListTrialState();
}

class _CinemaListTrialState extends State<CinemaListTrial> {
  // var itemtoadd = {
  //   "name": "Gast Mall Cinema",
  //   "location": "Around CMC",
  //   "price2d": 70,
  //   "price3d": 100,
  //   "seats": 150,
  // };

  Cinema cinematoadd = new Cinema(
      name: "Gast Mall Cinema",
      location: "Around CMC",
      seats: 150,
      price2d: 70,
      price3d: 100);

  // String cinemasstring =
  //     "[{'name': 'Century Cineplex','location': 'Around Gurdshola','price2d': 80,'price3d': 100,'seats': 150} , {'name': 'Edna Mall Cinema','location': 'Bole Mehanialem','price2d': 100,'price3d': 130,'seats': 100} , {'name': 'Biresh Cineplus','location': 'Eliana Mall','price2d': 60,'price3d': 100,'seats': 80}]";

  List<Cinema> cinemaslist = [
    new Cinema(
        name: "Century Cineplex",
        location: "Around Gurdshola",
        seats: 80,
        price2d: 100,
        price3d: 150),
    new Cinema(
        name: "Edna Mall Cinema",
        location: "Bole Mehanialem",
        seats: 100,
        price2d: 130,
        price3d: 100),
    new Cinema(
        name: "Biresh Cineplusx",
        location: "Eliana Mall",
        seats: 80,
        price2d: 60,
        price3d: 100)
  ];

  @override
  Widget build(BuildContext context) {
    //   var cinemasfromJSON = getCinemaList(cinemasstring.replaceAll("'", "\""));
    //CinemaBloc cinemaBloc = BlocProvider.of<CinemaBloc>(context);

    //print(cinemaslist);

    return Scaffold(
      body: Container(
        child: _buildcinemaslist(cinemaslist),
      ),
    );
  }

  ListView _buildcinemaslist(List<Cinema> cinemas) {
    return ListView.builder(
        itemCount: cinemas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              "${cinemas[index].name}",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Location: " + cinemas[index].location),
            leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.location_city)),
            // onTap: () => Navigator.of(context)
            //     .pushNamed(CinemaDetail.routeName, arguments: cinemas[index]),

            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => (CinemaSchedule(
                      cinema: cinemas[index],
                    )))),
          );
        });
  }

  // List<Cinema> getCinemaList(String data) {
  //   List<dynamic> bdy = jsonDecode(data);

  //   List<Cinema> cinemas =
  //       bdy.map((dynamic item) => Cinema.fromJson(item)).toList();

  //   return cinemas;
}
