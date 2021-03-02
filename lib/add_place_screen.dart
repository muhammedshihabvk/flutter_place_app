import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_place_app/provider/great_places_provider.dart';
import 'package:flutter_place_app/widgets/image_input.dart';
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = "/AddPlaceScreen";

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {

  final textEditingController =  TextEditingController();
  File _pickedImage;

  void _selectedImage(File pickedImage){
    _pickedImage = pickedImage;
  }

  void _savePlace(){
    if(textEditingController.text.isEmpty || _pickedImage == null){
      return;
    }
    Provider.of<GreatPlacesProvider>(context,listen: false).addPlace(textEditingController.text,  _pickedImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Place"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("User Input"),
                  TextField(
                    decoration: InputDecoration(labelText: "Title",labelStyle: TextStyle(color: Theme.of(context).primaryColor)),
                    controller: textEditingController,
                  ),
                  SizedBox(height: 5,),
                  ImageInput(selectedImage: _selectedImage,),
                ],
              ),
            ),
          )),
          RaisedButton.icon(
              elevation: 0,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              color: Theme.of(context).accentColor,
              onPressed: _savePlace,
              icon: Icon(Icons.add),
              label: Text(
                "Add Place",
                textScaleFactor: 1.5,
              )),
        ],
      ),
    );
  }
}
