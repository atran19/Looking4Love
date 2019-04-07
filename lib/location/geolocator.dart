/*import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:geofire/geofire.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

Future<void> initPlatformState() async {
  String pathToReference = "Sites";

//Intializing geoFire
  Geofire.initialize(pathToReference);

  List<String> response;
// Platform messages may fail, so we use a try/catch PlatformException.
  try {
    response = await Geofire.queryAtLocation(30.730743, 76.774948, 5);
  } on PlatformException {
    response = 'Failed to get platform version.';
  }

// If the widget was removed from the tree while the asynchronous platform
// message was in flight, we want to discard the reply rather than calling
// setState to update our non-existent appearance.
  if (!mounted) return;

  setState(() {
    keysRetrieved = response;
  });
}

*/