import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import "globals.dart" as globals;
import 'advert.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AdvertsPageWidget extends StatefulWidget {
  AdvertsPageWidget({Key key}) : super(key: key);

  @override
  _AdvertsPageWidgetState createState() => _AdvertsPageWidgetState();
}

class _AdvertsPageWidgetState extends State<AdvertsPageWidget> {
  final String advertsUrl = globals.ipAdress + globals.urlAdverts;
  List<Advert> adverts = new List<Advert>();
  bool loaded = false;

  void getRequest() async {
    var response = await http.get(advertsUrl);
    globals.advertMap = json.decode(response.body);
    print("NUmber of adverts: " + globals.advertMap.length.toString());
    for (int i = 0; i < globals.advertMap.length; i++) {
      var advertDict = globals.advertMap[i];

      int id;
      String name;
      String title;
      String activeUntil;
      bool visible;

      String description;
      String avatar;

      String registeredAt;
      
      Contact contact;
      List<City> cities = new List<City>();
      List<Category> categories = new List<Category>();

      try {
        id = advertDict["id"];
        name = advertDict["Name"];
        title = advertDict["Title"];
        activeUntil = advertDict["Activeuntil"];
        visible = advertDict["Visible"];
        description = advertDict["Description"];

        var icon = advertDict["Icon"];
        avatar = (icon == null ? "" : icon["url"]);

        registeredAt = advertDict["RegisteredAt"];

        contact = new Contact(advertDict["Contact"]);
        
        for(var c = 0; c < advertDict["Cities"].length; c++)
        {
          City cit =  City(advertDict["Cities"][c]);
          cities.add(cit);
        }
        for(var c = 0; c < advertDict["Categories"].length; c++)
        {
          Category cat =  Category(advertDict["Categories"][c]);
          categories.add(cat);
        }


      } catch (e) {
        print(e);
      }

      Advert advert = new Advert(
        id: id,
        name: name,
        title: title,
        activeUntil: activeUntil,
        visible: visible,
        description: description,
        avatar: avatar,
        registeredAt: registeredAt,
        contact: contact,
        cities: cities,
        categories: categories
      );

      if(visible == null)
      {
        print("Setting advert with name \"" + name + "\" to default: false");
        visible = false;
      }

      //print("Name: " + advert.name);
      //print("Title: " + advert.title);
      //print("ActiveUntil: " + advert.activeUntil.toString());
      //print("Visible: " + advert.visible.toString());
      //print("Description: " + advert.description);
      //print("Avatar: " + advert.avatar);
      //print("RegisteredAt: " + advert.registeredAt.toString());

      adverts.add(advert);
    }

    setState(() {
      loaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    print("Getting requests");
    getRequest();
    print("Requests gotten");
  }

  @override
  Widget build(BuildContext context) {
    print("Building AdvertsPageWidget");
    List<Widget> advertWidgets = new List<Widget>();
    if(adverts.length > 0)
    {
      //for(int i = 0; i < 20; i++)
      //  advertWidgets.add(adverts[i%2].visualize(context));

      for(int i = 0; i < 25; i++)
        advertWidgets.add(adverts[i % adverts.length].visualize(context));

      //for(int i = 0; i < adverts.length; i++)
      //  advertWidgets.add(adverts[i].visualize(context));
    }
    print("Number of adverts: " + adverts.length.toString());

    return Expanded(
      child: SingleChildScrollView(
        //padding: EdgeInsets.all(15),
        padding: EdgeInsets.only(top: 15, left: 50, right: 50, bottom: 200),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
            minWidth: MediaQuery.of(context).size.width,
          ),
          child: Container(
            alignment: Alignment.topCenter,
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 20,
              runSpacing: 20,
              children: advertWidgets
            ),
          ),
        ),
      ),
    );
  }
}
