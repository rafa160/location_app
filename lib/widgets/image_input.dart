import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;


class ImageInput extends StatefulWidget {

  final Function onSelectImage;

  ImageInput(this.onSelectImage);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

  _takePic() async {
    final ImagePicker _picker = ImagePicker();
    PickedFile image = await _picker.getImage(source: ImageSource.camera,
      maxWidth: 600,
    );

    if(image == null) return;

    setState(() {
      _storedImage = File(image.path);
    });

    //method to put the image
    final dir = await syspaths.getApplicationDocumentsDirectory();
    // used to get the image name
    String file = path.basename(_storedImage.path);
    //used to save the image
    final savedImage = await _storedImage.copy('${dir.path}/$file');

    widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 180,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1,color: Colors.grey)
          ),
          alignment: Alignment.center,
          child: _storedImage != null ?
            Image.file(
              _storedImage,
              width: double.infinity,
              fit: BoxFit.cover,
            )
          : Text('No image'),
        ),
        SizedBox(width: 10,),
        Expanded(
          child: FlatButton.icon(
            icon: Icon(Icons.camera_enhance),
            label: Text('Take a Pic'),
            textColor: Theme.of(context).primaryColor,
            onPressed: _takePic,
          ),
        ),
      ],
    );
  }
}
