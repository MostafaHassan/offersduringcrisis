import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWidget extends StatefulWidget with PreferredSizeWidget {
  @override
  get preferredSize => Size.fromHeight(50.0);

  AppBarWidget({Key key, this.title}) : super(key: key);

  final title;

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState(title: title);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  String title;
  Color currentRegisterAdColor = Colors.white;
  _AppBarWidgetState({this.title});

  @override
  Widget build(BuildContext context) {
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
          Flexible(
            flex: 5,
            child: Text(
              title,
              style: GoogleFonts.rammettoOne(color: Colors.black),
            ),
          ),
        ],
      ), //title,
      backgroundColor: Color.fromARGB(255, 161, 207, 255),//Theme.of(context).appBarTheme.color,
      elevation: 0,
      actions: <Widget>[
        MouseRegion(
          onHover: (_) {
            return setState(() {
              currentRegisterAdColor = Colors.white70;
            });
          },
          onExit: (_) {
            return setState(() {
              currentRegisterAdColor = Colors.white;
            });
          },
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "registerAdvert");
            },
            child: Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: currentRegisterAdColor,
              ),
              //alignment: Alignment.centerRight,
              alignment: Alignment.center,
              width: 100,
              height: 10,
              child: IconButton(
                onPressed: null,
                icon: Icon(Icons.rate_review),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/*
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
        Flexible(
          flex: 5,
          child: Text(
            title,
            style: GoogleFonts.rammettoOne(color: Colors.black),
          ),
        ),
      ],
    ), //title,
    backgroundColor: Theme.of(context).appBarTheme.color,
    elevation: 0,
    actions: <Widget>[
      MouseRegion(
        onHover: (_) {
          return setState(() {
            currentColor = hoverColor;
          });
        },
        onExit: (_) {
          return setState(() {
            currentColor = defaultColor;
          });
        },
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "registerAdvert");
          },
          child: Container(
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: currentRegisterAdColor,
            ),
            //alignment: Alignment.centerRight,
            alignment: Alignment.center,
            width: 150,
            height: 10,
            child: Text(
              "Register Ad",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
*/
