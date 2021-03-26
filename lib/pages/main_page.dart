import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trial_one_flutter/pages/appbar.dart';
import 'package:trial_one_flutter/pages/bottom_navigation_bar.dart';
import 'package:trial_one_flutter/pages/cineam_list.dart';
import 'package:trial_one_flutter/pages/movies_list_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();

  static final String routeName = "MainPage";
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    super.initState();
  }

  Future<bool> _onWillPop() async {
    if (tabController.index != 0) {
      tabController.index = 0;
      return null;
    }
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit this App'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => SystemNavigator.pop(),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60), child: CustomAppBar()),
        body: TabBarView(
          controller: tabController,
          children: [
/*
            Center(
              child: Text("Movies",
              style: TextStyle(
                fontSize: 72.0
              ),
              ),
            ),
*/

            MoviesListPage(),
            // Center(
            //   child: Text(
            //     "Cinemas",
            //     style: TextStyle(fontSize: 72.0),
            //   ),
            // ),
            CinemaListTrial(),
            Center(
              child: Text(
                "About Us",
                style: TextStyle(fontSize: 72.0),
              ),
            ),
          ],
        ),

/*
        Container(
          color: const Color(0xffdedede),
          child: Center(
            child: Text("Home",
              style: TextStyle(
                  fontSize: 72.0
              ),),
          ),
        ),
*/
        bottomNavigationBar: TabBar(
          indicatorColor: Colors.black45,
          controller: tabController,
          tabs: [
            Tab(
              icon: Icon(
                Icons.movie,
                color: Colors.black,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.location_city,
                color: Colors.black,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.info,
                color: Colors.black,
              ),
            ),
          ],
        ),
        //CustomBottomNavigationBar("home"),
        backgroundColor: const Color.fromRGBO(255, 255, 255, 0.9),
      ),
    );
  }
}
