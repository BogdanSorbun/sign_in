import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sign_in/inputField.dart';
import 'package:sign_in/textButton.dart';
import 'package:sign_in/roundedButton.dart';
import 'package:sign_in/validation.dart';
import 'package:sign_in/authentication.dart';
//import 'package:flutter_app/style.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  SignUpScreenState createState() => new SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  UserData newUser = new UserData();
  UserAuth userAuth = new UserAuth();
  bool _autoValidate = false;
  Validations _validations = new Validations();

  _onPressed() {
    print("button clicked");
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autoValidate = true; // Start validating on every change.
      showInSnackBar('Please fix the errors in red before submitting.');
    }
//    validates and makes sure that all the passwords match
//    might want to condense this in the future when you have time
    if (!_validations.passwordNotMatch(newUser.password, newUser.confirmPassword)) {
      _autoValidate = true; // Start validating on every change.
      showInSnackBar('Passwords do not match');
    } else {
      form.save();
//      showInSnackBar('Please confirm account in email!');
      _validations.passwordNotMatch(newUser.password, newUser.confirmPassword);
      userAuth.sendEmailVerification();
//      userAuth.sendEmailVerification(newUser).then((onValue) {
//        showInSnackBar(onValue);
//      }).catchError((PlatformException onError) {
//        showInSnackBar(onError.message);
//      });
      showInSnackBar('Please confirm Email');
      Navigator.pushNamed(context, "/Confirmation");
    }
  }

  void _displayUserInfo() {
    final FormState form = _formKey.currentState;

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size screenSize = MediaQuery.of(context).size;
    //print(context.widget.toString());
    return new Scaffold(
        key: _scaffoldKey,
        body: new SingleChildScrollView(
          child: new Container(
            padding: new EdgeInsets.all(16.0),
//            decoration: new BoxDecoration(image: backgroundImage),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new SizedBox(
                    height: screenSize.height / 2,
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          "CREATE ACCOUNT",
                          textAlign: TextAlign.center,
//                          style: headingStyle,
                        )
                      ],
                    )),
                new SizedBox(
                  height: screenSize.height / 2,
                  child: new Column(
                    children: <Widget>[
                      new Form(
                          key: _formKey,
                          autovalidate: _autoValidate,
                          //onWillPop: _warnUserAboutInvalidData,
                          child: new Column(
                            children: <Widget>[
                              new InputField(
                                hintText: "Username",
                                obscureText: false,
                                textInputType: TextInputType.text,
//                                textStyle: textStyle,
//                                textFieldColor: textFieldColor,
                                icon: Icons.person_outline,
                                iconColor: Colors.black,
                                bottomMargin: 20.0,
                                validateFunction: _validations.validateName,
                                onSaved: (String name) {
                                  newUser.displayName = name;
                                },
                              ),
                              new InputField(
                                  hintText: "Email",
                                  obscureText: false,
                                  textInputType: TextInputType.emailAddress,
//                                  textStyle: textStyle,
//                                  textFieldColor: textFieldColor,
                                  icon: Icons.mail_outline,
                                  iconColor: Colors.black,
                                  bottomMargin: 20.0,
                                  validateFunction: _validations.validateEmail,
                                  onSaved: (String email) {
                                    newUser.email = email;
                                  }),
                              new InputField(
                                  hintText: "Password",
                                  obscureText: true,
                                  textInputType: TextInputType.text,
//                                  textStyle: textStyle,
//                                  textFieldColor: textFieldColor,
                                  icon: Icons.lock_open,
                                  iconColor: Colors.black,
                                  bottomMargin: 40.0,
                                  validateFunction:
                                  _validations.validatePassword,
                                  onSaved: (String password) {
                                    newUser.password = password;
                                  }),
                              new InputField(
                                  hintText: "Password Confirmation",
                                  obscureText: true,
                                  textInputType: TextInputType.text,
//                                  textStyle: textStyle,
//                                  textFieldColor: textFieldColor,
                                  icon: Icons.lock_open,
                                  iconColor: Colors.black,
                                  bottomMargin: 40.0,
                                  validateFunction:
                                  _validations.validatePassword,
                                  ),
                              new RoundedButton(
                                  buttonName: "Continue",
                                  onTap: _handleSubmitted,
                                  width: screenSize.width,
                                  height: 50.0,
                                  bottomMargin: 10.0,
                                  borderWidth: 1.0)
                            ],
                          )),
                      new TextButton(
                        buttonName: "Terms & Condition",
                        onPressed: _onPressed,
//                        buttonTextStyle: buttonTextStyle,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
