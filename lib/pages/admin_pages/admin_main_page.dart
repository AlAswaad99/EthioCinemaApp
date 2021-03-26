import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trial_one_flutter/ethio_cinema_app_routes.dart';
import 'package:trial_one_flutter/pages/admin_pages/admin_cinemas_list_page.dart';
import 'package:trial_one_flutter/pages/admin_pages/admin_movies_list_page.dart';
import 'package:trial_one_flutter/pages/appbar.dart';
import 'package:trial_one_flutter/pages/movies_list_page.dart';

class AdminMainPage extends StatefulWidget {
  AdminMainPage({Key key}) : super(key: key);

  static final String routeName = "adminMianPage";

  @override
  _AdminMainPageState createState() => _AdminMainPageState();
}

class _AdminMainPageState extends State<AdminMainPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  final List<String> paths = [
    "Admin/Movies",
    "Admin/Cinemas",
    "Admin/Schedules"
  ];
  String currentpath;

  @override
  void initState() {
    currentpath = paths[0];
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    tabController.addListener(changepath);
    super.initState();
  }

  void changepath() {
    setState(() {
      currentpath = paths[tabController.index];
    });
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
    return MaterialApp(
      onGenerateRoute: EthioCinemaAppRoute.generateRoute,
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(currentpath),
        ),

        body: TabBarView(
          controller: tabController,
          children: [
            AdminMoviesListPage(),
            // Center(
            //   child: Text(
            //     "Cinemas",
            //     style: TextStyle(fontSize: 72.0),
            //   ),
            // ),
            AdminCinemasListPage(),
            Center(
              child: Text(
                "Schedules",
                style: TextStyle(fontSize: 72.0),
              ),
            ),
          ],
        ),

        bottomNavigationBar: TabBar(
          controller: tabController,
          tabs: [
            Tab(
              icon: Icon(
                Icons.movie,
                color: Colors.blue,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.location_city,
                color: Colors.blue,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.list,
                color: Colors.blue,
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
