import 'dart:io';

import 'package:flutter/material.dart';
import 'package:locationapp/providers/places.dart';
import 'package:locationapp/widgets/image_input.dart';
import 'package:locationapp/widgets/location_input.dart';
import 'package:provider/provider.dart';

class PlaceForm extends StatefulWidget {
  @override
  _PlaceFormState createState() => _PlaceFormState();
}

class _PlaceFormState extends State<PlaceForm> {

  final _titleController = TextEditingController();
  File _pickedImage;

  void _selectImage(File pickedImage){
    _pickedImage = pickedImage;
  }

  void _submit(){
    if(_titleController.text.isEmpty || _pickedImage == null){
      return;
    }
    Provider.of<Places>(context, listen: false).addPlace(_titleController.text, _pickedImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Title',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ImageInput(
                    this._selectImage
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  LocationInput(

                  ),
                ],
              ),
            ),
          ),
          RaisedButton.icon(
            icon: Icon(Icons.add),
            label: Text('Add'),
            color: Theme.of(context).accentColor,
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: _submit,
          ),
        ],
      ),
    );
  }
}
