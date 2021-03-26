import 'package:flutter/material.dart';
import 'package:trial_one_flutter/pages/appbar.dart';
import 'package:trial_one_flutter/pages/bottom_navigation_bar.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: CustomAppBar()),
      body: Container(
        color: const Color(0xffdedede),
        child: Center(
          child: Text("About Us",
          style: TextStyle(
              fontSize: 72.0
          ),),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar("about_us"),
      backgroundColor: const Color.fromRGBO(255,255,255,0.9),
    );  }
}
