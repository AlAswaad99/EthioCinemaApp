import 'package:equatable/equatable.dart';

class Cinema extends Equatable {
  final String name;
  final String location;
  final int seats;
  final int price2d;
  final int price3d;

  Cinema({this.name, this.location, this.seats, this.price2d, this.price3d});

  Cinema.fromJSON(Map<String, dynamic> json)
      : name = json['name'] ?? '',
        location = json['location'] ?? '',
        seats = json['seats'] ?? 0,
        price2d = json['price2d'] ?? 0,
        price3d = json['price3d'] ?? 0;

  @override
  // TODO: implement props
  List<Object> get props => [name, location, seats, price2d, price3d];
}
