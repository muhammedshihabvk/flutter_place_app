import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {

  final Function selectedImage;

  ImageInput({this.selectedImage});

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput>  {
  File _storedImage;

 Future<void> _takePicture() async {
    final imageFile  = await ImagePicker().getImage(source: ImageSource.camera,maxWidth: 600);
    if(imageFile == null){
      return;
    }
    setState(() {
      _storedImage = File(imageFile.path);
    });

    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(_storedImage.path);
    print("=================="+fileName);
   final savedImage = await _storedImage.copy("${appDir.path}/$fileName");
   print("*************************${savedImage.path}");
   widget.selectedImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          alignment: Alignment.center,
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text(
                  "No Image Taken",
                  textAlign: TextAlign.center,
                ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: FlatButton.icon(
            icon: Icon(
              Icons.camera_alt,
              size: 30,
            ),
            label: Text("Add Image"),
            textColor: Theme.of(context).accentColor,
            onPressed: _takePicture,
          ),
        )
      ],
    );
  }
}
