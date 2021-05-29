import 'package:location/location.dart';

Future<LocationData> getlocation() async {
  Location location = Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return _locationData = null;
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return _locationData = null;
    }
  }

  _locationData = await location.getLocation();
  // print('latitude : ' + _locationData.latitude.toString());
  // print('longitude : ' + _locationData.longitude.toString());

  return _locationData;
}
