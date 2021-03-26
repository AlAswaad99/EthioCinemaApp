import 'package:flutter/material.dart';
import 'package:trial_one_flutter/classes/movies.dart';

import 'appbar.dart';
import 'detail_page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List filteredmovies = [];

  Movies movies = new Movies();

  var fetcheddata = [
    {
      "title" : "Batman",
      "time" : "12:15",
      "poster" : "assets/images/Batman.jpeg",
    },
    {
      "title" : "Cyberpunk 2077: Edgerunners",
      "time" : "10:15",
      "poster" : "assets/images/Cyberpunk2077.jpeg",
    },
    {
      "title" : "Despicable Me 3",
      "time" : "6:40",
      "poster" : "assets/images/despicableme3.jpeg",
    },
    {
      "title" : "Hitman",
      "time" : "00:45",
      "poster" : "assets/images/Hitman.jpeg",
    },
    {
      "title" : "Johnny Silverhand",
      "time" : "17:00",
      "poster" : "assets/images/imagessilverhand.jpeg",
    },
    {
      "title" : "Cyberpunk 2077: V's Redemption",
      "time" : "03:55",
      "poster" : "assets/images/imagesv.jpeg",
    },
    {
      "title" : "Ghost of Tsushima",
      "time" : "01:30",
      "poster" : "assets/images/Samurai.jpeg",
    },
    {
      "title" : "Logan",
      "time" : "08:20",
      "poster" : "assets/images/Wolverine.jpeg",
    },
    {
      "title" : "Spiderman: Into the Spider Verse",
      "time" : "11:00",
      "poster" : "assets/images/SpiderMan.jpeg",
    },
  ];

  @override
  void initState() {
    setState(() {
      filteredmovies = fetcheddata;
      print(filteredmovies);

    });
    super.initState();
  }

  void filtermovies(value){
    print(fetcheddata.where((movies) => movies['title'] == value).toList());

    setState(() {
      filteredmovies = fetcheddata.where((movies) => movies['title'].toLowerCase().startsWith(value.toString().toLowerCase())).toList();
      print(filteredmovies);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: _searchappbar()),
      body: Container(
        child: _buildmoviessearchlist(filteredmovies),
      ),
    );
  }

  ListView _buildmoviessearchlist(fetcheddata) {
    return ListView.builder(
      itemCount: fetcheddata.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(fetcheddata[index]['title'], style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
          subtitle: Text("Showing Time: " + fetcheddata[index]['time']),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(image: AssetImage(fetcheddata[index]['poster']),height: 150,),
          ),
          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(title: fetcheddata[index]['title'], time: fetcheddata[index]['time'], poster: fetcheddata[index]['poster'],)));},
        );
      },


    );
  }

  AppBar _searchappbar(){
    return AppBar(
      backgroundColor: const Color(0xffdedede),
      automaticallyImplyLeading: false,
      elevation: 0,
      title: TextField(
        onChanged: (value){
          if(value.isEmpty){
            setState(() {
              filteredmovies = fetcheddata;
            });
          }
          filtermovies(value);
        },
        decoration: InputDecoration(hintText: "Search Movies", icon: Icon(Icons.search), hintStyle: TextStyle(color: Colors.black54)),),
      actions: searchingappbar(),
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

  List<Widget> searchingappbar(){
    return[
      IconButton(icon: Icon(Icons.cancel, color: Colors.black,), onPressed: () => Navigator.of(context).pop())
    ];
  }

}

