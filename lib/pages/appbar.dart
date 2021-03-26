import 'package:flutter/material.dart';
import 'package:trial_one_flutter/classes/user.dart';
import 'package:trial_one_flutter/pages/movies_list_page.dart';
import 'package:trial_one_flutter/pages/my_bookings.dart';
import 'package:trial_one_flutter/pages/profile_page.dart';
import 'package:trial_one_flutter/pages/search_page.dart';

class CustomAppBar extends StatefulWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xffdedede),
      automaticallyImplyLeading: false,
      elevation: 0,
      actions: plainappbar(),
      /*[
        InkWell(
          child: ShaderMask(
            child: Image(
                image: AssetImage("assets/search.png")),
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors: [const Color(0xff000000), const Color(0xff000000)],
              ).createShader(bounds);
            },
            blendMode: BlendMode.srcATop,
          ),
          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchPage())),
        ),
        InkWell(
          child: ShaderMask(
            child: Image(
                image: AssetImage("assets/my_cart.png")),
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors: [const Color(0xff000000), const Color(0xff000000)],
              ).createShader(bounds);
            },
            blendMode: BlendMode.srcATop,
          ),
          onTap: (){},
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0,0,15.0,0),
          child: InkWell(
            child: GestureDetector(
              child: CircleAvatar(
                backgroundColor: const Color(0xff13c7ff),
                child: Stack(
                  children: [
                    Center(child: IconButton(icon: Icon(Icons.add), onPressed: (){}))
                  ],
                ),
              ),
            ),
          ),
        )
      ],*/
    );
  }

  List<Widget> plainappbar() {
    return [
      IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SearchPage()))),
      IconButton(
          icon: Icon(
            Icons.shopping_cart,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyBookings()));
          }),
      Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0, 15.0, 0),
          child: InkWell(
              child: GestureDetector(
            child: CircleAvatar(
              radius: 15,
              backgroundColor: const Color(0xff000000),
              child: Stack(children: [
                Center(
                  child: IconButton(
                      icon: Icon(
                        Icons.person_outline,
                        size: 15,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePage(
                                      user: User(
                                          fullname: "Danny Terefe",
                                          email: "dannyboy9917@gmail.com",
                                          password: "Dadusha99",
                                          phone: "0944194561"),
                                    )));
                      }),
                ),
              ]),
            ),
          )))
    ];
  }
}
