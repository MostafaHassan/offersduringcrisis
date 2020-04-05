import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import "advert_page.dart";
import "globals.dart" as globals;
import 'package:google_fonts/google_fonts.dart';

class Contact {
  String name;
  String email;
  String phone;
  String address;
  String website;
  bool visible;

  Contact(dynamic contactInformationJson) {
    if(contactInformationJson != null)
    {
    print("Parsing contact information");
    name = contactInformationJson["Name"];
    email = contactInformationJson["Email"];
    phone = contactInformationJson["Phone"];
    address = contactInformationJson["Address"];
    website = contactInformationJson["Website"];
    bool _visible = contactInformationJson["Visible"];
    this.visible = (_visible == null ? false : _visible);
    print("Parsed contact information");
    }
    else
    {
      print("No contact information provided");
    }
  }
}

class Advert {
  int id;
  String name;
  String title;
  String activeUntil;
  bool visible;

  String description;
  String avatar;

  String registeredAt;

  Contact contact;
  //City[] cities;
  //Category[] categories;

  Advert({
    this.id,
    this.name,
    this.title,
    this.activeUntil,
    this.visible,
    this.description,
    this.avatar,
    this.registeredAt,
    this.contact,

    //this.cities,
    //this.categories
  });

  Widget visualize(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            //Navigator.of(context).pop();
            //if (Navigator.canPop(context)) Navigator.of(context).pop();

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) =>
                    new AdvertPageWidget(advert: this),
              ),
            );
          },
          child: Container(
            width: 190.0,
            height: 190.0,
            decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              image: new DecorationImage(
                //fit: BoxFit.fill,
                image: new NetworkImage(
                  globals.ipAdress + avatar,
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(
            title,
            style: GoogleFonts.spectral(
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Text(
          name,
          style: GoogleFonts.spectral(),
        ),
      ],
    );
  }
}
