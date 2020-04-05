import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StaticSideMenu extends StatefulWidget {
  StaticSideMenu({Key key}) : super(key: key);

  @override
  _StaticSideMenuState createState() => _StaticSideMenuState();
}

class _StaticSideMenuState extends State<StaticSideMenu> {
  Color selectedColor = Colors.white24;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: new BoxConstraints(
        minHeight: MediaQuery.of(context).size.height,
        minWidth: 170.0,
        maxHeight: MediaQuery.of(context).size.height,
        maxWidth: 300.0,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.25,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.white, Colors.grey.shade200],
        )),
        child: ListView(
          children: <Widget>[
            SideMenuItem(
              title: Text("Hem", style: GoogleFonts.spectral()),
              navigationPushName: "home",
            ),
            SideMenuItem(
              title: Text("Sök", style: GoogleFonts.spectral()),
            ),
            SideMenuItem(
              title: Text("Kontakta Oss", style: GoogleFonts.spectral()),
            ),
            SideMenuItem(
              title: Text("Om Oss", style: GoogleFonts.spectral()),
            ),
            SideMenuItem(
              title: Text("Registrera Ad", style: GoogleFonts.spectral()),
              navigationPushName: "registerAdvert",
            ),
          ],
        ),
      ),
    );
  }
}

class SideMenuItem extends StatefulWidget {
  SideMenuItem(
      {Key key,
      this.title,
      this.navigationPushName = "",
      this.defaultColor = Colors.white24,
      this.hoverColor = Colors.purpleAccent})
      : super(key: key);

  final Text title;
  final String navigationPushName;
  final Color defaultColor;
  final Color hoverColor;

  @override
  _SideMenuItemState createState() =>
      _SideMenuItemState(title, navigationPushName, defaultColor, hoverColor);
}

class _SideMenuItemState extends State<SideMenuItem> {
  Text title;
  String navigationPushName;
  Color defaultColor;
  Color hoverColor;
  Color currentColor;

  _SideMenuItemState(
      this.title, this.navigationPushName, defaultColor, this.hoverColor);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
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
      child: Container(
        color: currentColor,
        child: ListTile(
          title: title,
          trailing:
              new Icon(Icons.arrow_right, color: Color.fromRGBO(39, 6, 122, 1)),
          onTap: () {
            if (navigationPushName.isNotEmpty) {
              Navigator.pushNamed(context, navigationPushName);
            }
          },
        ),
      ),
    );
  }
}
