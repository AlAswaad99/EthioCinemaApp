import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AdminEditMovie extends StatefulWidget {
  final String title;
  final String time;
  final String poster;

  AdminEditMovie({this.title, this.time, this.poster});
  @override
  _AdminEditMovieState createState() => _AdminEditMovieState();
}

class _AdminEditMovieState extends State<AdminEditMovie> {
  final TextEditingController _movieTitleEditingController =
      new TextEditingController();

  final TextEditingController _movieShowingTimeEditingController =
      new TextEditingController();

  // final TextEditingController _movieRatingEditingController =
  //     new TextEditingController();

  // final TextEditingController _movieOverviewEditingController =
  //     new TextEditingController();

  String movietitle = "";
  String movietime = "";
  // String movierating = "";
  // String movieoverview = "";

  @override
  void initState() {
    super.initState();

    _movieTitleEditingController.value = TextEditingValue(text: widget.title);

    _movieShowingTimeEditingController.value =
        TextEditingValue(text: widget.time);
  }

  PickedFile _pickedFile;
  final ImagePicker _imagePicker = new ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe8e8e8),
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Admin/Movies/${widget.title}"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Column(
            children: [
              SizedBox(height: 20),

              InkWell(
                child: CircleAvatar(
                  radius: 80.0,
                  backgroundImage: _pickedFile == null
                      ? AssetImage("${widget.poster}")
                      : FileImage(File(_pickedFile.path)),
                ),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: ((builder) => chooseImageSource()));
                },
              ),
              SizedBox(height: 50),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _movieTitleEditingController,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 15),
                      hintText: "Movie Ttile",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(50, 0, 0, 0)),
                  onChanged: (value) {
                    movietitle = value;
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _movieShowingTimeEditingController,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 15),
                      hintText: "Movie Release Date",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(50, 0, 0, 0)),
                  onChanged: (value) {
                    movietime = value;
                  },
                ),
              ),
              // SizedBox(height: 10),
              // Container(
              //   decoration: BoxDecoration(
              //       color: const Color(0xffffffff),
              //       borderRadius: BorderRadius.circular(10)),
              //   child: TextField(
              //     controller: _movieRatingEditingController,
              //     decoration: InputDecoration(
              //         hintStyle: TextStyle(fontSize: 15),
              //         hintText: "Movie IMDB Rating",
              //         border: InputBorder.none,
              //         contentPadding: EdgeInsets.fromLTRB(50, 0, 0, 0)),
              //     onChanged: (value) {
              //       movierating = value;
              //     },
              //     keyboardType: TextInputType.number,
              //     inputFormatters: <TextInputFormatter>[
              //       FilteringTextInputFormatter.digitsOnly
              //     ],
              //   ),
              // ),
              // SizedBox(height: 10),
              // Container(
              //   height: 100,
              //   // width: MediaQuery.of(context).size.width * 0.8,
              //   decoration: BoxDecoration(
              //       color: const Color(0xffffffff),
              //       borderRadius: BorderRadius.circular(10)),
              //   child: Flexible(
              //     child: TextField(
              //       controller: _movieOverviewEditingController,
              //       decoration: InputDecoration(
              //           hintStyle: TextStyle(fontSize: 15),
              //           hintText: "Movie Overview",
              //           border: InputBorder.none,
              //           contentPadding: EdgeInsets.fromLTRB(50, 0, 10, 0)),
              //       onChanged: (value) {
              //         movieoverview = value;
              //       },
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              // ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          //color: const Color(0xff13c7ff),
                          borderRadius: BorderRadius.circular(10)),
                      child: MaterialButton(
                        onPressed: () {
                          // if (_form.currentState.validate()) {
                          //   return showDialog(
                          //       context: context,
                          //       child: AlertDialog(
                          //         actions: [
                          //           FlatButton(
                          //             onPressed: () =>
                          //                 Navigator.of(context)
                          //                     .pop(false),
                          //             child: Text("OK"),
                          //           )
                          //         ],
                          //       ));
                          // }
                        },
                        textColor: Colors.black45,
                        child: Text("CHANGE"),
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

  Widget chooseImageSource() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            "Choose Profile Image Source",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton.icon(
                icon: Icon(
                  Icons.camera,
                  size: 30,
                ),
                label: Text("From Camera"),
                onPressed: () {
                  getImage(ImageSource.camera);
                },
              ),
              FlatButton.icon(
                icon: Icon(
                  Icons.image,
                  size: 30,
                ),
                label: Text("From Gallery"),
                onPressed: () {
                  getImage(ImageSource.gallery);
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  void getImage(ImageSource _imageSource) async {
    final _image = await _imagePicker.getImage(source: _imageSource);
    setState(() {
      _pickedFile = _image;
    });
  }
}
