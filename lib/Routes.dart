import 'package:flutter/material.dart';
import 'package:sign_in/Pages/login_page.dart';
import 'package:sign_in/Pages/signuppage.dart';
import 'package:sign_in/Pages/homepage.dart';
import 'package:sign_in/Pages/confirmation.dart';
//import 'package:flutter_flat_app/theme/style.dart';

class Routes {

  var routes = <String, WidgetBuilder>{
    "/SignUp": (BuildContext context) => new SignUpScreen(),
    "/HomePage": (BuildContext context) => new HomePage(),
    "/Login": (BuildContext context) => new LoginScreen(),
    "/Confirmation": (BuildContext context) => new confirmationScreen(),
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
