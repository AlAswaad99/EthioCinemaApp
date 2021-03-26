import 'package:flutter/material.dart';
import 'package:trial_one_flutter/classes/cinemas.dart';
import 'package:trial_one_flutter/classes/user.dart';
import 'package:trial_one_flutter/pages/admin_pages/admin_add_schedule.dart';
import 'package:trial_one_flutter/pages/admin_pages/admin_main_page.dart';
import 'package:trial_one_flutter/pages/booking_page.dart';
import 'package:trial_one_flutter/pages/cinema_detail.dart';
import 'package:trial_one_flutter/pages/cinema_schedule.dart';
import 'package:trial_one_flutter/pages/main_page.dart';
import 'package:trial_one_flutter/pages/profile_page.dart';
import 'package:trial_one_flutter/pages/sign_in.dart';

class EthioCinemaAppRoute {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) => SignInPage());
    }

    if (settings.name == AdminMainPage.routeName) {
      return MaterialPageRoute(builder: (context) => AdminMainPage());
    }

    if (settings.name == MainPage.routeName) {
      return MaterialPageRoute(builder: (context) => MainPage());
    }

    // if (settings.name == AddUpdateCourse.routeName) {
    //   CourseArgument args = settings.arguments;
    //   return MaterialPageRoute(
    //       builder: (context) => AddUpdateCourse(
    //             args: args,
    //           ));
    // }

    if (settings.name == CinemaDetail.routeName) {
      Cinema cinema = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => CinemaDetail(
                cinema: cinema,
              ));
    }

    if (settings.name == CinemaSchedule.routeName) {
      Cinema cinema = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => CinemaSchedule(
                cinema: cinema,
              ));
    }

    if (settings.name == BookingPage.routeName) {
      // Cinema cinema = settings.arguments;
      return MaterialPageRoute(builder: (context) => BookingPage());
    }

    if (settings.name == AdminAddSchedule.routeName) {
      Cinema cinema = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => AdminAddSchedule(
                cinema: cinema,
              ));
    }

    // if (settings.name == CinemaSchedule.routeName) {
    //   //Cinema cinema = settings.arguments;
    //   return MaterialPageRoute(builder: (context) => CinemaSchedule());
    // }

    // if (settings.name == AddMovie.routeName) {
    //   //Cinema cinema = settings.arguments;
    //   return MaterialPageRoute(builder: (context) => AddMovie());
    // }

    // if (settings.name == MovieDetails.routeName) {
    //   Movie movie = settings.arguments;
    //   return MaterialPageRoute(
    //       builder: (context) => MovieDetails(
    //             movie: movie,
    //           ));
    // }

    // if (settings.name == EditMovie.routeName) {
    //   Movie movie = settings.arguments;
    //   return MaterialPageRoute(
    //       builder: (context) => EditMovie(
    //             movie: movie,
    //           ));
    // }

    //return MaterialPageRoute(builder: (context) => SignInPage());
    return MaterialPageRoute(
        builder: (context) => ProfilePage(
              user: User(
                  fullname: "Danny Terefe",
                  email: "dannyboy9917@gmail.com",
                  password: "Dadusha99",
                  phone: "0944194561"),
            ));
  }
}

class CourseArgument {
  final Cinema cinema;
  final bool edit;
  CourseArgument({this.cinema, this.edit});
}
