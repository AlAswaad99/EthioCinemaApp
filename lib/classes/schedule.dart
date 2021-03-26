import 'package:trial_one_flutter/classes/movies.dart';

class Schedule {
  final String movieTitle;
  final String showingTime;
  final String date;
  final String dateOfWeek;
  final String dimension;

  Schedule(
      {this.movieTitle,
      this.showingTime,
      this.date,
      this.dateOfWeek,
      this.dimension});

  Schedule.fromJSON(Map<String, dynamic> json)
      : movieTitle = json['movie'] ?? '',
        showingTime = json['showingTime'] ?? '',
        date = json['date'] ?? '',
        dateOfWeek = json['dateOfWeek'] ?? '',
        dimension = json['dimension'] ?? '';
}
