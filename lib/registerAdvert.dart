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

  final _nameTextController = TextEditingController();
  @override

  final _siteTextController = TextEditingController();
  void initState()
  {
     
  }

  @override void dispose() {
    _nameTextController.dispose();

    super.dispose();
  }

  _createTextField(TextEditingController controller, String labelText, String helperText, {String hintText, Icon icon, TextInputType keyboardType} )
  {
    var tf = Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  //border: Border.all()
                  ),
              height: 60,
              width: 500,
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
                  onChanged: (text){
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

            _createTextField(_nameTextController, "Titel", "",
            icon: Icon(Icons.title, color: Colors.green),),

            SizedBox(height: 20),
            _createTextField(_siteTextController, "test", ""),

            Text("Kontaktuppgifter",
                      style: GoogleFonts.righteous(fontSize: 20),
                      textAlign: TextAlign.start),

                      
            _createTextField(null, "Organisationsnamn", "Skriv in det företags- eller föreningsnamn som vill annonsera via Corona Heroes.",
            icon: Icon(Icons.person, color: Colors.green),),

            SizedBox(height: 20),

            _createTextField(null, "Webbsida", "",
            icon: Icon(Icons.details, color: Colors.green),),

            _createTextField(null, "Adress", "",
            icon: Icon(Icons.home, color: Colors.green),),

            _createTextField(null, "Telefonnummer", "", keyboardType: TextInputType.number,
            icon: Icon(Icons.phone, color: Colors.green),),

            _createTextField(null, "Mejladress", "", hintText : "förnamn.efternamn@domän.se",
            icon: Icon(Icons.contact_mail, color: Colors.green),),

          ],
        ),
      ),
    );
  }
}
