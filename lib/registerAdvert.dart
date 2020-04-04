import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import "Appbars/appbarGeneral.dart";
import 'package:google_fonts/google_fonts.dart';

class RegisterAdvert extends StatefulWidget {
  @override
  _RegisterAdvertState createState() => _RegisterAdvertState();
}

class _RegisterAdvertState extends State<RegisterAdvert> {
  final _titleTextController = TextEditingController();
  @override
  final _siteTextController = TextEditingController();
  void initState() {}

  @override
  void dispose() {
    _titleTextController.dispose();

    super.dispose();
  }

_createTextFieldWithMultipleLines(
      TextEditingController controller, String labelText, {Icon icon}) {
    var w = MediaQuery.of(context).size.width;
    var textW;
    if (w > 600) {
      textW = 500;
    } else {
      textW = w * 0.8;
    }
    var tf = Container(
                alignment: Alignment.centerLeft,

                height: 100,
                width: textW,
                child: TextField(
                  controller: controller,
                  expands: true,
                  maxLength: null,
                  maxLines: null, 
                  style: TextStyle(color: Colors.black),
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                    labelText: labelText,
                    prefixIcon: Icon(Icons.description, color: Colors.green)),
                  ),
                  
                );

    return tf;
  }

  _createTextField(
      TextEditingController controller, String labelText, String helperText,
      {String hintText, Icon icon, TextInputType keyboardType}) {
    var w = MediaQuery.of(context).size.width;
    var textW;
    if (w > 600) {
      textW = 500;
    } else {
      textW = w * 0.8;
    }
    var tf = Container(
      alignment: Alignment.centerLeft,
    //  decoration: BoxDecoration(
          //border: Border.all()
    //      ),
      height: 60,
      width: textW,
      child: TextField(
        keyboardType: keyboardType,
        obscureText: false,
        style: TextStyle(color: Colors.black),
        decoration: new InputDecoration(
          border: new OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.teal)),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 13),
          helperText: helperText,
          labelText: labelText,
          prefixIcon: icon,
        ),
        controller: controller, //_nameTextController,
        onChanged: (text) {
          //print("$text");
          print(controller.text);
        },
      ),
    );
    return tf;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        "Registrera din annons",
        context,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(children: <Widget>[
                SizedBox(width: 10, height: 80),
                Expanded(child: Divider()),
                Flexible(
                  child: Center(
                    child: Text("Tack för att du vill hjälpa andra!",
                        style: GoogleFonts.righteous(fontSize: 20),
                        textAlign: TextAlign.center),
                  ),
                  flex: 8,
                ),
                Expanded(child: Divider()),
              ]),

              Text("Annons",
                  style: GoogleFonts.righteous(fontSize: 20),
                  textAlign: TextAlign.start),

              _createTextField(
                _titleTextController,
                "Titel",
                "",
                hintText: "Annons titel",
                icon: Icon(Icons.title, color: Colors.green),
              ),

              // TODO: Ändra till dropdown, och hämta från db
              _createTextField(
                null,
                "Kategori",
                "",
                icon: Icon(Icons.category, color: Colors.green),
              ),

              // TODO: Ändra till dropdown med sökfält, och hämta från db?
              _createTextField(
                null,
                "stad",
                "",
                hintText: "Vilka städer gäller annonsen i?",
                icon: Icon(Icons.location_city, color: Colors.green),
              ),

              _createTextFieldWithMultipleLines(
                null,
                "Beskrivning av tjänst",
                icon: Icon(Icons.description, color: Colors.green),
              ),
              SizedBox(height: 20),

              _createTextField(
                null,
                "Tagga ditt inlägg",
                "",
                hintText: "Separera med semikolon",
                icon: Icon(Icons.tag_faces, color: Colors.green),
              ),

              //

              Text("Kontaktuppgifter",
                  style: GoogleFonts.righteous(fontSize: 20),
                  textAlign: TextAlign.start),

              _createTextField(
                null,
                "Organisationsnamn",
                "Skriv in det företags- eller föreningsnamn som vill annonsera via Corona Heroes.",
                icon: Icon(Icons.person, color: Colors.green),
              ),

              SizedBox(height: 20),

              _createTextField(
                null,
                "Webbsida",
                "",
                hintText: "https://...",
                icon: Icon(Icons.details, color: Colors.green),
              ),

              _createTextField(
                null,
                "Adress",
                "",
                icon: Icon(Icons.home, color: Colors.green),
              ),

              _createTextField(
                null,
                "Telefonnummer",
                "",
                keyboardType: TextInputType.number,
                icon: Icon(Icons.phone, color: Colors.green),
              ),

              _createTextField(
                null,
                "Mejladress",
                "",
                hintText: "förnamn.efternamn@domän.se",
                icon: Icon(Icons.contact_mail, color: Colors.green),
              ),

              // Send in data to db
              RaisedButton(
                onPressed: () {
                  print("Clicked Send!");
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.purple.shade900, Colors.purple.shade500],
                        end: Alignment.bottomCenter,
                        begin: Alignment.topCenter,
                      ),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Skicka in!",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),


              SizedBox(height: 40),


            ],
          ),
        ),
      ),
    );
  }
}
