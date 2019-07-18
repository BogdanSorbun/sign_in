import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class confirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('please confirm your account in email');
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('Login Page'),
            onPressed: () {
              Navigator.pushNamed(context, "/Login");
            }
        ),
      ),
    );
  }
}
