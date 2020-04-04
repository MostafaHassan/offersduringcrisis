import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class TestGraphQL extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TestGraphQL_Widget();
  }
}

class TestGraphQL_Widget extends State<TestGraphQL> {
  HttpLink link = HttpLink(
    uri: 'http://151.236.29.134:1337/graphql',
   // headers: <String, String>{
   //   'Authorization':
   //       'Bearer SKRIV IN API-NYCKEL HÄR',
   // },
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: NormalizedInMemoryCache(
      dataIdFromObject: typenameDataIdFromObject,
    ),
        link: link,
      ),
    );

    return GraphQLProvider(
      child: HomePage(),
      client: client,
    );

    /*
    return Container(child: Text("testar") // Inga notifikationer för tillfället
        );
    */
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(

        //appBar: AppBar(title: Text("GraphQL Client")),
        child: Container(
      //Container(child: Text("hej"),),
      child: Query(
          options: QueryOptions(document: r"""
        query ReadData{
          faqs {
            Title
          }
        }
        """),
          builder: (QueryResult result,
              {VoidCallback refetch, FetchMore fetchMore}) {
            if (result.hasException) {
              return Text(result.exception.toString());
            }
            if (result.loading) {
              return Text('Loading');
            }

            if (result.data == null) {
              return Text("No Data Found!");
            }

            var repositories = result.data['faqs'][0]["Title"];
            return Text(repositories.toString());
          }),
    ));
  }
}
