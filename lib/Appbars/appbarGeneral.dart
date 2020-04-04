import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

getAppBar(String title, context) {

  IconButton backButton;
  backButton = new IconButton(
    icon: Navigator.canPop(context) == true
        ? Icon(Icons.arrow_back)
        : Container(),
    onPressed: () {
      if (Navigator.canPop(context)) {
        Navigator.of(context).pop();

        if (Navigator.canPop(context) == false) {
          backButton = null;
        }
      }
    },
  );

  return AppBar(
    toolbarOpacity: 1,
    iconTheme: IconThemeData(color: Colors.black),
      title: Row(
        children: <Widget>[
       //   Navigator.canPop(context) == true? Flexible(flex: 2, child: backButton) : Container(),
          Flexible(flex: 5, child: Text(title, style: GoogleFonts.rammettoOne(color: Colors.black)))
        ],
      ), //title,
      backgroundColor: Theme.of(context).appBarTheme.color,
      elevation: 0,
      actions: <Widget>[

        IconButton(
          icon: Icon(Icons.search),
          tooltip: 'Sök',
          onPressed: (){},
        ),
      ]);
}