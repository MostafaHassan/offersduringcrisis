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

    return Scaffold(
      appBar: getAppBar(
        advert.name,
        context,
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            children: [
              SizedBox(height: 20),

              // TITLE
              Text(advert.title,
                  style:
                      GoogleFonts.rammettoOne(color: Colors.black, fontSize: 30)),

              Padding(
                padding: const EdgeInsets.only(right: 50, left: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    
                    
                // COMPANY IMAGE
                    Flexible(
                      flex: 5,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Container(
                          //alignment: Alignment.topCenter,
                          width: 256.0,
                          height: 256.0,
                          margin: EdgeInsets.all(20),
                          decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: new DecorationImage(
                              //fit: BoxFit.fill,
                              image: new NetworkImage(
                                globals.ipAdress + advert.avatar,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Flexible(
                      flex: 8,
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          // Company picture

                          Container(
                            margin: EdgeInsets.only(left: 20, top: 20),
                            child: Text(
                              advert.name,
                              style: GoogleFonts.spectral(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20, top: 5),
                            child: Text(
                              advert.title,
                              style: GoogleFonts.spectral(
                                textStyle: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20, top: 20),
                            child: Text(
                              advert.description,
                              style: GoogleFonts.spectral(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),

                          // TEST

                          Container(
                            margin: EdgeInsets.only(left: 20, top: 20),
                            child: Text(
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

                          Container(
                            //alignment: Alignment.bottomCenter,
                            //margin: new EdgeInsets.only(bottom: 50, right: 10, left: 10, top: 10),
                            margin: EdgeInsets.only(left: 20, top: 20),
                            child: websiteIconWidget,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
