import 'package:flutter/material.dart';
import 'testgraphql.dart';
//import 'package:graphql_flutter/graphql_flutter.dart';
import "adverts_page.dart";
import "advert.dart";
import "registerAdvert.dart";
import "Appbars/appbarGeneral.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Corona Heroes',
      theme: ThemeData(
        primarySwatch: Colors.purple,

        appBarTheme: AppBarTheme(
          color: Color.fromARGB(40, 120, 120, 120),
        ),
      ),
      home: MyHomePage(title: 'Corona Heroes'),

      debugShowCheckedModeBanner: false,

      initialRoute: '/',
      routes: {
        "registerAdvert": (context) => RegisterAdvert() ,
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState()
  {
    print("start");
    
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: getAppBar( widget.title, context, ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //Text("test"),
            AdvertsPageWidget(),
            //TestGraphQL(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {Navigator.pushNamed(context, "registerAdvert"); },
        tooltip: 'Register Advert',
        child: Icon(Icons.create),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
