import 'package:flutter/material.dart';

class User {
  final int id;
  final String fullname;
  final String phone;
  final String email;
  final String password;
  final String profilePicture;
  final int amount;

  User(
      {this.id,
      @required this.fullname,
      @required this.phone,
      @required this.email,
      @required this.password,
      this.profilePicture,
      this.amount});

  User.fromJSON(Map<String, dynamic> json)
      : id = json['ID'] ?? '',
        fullname = json['FullName'] ?? '',
        phone = json['Phone'] ?? '',
        email = json['Email'] ?? '',
        password = json['Password'] ?? '',
        profilePicture = json['ProfilePicture'] ?? '',
        amount = json['Amount'] ?? '';
}
