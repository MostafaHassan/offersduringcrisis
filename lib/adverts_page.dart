import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import "globals.dart" as globals;

class AdvertPageWidget extends StatefulWidget {
  AdvertPageWidget({Key key}) : super(key: key);

  @override
  _AdvertPageWidgetState createState() => _AdvertPageWidgetState();
}

class _AdvertPageWidgetState extends State<AdvertPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("Test"),
    );
  }
}
