import 'package:url_launcher/url_launcher.dart';

class MapUtils{
  MapUtils._();
  static Future<void> openMap(double latitude,double longitude)async{
    String googleMapurl="https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";


    if(await canLaunch(googleMapurl)){
      await launch(googleMapurl);
    }
    else{
      print(googleMapurl);
      throw 'could not open the map';
    }
  }
}