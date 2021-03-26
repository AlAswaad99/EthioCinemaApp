import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trial_one_flutter/classes/cinemas.dart';
import 'package:trial_one_flutter/pages/cinema_schedule.dart';

class CinemaDetail extends StatefulWidget {
  static const routeName = 'cinemaDetail';

  final Cinema cinema;

  const CinemaDetail({this.cinema});

  @override
  _CinemaDetailState createState() => _CinemaDetailState();
}

class _CinemaDetailState extends State<CinemaDetail> {
  final TextEditingController _cinemaNameEditingController =
      new TextEditingController();

  final TextEditingController _cinemaLocationEditingController =
      new TextEditingController();

  final TextEditingController _cinemaSeatsEditingController =
      new TextEditingController();

  final TextEditingController _cinemaPrice2dEditingController =
      new TextEditingController();

  final TextEditingController _cinemaPrice3dEditingController =
      new TextEditingController();

  String cinemaname = "";
  String cinemalocation = "";
  String cinemaseats = "";
  String cinemaprice2d = "";
  String cinemaprice3d = "";

  @override
  void initState() {
    super.initState();

    _cinemaNameEditingController.value =
        TextEditingValue(text: widget.cinema.name);

    _cinemaLocationEditingController.value =
        TextEditingValue(text: widget.cinema.location);

    _cinemaSeatsEditingController.value =
        TextEditingValue(text: widget.cinema.seats.toString());

    _cinemaPrice2dEditingController.value =
        TextEditingValue(text: widget.cinema.price2d.toString());

    _cinemaPrice3dEditingController.value =
        TextEditingValue(text: widget.cinema.price3d.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe8e8e8),
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Admin/Cinemas/${widget.cinema.name}"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Column(
            children: [
              SizedBox(height: 80),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _cinemaNameEditingController,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 15),
                      hintText: "Cinema Name",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(50, 0, 0, 0)),
                  onChanged: (value) {
                    cinemaname = value;
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _cinemaLocationEditingController,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 15),
                      hintText: "Cinema Location",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(50, 0, 0, 0)),
                  onChanged: (value) {
                    cinemalocation = value;
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _cinemaSeatsEditingController,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 15),
                      hintText: "Number of Seats",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(50, 0, 0, 0)),
                  onChanged: (value) {
                    cinemaseats = value;
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _cinemaPrice2dEditingController,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 15),
                      hintText: "Price (2D)",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(50, 0, 0, 0)),
                  onChanged: (value) {
                    cinemaprice2d = value;
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _cinemaPrice3dEditingController,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 15),
                      hintText: "Price (3D)",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(50, 0, 0, 0)),
                  onChanged: (value) {
                    cinemaprice3d = value;
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
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
                          // CinemaEvent updateEvent = UpdateCinemaEvent(Cinema(
                          //   id: widget.cinema.id,
                          //   name: cinemaname == ""
                          //       ? widget.cinema.name
                          //       : cinemaname,
                          //   location: cinemalocation == ""
                          //       ? widget.cinema.location
                          //       : cinemalocation,
                          //   seats: cinemaseats == ""
                          //       ? widget.cinema.seats
                          //       : int.parse(cinemaseats),
                          //   price2d: cinemaprice2d == ""
                          //       ? widget.cinema.price2d
                          //       : int.parse(cinemaprice2d),
                          //   price3d: cinemaprice3d == ""
                          //       ? widget.cinema.price3d
                          //       : int.parse(cinemaprice3d),
                          // )

                          // BlocProvider.of<CinemaBloc>(context).add(updateEvent);
                          // return showDialog(
                          //     context: context,
                          //     child: AlertDialog(
                          //       content: Text("Cinema Successfully Updated"),
                          //       actions: [
                          //         FlatButton(
                          //             child: Text("OK"),
                          //             onPressed: () {
                          //               Navigator.of(context)
                          //                   .pushNamedAndRemoveUntil(
                          //                       CinemaListTrial.routeName,
                          //                       (route) => false);
                          //             })
                          //       ],
                          //     ));
                        },
                        textColor: Colors.black45,
                        child: Text("EDIT"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xff13c7ff),
                              borderRadius: BorderRadius.circular(10)),
                          child: MaterialButton(
                            onPressed: () {
                              // Navigator.of(context).pushNamed(
                              //     CinemaSchedule.routeName,
                              //     arguments: widget.cinema);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => (CinemaSchedule(
                                        cinema: widget.cinema,
                                      ))));
                            },
                            textColor: Colors.black45,
                            child: Text("GO TO SCHEDULE"),
                          )))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
