import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';

const String ipAdress = "http://151.236.29.15:1337/";
const String urlAdverts = "adverts";

var advertMap;

void launchURL(var url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else if (kIsWeb) {
    await launch(url);
  } else {
    print("Could not launch $url");
    throw 'Could not launch $url';
  }
}
