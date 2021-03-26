import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AdminAddCinemaPage extends StatefulWidget {
  AdminAddCinemaPage({Key key}) : super(key: key);

  @override
  _AdminAddCinemaPageState createState() => _AdminAddCinemaPageState();
}

class _AdminAddCinemaPageState extends State<AdminAddCinemaPage> {
  String cinemaname = "";
  String cinemalocation = "";
  String cinemaseats = "";
  String cinemaprice2d = "";
  String cinemaprice3d = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe8e8e8),
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Admin/Cinemas/AddCinema"),
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
                  decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 15),
                      hintText: "Cinema Name",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(50, 0, 0, 0)),
                  onChanged: (value) {
                    value = cinemaname;
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 15),
                      hintText: "Cinema Location",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(50, 0, 0, 0)),
                  onChanged: (value) {
                    value = cinemalocation;
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 15),
                      hintText: "Number of Seats",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(50, 0, 0, 0)),
                  onChanged: (value) {
                    value = cinemaseats;
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
                  decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 15),
                      hintText: "Price (2D)",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(50, 0, 0, 0)),
                  onChanged: (value) {
                    value = cinemaprice2d;
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
                  decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 15),
                      hintText: "Price (3D)",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(50, 0, 0, 0)),
                  onChanged: (value) {
                    value = cinemaprice3d;
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
                        onPressed: () {},
                        textColor: Colors.black45,
                        child: Text("ADD"),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addCinema(String name, String location, String seats, String price2d,
      String price3d) {}
}
