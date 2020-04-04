import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import "adverts_page.dart";
import "globals.dart" as globals;
import 'package:http/http.dart' as http;
import 'dart:convert';

// Advert: http://151.236.29.15:1337/adverts
/*
    Name
    Email
    Avatar
    Phone
    Address
    Website
    Visible
*/


class AdvertWidget extends StatefulWidget {
  @override
  _AdvertWidgetState createState() => _AdvertWidgetState();
}

class _AdvertWidgetState extends State<AdvertWidget> {

  
  @override
  void initState()
  {
    print("getting adverts...");
    _getAdverts();
  }

  _getAdverts() async
  {
    var result = await http.get(globals.ipAdress + globals.urlAdverts);
    if(result.statusCode == 200)
    {
      print("Successfully got adverts!");
      globals.advertMap = json.decode(result.body);

      print(globals.advertMap.toString());
    }
    else
    {
      print("Could not get adverts");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Text(globals.advertMap.toString()),
    );
  }
}