import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:locationapp/utils/location.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImage;

  Future<void> _getCurrentUserLocotion() async {
    final location = await Location().getLocation();
    final map = LocationUtil.genarateLocationImage(
      latitude: location.latitude,
      longitude: location.longitude
    );

    setState(() {
      _previewImage = map;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            )
          ),
          child: _previewImage == null
          ? Text('Location not Found')
          : Image.network(
            _previewImage,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(
                onPressed: _getCurrentUserLocotion,
                icon: Icon(Icons.location_on),
                label: Text('Location'),
              textColor: Theme.of(context).primaryColor,
            ),
            FlatButton.icon(
              onPressed: (){},
              icon: Icon(Icons.map),
              label: Text('Select your Location'),
              textColor: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ],
    );
  }
}
