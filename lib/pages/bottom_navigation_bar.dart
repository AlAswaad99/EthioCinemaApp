import 'package:flutter/material.dart';
import 'package:trial_one_flutter/pages/about_us_page.dart';
import 'package:trial_one_flutter/pages/home_page.dart';
import 'package:trial_one_flutter/pages/main_page.dart';

class CustomBottomNavigationBar extends StatelessWidget {

  String _ClickedButton;

  CustomBottomNavigationBar(
      this._ClickedButton
      );




  @override
  Widget build(BuildContext context) {
    if(_ClickedButton == "home"){
      return homeClicked(context);
    }
    else if(_ClickedButton == "categories"){
      return categoryClicked(context);
    }
    else if(_ClickedButton == "about_us"){
      return aboutUsClicked(context);
    }
    return Container(
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            child: Container(
              width: 100,
              height: 50,
              child: ShaderMask(
                  child: Image(
                      image: AssetImage("assets/home.png")),
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: [const Color(0xff000000), const Color(0xff000000)],
                    ).createShader(bounds);
                  },
                blendMode: BlendMode.srcATop,
              ),
            ),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainPage())),
          ),
          InkWell(
            child: Container(
              width: 100,
              height: 50,
              child: ShaderMask(
                child: Image(
                    image: AssetImage("assets/categories.png")),
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [const Color(0xff000000), const Color(0xff000000)],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.srcATop,
              ),
            ),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage())),
          ),
          InkWell(
            child: Container(
              width: 100,
              height: 50,
              child: ShaderMask(
                child: Image(
                    image: AssetImage("assets/about.png")),
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [const Color(0xff000000), const Color(0xff000000)],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.srcATop,
              ),
            ),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutUsPage())),
          ),
        ],
      ),
    );
  }

  Widget homeClicked(BuildContext context){
    return Container(
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            child: Container(
              width: 100,
              height: 50,
              child: ShaderMask(
                child: Image(
                    image: AssetImage("assets/home.png")),
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [const Color(0xff13c7ff), const Color(0xff13c7ff)],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.srcATop,
              ),
            ),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainPage())),
          ),
          InkWell(
            child: Container(
              width: 100,
              height: 50,
              child: ShaderMask(
                child: Image(
                    image: AssetImage("assets/categories.png")),
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [const Color(0xff000000), const Color(0xff000000)],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.srcATop,
              ),
            ),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage())),
          ),
          InkWell(
            child: Container(
              width: 100,
              height: 50,
              child: ShaderMask(
                child: Image(
                    image: AssetImage("assets/about.png")),
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [const Color(0xff000000), const Color(0xff000000)],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.srcATop,
              ),
            ),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutUsPage())),
          ),
        ],
      ),
    );
  }

  Widget categoryClicked(BuildContext context){
    return Container(
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            child: Container(
              width: 100,
              height: 50,
              child: ShaderMask(
                child: Image(
                    image: AssetImage("assets/home.png")),
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [const Color(0xff000000), const Color(0xff000000)],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.srcATop,
              ),
            ),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainPage())),
          ),
          InkWell(
            child: Container(
              width: 100,
              height: 50,
              child: ShaderMask(
                child: Image(
                    image: AssetImage("assets/categories.png")),
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [const Color(0xff13c7ff), const Color(0xff13c7ff)],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.srcATop,
              ),
            ),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage())),
          ),
          InkWell(
            child: Container(
              width: 100,
              height: 50,
              child: ShaderMask(
                child: Image(
                    image: AssetImage("assets/about.png")),
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [const Color(0xff000000), const Color(0xff000000)],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.srcATop,
              ),
            ),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutUsPage())),
          ),
        ],
      ),
    );
  }

  Widget aboutUsClicked(BuildContext context){
    return Container(
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            child: Container(
              width: 100,
              height: 50,
              child: ShaderMask(
                child: Image(
                    image: AssetImage("assets/home.png")),
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [const Color(0xff000000), const Color(0xff000000)],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.srcATop,
              ),
            ),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainPage())),
          ),
          InkWell(
            child: Container(
              width: 100,
              height: 50,
              child: ShaderMask(
                child: Image(
                    image: AssetImage("assets/categories.png")),
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [const Color(0xff000000), const Color(0xff000000)],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.srcATop,
              ),
            ),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage())),
          ),
          InkWell(
            child: Container(
              width: 100,
              height: 50,
              child: ShaderMask(
                child: Image(
                    image: AssetImage("assets/about.png")),
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [const Color(0xff13c7ff), const Color(0xff13c7ff)],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.srcATop,
              ),
            ),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutUsPage())),
          ),
        ],
      ),
    );
  }
}
