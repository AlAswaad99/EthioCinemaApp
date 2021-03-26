class Movies {
  final String title;
  final String time;
  final String poster;

  Movies({this.title, this.time, this.poster});

  Movies.fromJSON(Map<String, dynamic> json)
      : title = json['title'] ?? '',
        time = json['time'] ?? '',
        poster = json['poster'] ?? '';
}
