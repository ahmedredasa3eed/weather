import 'package:geolocator/geolocator.dart';

class LocationService{

  double lat;
  double lon;


    Future getCurrentLocation() async {
    try{
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      lat = position.latitude;
      lon = position.longitude;
    } catch(e){
     print(e);
    }

  }
}