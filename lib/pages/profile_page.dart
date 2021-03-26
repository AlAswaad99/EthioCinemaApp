import 'dart:io';

import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';
import 'package:trial_one_flutter/classes/user.dart';
import 'package:trial_one_flutter/pages/my_bookings.dart';

class ProfilePage extends StatefulWidget {
  final User user;
  ProfilePage({@required this.user});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool gotAccessToChange = false;
  bool canEdit = false;

  PickedFile _pickedFile;
  String _loadedFile;
  final ImagePicker _imagePicker = new ImagePicker();
  final TextEditingController _userFullNameEditingController =
      new TextEditingController();

  final TextEditingController _userEmailEditingController =
      new TextEditingController();

  final TextEditingController _userPhoneEditingController =
      new TextEditingController();

  final TextEditingController _userPasswordEditingController =
      new TextEditingController();

  // final TextEditingController _userProfilePictureEditingController =
  //     new TextEditingController();

  @override
  void initState() {
    super.initState();
    _userFullNameEditingController.value =
        TextEditingValue(text: widget.user.fullname);
    _userEmailEditingController.value =
        TextEditingValue(text: widget.user.email);
    _userPasswordEditingController.value =
        TextEditingValue(text: widget.user.password);
    _userPhoneEditingController.value =
        TextEditingValue(text: widget.user.phone);
    // _userProfilePictureEditingController.value =
    // TextEditingValue(text: widget.user.profilePicture);
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _form = GlobalKey<FormState>();
    SharedPreferences _storedImage = await SharedPreferences.getInstance();

    void _validate() {
      _form.currentState.validate();
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: false,
      body: Container(
        color: const Color(0xffdedede),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 30.0),
            child: SingleChildScrollView(
              child: Form(
                key: _form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Row(
                        children: [
                          InkWell(
                            child: CircleAvatar(
                              radius: 65.0,
                              backgroundImage: _pickedFile == null
                                  ? AssetImage("assets/profile.png")
                                  : FileImage(File(_pickedFile.path)),
                            ),
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: ((builder) => chooseImageSource()));
                            },
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            child: CircleAvatar(
                              radius: 65.0,
                              backgroundImage: _pickedFile == null
                                  ? AssetImage("assets/profile.png")
                                  : FileImage(File(),
                            ),
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: ((builder) => chooseImageSource()));
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(50, 10, 0, 5),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffe8e8e8),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            )),
                        child: TextFormField(
                          controller: _userFullNameEditingController,
                          validator: ValidationBuilder()
                              .minLength(5)
                              .maxLength(20)
                              .build(),
                          onChanged: (value) {
                            _validate();
                          },
                          decoration: InputDecoration(
                              labelText: "Username",
                              hintStyle: TextStyle(fontSize: 15),
                              // border: InputBorder.none,
                              contentPadding: EdgeInsets.fromLTRB(50, 5, 0, 0)),
                        )),
                    Padding(
                      padding: EdgeInsets.fromLTRB(50, 10, 0, 5),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffe8e8e8),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            )),
                        child: TextFormField(
                          controller: _userEmailEditingController,
                          validator: ValidationBuilder().email().build(),
                          onChanged: (value) {
                            _validate();
                          },
                          decoration: InputDecoration(
                              hintStyle: TextStyle(fontSize: 15),
                              labelText: "E-mail",
                              contentPadding: EdgeInsets.fromLTRB(50, 5, 0, 0)),
                        )),
                    Padding(
                      padding: EdgeInsets.fromLTRB(50, 10, 0, 5),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffe8e8e8),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            )),
                        child: TextFormField(
                          controller: _userPhoneEditingController,
                          validator: ValidationBuilder().phone().build(),
                          onChanged: (value) {
                            _validate();
                          },
                          decoration: InputDecoration(
                              hintStyle: TextStyle(fontSize: 15),
                              labelText: "Phone",
                              contentPadding: EdgeInsets.fromLTRB(50, 5, 0, 0)),
                        )),
                    Padding(
                      padding: EdgeInsets.fromLTRB(50, 10, 0, 5),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xfff2f2f2),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          )),
                      child: TextFormField(
                        controller: _userPasswordEditingController,
                        validator: ValidationBuilder()
                            .minLength(8)
                            .maxLength(20)
                            .build(),
                        onChanged: (value) {
                          _validate();
                        },
                        obscureText: !gotAccessToChange,
                        readOnly: !canEdit,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 15),
                          labelText: "Password",
                          contentPadding: EdgeInsets.fromLTRB(50, 5, 0, 0),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: canEdit
                                ? null
                                : () {
                                    String passChecker = "";
                                    return showDialog(
                                        context: context,
                                        builder: (context) {
                                          String invalidpass = "";

                                          return StatefulBuilder(
                                              builder: (context, setState) {
                                            //String confirmPassHelperText = "";
                                            final TextEditingController
                                                _userPassCheckerController =
                                                new TextEditingController();
                                            return AlertDialog(
                                              title: Column(
                                                children: [
                                                  Text("Confirm Password"),
                                                ],
                                              ),
                                              content: Form(
                                                child: TextFormField(
                                                  controller:
                                                      _userPassCheckerController,
                                                  decoration: InputDecoration(
                                                      helperText: invalidpass,
                                                      helperStyle: TextStyle(
                                                          color: Colors
                                                              .redAccent)),
                                                  onChanged: (value) =>
                                                      passChecker = value,
                                                ),
                                              ),
                                              actions: [
                                                FlatButton(
                                                  child: Text("Confirm"),
                                                  onPressed: () {
                                                    if (passChecker ==
                                                        widget.user.password) {
                                                      setState(() {
                                                        gotAccessToChange =
                                                            !gotAccessToChange;
                                                        canEdit = !canEdit;
                                                        refreshPage();
                                                        Navigator.of(context)
                                                            .pop(false);
                                                      });
                                                    } else {
                                                      setState(() {
                                                        invalidpass =
                                                            "Try Again!!!";
                                                        _userPassCheckerController
                                                                .value =
                                                            TextEditingValue(
                                                                text: "");
                                                      });
                                                    }
                                                  },
                                                )
                                              ],
                                            );
                                          });
                                        });
                                  },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                              child: Text(
                                "EDIT",
                                style: TextStyle(color: Colors.white),
                              ),
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

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyBookings()));
                              },
                              textColor: Colors.black45,
                              child: Text(
                                "GO TO MY BOOKNGS",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void refreshPage() {
    setState(() {});
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

  Future<void> getImage(ImageSource _imageSource) async {
    final _image = await _imagePicker.getImage(source: _imageSource);
    File tmpFile = File(_image.path);
    tmpFile = await tmpFile.copy(tmpFile.path);
    // final String path = awai getAppl
    // final String path = await ;
    // final var fileName = basename(file.path);
    // final File savedImage = await image.copy('$path/')
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(widget.user.fullname, tmpFile.path);
    setState(() {
      _loadedFile = widget.user.fullname;
      _pickedFile = _image;
    });
  }
}
