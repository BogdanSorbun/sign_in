import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
//  creating the types of everything
  IconData icon;
  String hintText;
  TextInputType textInputType;
  Color textFieldColor, iconColor;
  bool obscureText;
  double bottomMargin;
  TextStyle textStyle, hintStyle;
  var validateFunction;
  var onSaved;
  Key key;

//  what is provided when making the instance of the class
  InputField(
    {
      this.key,
      this.hintText,
      this.obscureText,
      this.textInputType,
      this.textFieldColor,
      this.icon,
      this.iconColor,
      this.bottomMargin,
      this.textStyle,
      this.validateFunction,
      this.onSaved,
      this.hintStyle,
    }
    );

//  the output once all the items in the class are filled up
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return(
      new Container(
        margin: new EdgeInsets.only(bottom: bottomMargin),
        child: new DecoratedBox(
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(new Radius.circular(30.0)),
            color: textFieldColor
          ),
          child: new TextFormField(
            style: textStyle,
            key: key,
            obscureText: obscureText,
            keyboardType: textInputType,
            validator: validateFunction,
            onSaved: onSaved,
            decoration: new InputDecoration(
              hintText: hintText,
              hintStyle: hintStyle,
              icon: new Icon(
                icon,
                color: iconColor,
              ),
            ),
          ),
        ),
      )
    );
  }
}