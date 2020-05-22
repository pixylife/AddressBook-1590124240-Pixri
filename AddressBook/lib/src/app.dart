import 'package:flutter/material.dart';
import 'package:AddressBook/src/ui/home.dart';
import 'package:AddressBook/src/util/HexColor.dart';

GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: HexColor("#db8e0c"),
        accentColor: HexColor("#db9a2d"),
        primaryColorDark: HexColor("#dbd3c6"),
      ),
      home: Scaffold(
        key: _scaffoldState,
        body: HomePage(),
      ),
    );
  }
}
