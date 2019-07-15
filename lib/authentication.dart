import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

//A normal constructor always returns a new instance of the current class
//this class will get imported into signup/signin page to fill the information
//out within the constructor
class UserData {
//  fields
  String displayName;
  String email;
  String uid;
  String password;

//  setter/getter?
  UserData({this.displayName, this.email, this.uid, this.password});
}

class UserAuth {
  String statusMessage = "Account has been created";
//  to create a new user
//  Future is used for asynchronous operations - processing or I/O to be
//  completed later.  So basically it performs other work while waiting for
//  an opteration to finish.
  Future<String> createUser(UserData userData) async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
      .createUserWithEmailAndPassword(
//      here we see the information from the class that we used earlier...
        email: userData.email, password: userData.password);
    return statusMessage;
  }

//  to verify the new user
  Future<String> verifyUser(UserData userData) async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
      .signInWithEmailAndPassword(
        email: userData.email, password: userData.password);
    return "login Successful";
  }
}