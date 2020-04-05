import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  SearchBarWidget({Key key}) : super(key: key);

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: 20),
              //margin: EdgeInsets.all(20.0),
              //alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.4,
              child: TextField(
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  //border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 161, 207, 255), width: 5.0),
                  ),
                  labelText: 'Sök på ad, stad, kategori,...',
                ),
                //hintText: ' Sök på ad, stad, kategori,...'),
              ),
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                Container(
                  //margin: EdgeInsets.all(20.0),
                  alignment: Alignment.center,
                  child: FlatButton(
                    color: Color.fromARGB(255, 161, 207,
                        255), //Color.fromARGB(255, 255, 255, 255),
                    hoverColor: Color.fromARGB(255, 111, 157,
                        205), //Color.fromARGB(255, 161, 207, 255),// Color.fromARGB(255, 155, 155, 155),
                    child: Text(
                      "Sök",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                
                Container(
                  margin: EdgeInsets.only(left: 20.0),
                  alignment: Alignment.center,
                  child: FlatButton(
                    color: Color.fromARGB(255, 161, 207,
                        255), //Color.fromARGB(255, 255, 255, 255),
                    hoverColor: Color.fromARGB(255, 111, 157,
                        205), //Color.fromARGB(255, 161, 207, 255),// Color.fromARGB(255, 155, 155, 155),
                    child: Text(
                      "Fler sökalternativ ↓",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),


              ],
            )
          ],
        ),
      ),
    );
  }
}
