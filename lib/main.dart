import 'package:flutter/material.dart';
import 'package:flutter_place_app/add_place_screen.dart';
import 'package:provider/provider.dart';


import 'place_list_screen.dart';
import 'provider/great_places_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlacesProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primaryColor: Colors.indigo,
        accentColor: Colors.amber),
        home: PlaceListScreen(),
        routes: {
          AddPlaceScreen.routeName: (ctx) => AddPlaceScreen(),
        },
      ),
    );
  }
}

