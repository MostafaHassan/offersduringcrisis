import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "globals.dart" as globals;
import "advert.dart";
import 'package:google_fonts/google_fonts.dart';
import "Appbars/appbarGeneral.dart";
import "Drawers/drawerGeneral.dart";

class AdvertPageWidget extends StatefulWidget {
  final Advert advert;

  AdvertPageWidget({Key key, @required this.advert}) : super(key: key);

  @override
  _AdvertPageWidgetState createState() => _AdvertPageWidgetState(advert);
}

class _AdvertPageWidgetState extends State<AdvertPageWidget> {
  Advert advert;

  _AdvertPageWidgetState(this.advert);

  @override
  Widget build(BuildContext context) {
    IconButton websiteIconWidget = IconButton(
      icon: Icon(FontAwesomeIcons.home),
      color: Color.fromARGB(255, 120, 120, 120),
      onPressed: () {
        globals.launchURL("alihassan.se");
        //globals.launchURL(advert.contact.website);
      },
    );

    var titleSize = MediaQuery.of(context).size.width * 0.04;
    if (titleSize > 30) {
      titleSize = 30;
    }

    return Scaffold(
      appBar: AppBarWidget(title: advert.name),
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            children: [
              SizedBox(height: 20),

              // TITLE
              Center(
                child: Text(
                  advert.title,
                  style: GoogleFonts.rammettoOne(
                      color: Colors.black, fontSize: titleSize),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 50, left: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          // COMPANY IMAGE
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Container(
                                //alignment: Alignment.topCenter,
                                width: MediaQuery.of(context).size.width *
                                    0.16, // 256.0,
                                height: MediaQuery.of(context).size.width *
                                    0.16, //256.0,
                                margin: EdgeInsets.all(20),
                                decoration: new BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  image: new DecorationImage(
                                    //fit: BoxFit.cover //BoxFit.fill,
                                    image: new NetworkImage(
                                      globals.ipAdress + advert.avatar,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                    Flexible(
                      flex: 8,
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 20, top: 50),
                            child: Text(
                              advert.description,
                              style: GoogleFonts.spectral(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),

                          // HEMSIDA
                          // ADRESS
                          // TELEFONNUMMER
                          // MAILADRESS

                          // STAD
                          // KATEGORI

                          // TEST
/*
                          Container(
                            margin: EdgeInsets.only(left: 20, top: 20),
                            child: Text(
                              "test..." +

                              advert.id.toString() +
                                  " ,\nFöretagsnamn: " +
                                  advert.name.toString() +
                                  " ,\nTitel: " +
                                  advert.title.toString() +
                                  " ,\nVisible: " +
                                  advert.visible.toString() +
                                  " ,\nAvatar: " +
                                  advert.avatar.toString() +
                                  " ,\nRegisterAt: " +
                                  advert.registeredAt.toString() +
                                  " ,\nKontaktNamn: " +
                                  advert.contact.name.toString() +
                                  " ,\nKontaktE-mail: " +
                                  advert.contact.email.toString() +
                                  " ,\nKontaktTelnr: " +
                                  advert.contact.phone.toString() +
                                  " ,\nKontaktAdress: " +
                                  advert.contact.address.toString() +
                                  " ,\nKontaktWebbsida: " +
                                  advert.contact.website.toString() +
                                  " ,\nKontaktSynlig: " +
                                  advert.contact.visible.toString() +
                                  " ,\nCitiesLength: " +
                                  advert.cities.length.toString() +
                                  " ,\nCitiesLength: " +
                                  advert.cities[0].name.toString() +
                                  " ,\nCategoriesLength: " +
                                  advert.categories.length.toString(),
                              style: GoogleFonts.spectral(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
*/

/*
                          Container(
                            //alignment: Alignment.bottomCenter,
                            //margin: new EdgeInsets.only(bottom: 50, right: 10, left: 10, top: 10),
                            margin: EdgeInsets.only(left: 20, top: 20),
                            child: websiteIconWidget,
                          ),

*/
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              Padding(
                padding: EdgeInsets.only(right: 75, left: 75),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(children: [
                    RaisedButton(
                      elevation: 0,
                      color: Color.fromARGB(0, 0, 0, 0),
                      onPressed: () {},
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.language,
                              size: 30,
                            ),
                            SizedBox(width: 5),
                            Text("Hemsida\t\t\t"+ advert.contact.website.toString()),
                          ]),
                    ),
                    RaisedButton(
                      elevation: 0,
                      color: Color.fromARGB(0, 0, 0, 0),
                      onPressed: () {},
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.home,
                              size: 30,
                            ),
                            SizedBox(width: 5),
                            Text("Adress\t\t\t"+ advert.contact.address.toString()),
                          ]),
                    ),
                    RaisedButton(
                      elevation: 0,
                      color: Color.fromARGB(0, 0, 0, 0),
                      onPressed: () {},
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.phone,
                              size: 30,
                            ),
                            SizedBox(width: 5),
                            Text("Telefonnummer\t"+ advert.contact.phone.toString()),
                          ]),
                    ),
                    RaisedButton(
                      elevation: 0,
                      color: Color.fromARGB(0, 0, 0, 0),
                      onPressed: () {},
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.mail,
                              size: 30,
                            ),
                            SizedBox(width: 5),
                            Text("Mejladress\t\t"+ advert.contact.email.toString()),
                          ]),
                    ),
                    SizedBox(height: 30),
                    
                    RaisedButton(
                      elevation: 0,
                      color: Color.fromARGB(0, 0, 0, 0),
                      onPressed: () {},
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.place,
                              size: 30,
                            ),
                            SizedBox(width: 5),
                            ((){
                              var cities = "";
                              for(int i = 0; i < advert.cities.length;i++)
                              {
                              if(i > 0)
                                cities += ", ";
                                cities += advert.cities[i].name;
                              }

                              return Text("Plats\t\t\t"+ cities);
                            }())
                            
                          ]),
                    ),
                    RaisedButton(
                      elevation: 0,
                      color: Color.fromARGB(0, 0, 0, 0),
                      onPressed: () {},
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.category,
                              size: 30,
                            ),
                            SizedBox(width: 5),
                            ((){
                              var categories = "";
                              for(int i = 0; i < advert.categories.length;i++)
                              {
                              if(i > 0)
                                categories += ", ";
                                categories += advert.categories[i].name;
                              }

                              return Text("Kategori\t\t\t"+ categories);
                            }())
                          ]),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
