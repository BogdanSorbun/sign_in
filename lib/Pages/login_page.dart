import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_flat_app/theme/style.dart';
//import 'style.dart';
import 'package:sign_in/inputField.dart';
import 'package:sign_in/textButton.dart';
import 'package:sign_in/roundedButton.dart';
import 'package:sign_in/validation.dart';
import 'package:sign_in/authentication.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ScrollController scrollController = new ScrollController();
  bool _autoValidate = false;
  Validations validations = new Validations();
  UserData user = new UserData();
  UserAuth userAuth = new UserAuth();

//  not sure what this is
  BuildContext context;

//figure out what in the world we are going to do with this
  _onPressed() {
    print("button clicked");
  }

  onPressed(String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  void _handleSubmitted() async {
    final FormState form = formKey.currentState;

    if (!form.validate()) {
      _autoValidate = true; // Start validating on every change.
      String showError = "Please fix the errors in red before submitting.";
      showInSnackBar(showError);

    } else {
      form.save();
      userAuth.verifyUser(user).then((onValue) {
        if (onValue == "login Successful") {
          Navigator.pushNamed(context, "/HomePage");
        } else {
          showInSnackBar(onValue);
        }}).catchError((PlatformException onError) {
        showInSnackBar(onError.message);
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    final Size screenSize = MediaQuery.of(context).size;
    //print(context.widget.toString());
    Validations validations = new Validations();
    return new Scaffold(
        key: _scaffoldKey,
        body: new SingleChildScrollView(
            controller: scrollController,
            child: new Container(
              padding: new EdgeInsets.all(16.0),
//              decoration: new BoxDecoration(image: backgroundImage),
              child: new Column(
                children: <Widget>[
                  new Container(
                    height: screenSize.height / 2,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
//                        new Center(
//                            child: new Image(
////                              image: logo,
//                              width: (screenSize.width < 500)
//                                  ? 120.0
//                                  : (screenSize.width / 4) + 12.0,
//                              height: screenSize.height / 4 + 20,
//                            ))
                      ],
                    ),
                  ),
                  new Container(
                    height: screenSize.height / 2,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Form(
                          key: formKey,
                          autovalidate: _autoValidate,
                          child: new Column(
                            children: <Widget>[
                              new InputField(
                                  hintText: "Email",
                                  obscureText: false,
                                  textInputType: TextInputType.text,
//                                  textStyle: textStyle,
//                                  textFieldColor: textFieldColor,
                                  icon: Icons.mail_outline,
                                  iconColor: Colors.black,
                                  bottomMargin: 20.0,
                                  validateFunction: validations.validateEmail,
                                  onSaved: (String email) {
                                    user.email = email;
                                  }),
                              new InputField(
                                  hintText: "Password",
                                  obscureText: true,
                                  textInputType: TextInputType.text,
//                                  textStyle: textStyle,
//                                  textFieldColor: textFieldColor,
                                  icon: Icons.lock_open,
                                  iconColor: Colors.black,
                                  bottomMargin: 30.0,
                                  validateFunction:
                                  validations.validatePassword,
                                  onSaved: (String password) {
                                    user.password = password;
                                  }),
                              new RoundedButton(
                                buttonName: "Get Started",
                                onTap: _handleSubmitted,
                                width: screenSize.width,
                                height: 50.0,
                                bottomMargin: 10.0,
                                borderWidth: 0.0,
                                buttonColor: Colors.greenAccent,
                              ),
                            ],
                          ),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new TextButton(
                              buttonName: "Create Account",
                              onPressed: () => onPressed("/SignUp"),
                            ),
                            new TextButton(
                              buttonName: "Need Help?",
                              onPressed: _onPressed,)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
