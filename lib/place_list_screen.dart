import 'package:flutter/material.dart';
import 'package:flutter_place_app/add_place_screen.dart';
import 'package:flutter_place_app/provider/great_places_provider.dart';
import 'package:provider/provider.dart';

class PlaceListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your places"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          )
        ],
      ),
      body: Consumer<GreatPlacesProvider>(
        child: Center(
          child: Text("No places Yet Loaded"),
        ),
        builder: (context, greatPlace, child) => greatPlace.Items.length <= 0
            ? child
            : ListView.builder(
                itemCount: greatPlace.Items.length,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(backgroundImage: FileImage(greatPlace.Items[index].image),),
                  title: Text(
                    greatPlace.Items[index].title,
                  ),
                  onTap: () {
                    //todo got to details page
                  },
                ),
              ),
      ),
    );
  }
}
