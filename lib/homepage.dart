import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    /*
The Scaffold widget provides a consistent visual structure to apps that follow the Material
Design Guidelines. It also supports special Material Design components, such as Drawers,
AppBars, and SnackBars.
 */
   return Scaffold(
        drawer: Drawer(
//ListView is handy because it allows users to scroll through the drawer if
// the content takes more space than the screen supports.
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {

                },
              ),
              ListTile(
                title: Text("item 2"),
                onTap: () {
//                  do something
                },
              )
            ],
          ),
        )
    );
  }
}
