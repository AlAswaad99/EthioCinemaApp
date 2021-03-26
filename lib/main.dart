import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trial_one_flutter/classes/user.dart';
import 'package:trial_one_flutter/ethio_cinema_app_routes.dart';
import 'package:trial_one_flutter/pages/profile_page.dart';
import 'package:trial_one_flutter/pages/sign_in.dart';
import 'package:trial_one_flutter/pages/bottom_navigation_bar.dart';
import 'package:trial_one_flutter/pages/appbar.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    theme: ThemeData(accentColor: const Color(0xff13c7ff)),
    onGenerateRoute: EthioCinemaAppRoute.generateRoute,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfilePage(
      user: User(
          fullname: "Danny Terefe",
          email: "dannyboy9917@gmail.com",
          password: "Dadusha99",
          phone: "0944194561"),
    );
  }
}
