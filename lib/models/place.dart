import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:locationapp/models/location.dart';

class Place {
  final String id;
  final String title;
  final Location location;
  final File image;

  Place({
    @required this.id,
    @required this.title,
    @required this.location,
    @required this.image,
  });
}
