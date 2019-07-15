import 'package:flutter/material.dart';
import 'package:sign_in/login_page.dart';
import 'package:sign_in/signuppage.dart';
import 'package:sign_in/homepage.dart';
//import 'package:flutter_flat_app/theme/style.dart';

class Routes {

  var routes = <String, WidgetBuilder>{
    "/SignUp": (BuildContext context) => new SignUpScreen(),
    "/HomePage": (BuildContext context) => new HomePage(),
    "/Login": (BuildContext context) => new LoginScreen(),
  };

  Routes() {
    runApp(new MaterialApp(
      title: "Flutter Flat App",
      home: new LoginScreen(),
//      theme: appTheme,
      routes: routes,
    ));
  }
}