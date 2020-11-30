import 'dart:async';

import 'package:geocoder/geocoder.dart';
import 'package:geocoder/services/base.dart';

Future<Coordinates> searchCoordinates(String name) async {
  try {
    var geocoding = Geocoder.local;
    var results = await geocoding.findAddressesFromQuery(name);
    return results.first.coordinates;
  } catch (e) {
    print("Error occured: $e");
  } 
}
