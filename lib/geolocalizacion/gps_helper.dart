import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class GpsHelper {
  static Future<bool> obtenPermisosGPS() async{
     LocationPermission permisosGPS=await Geolocator.checkPermission();
    if(permisosGPS==LocationPermission.denied||permisosGPS==LocationPermission.deniedForever){
      permisosGPS=await Geolocator.requestPermission();
      if(permisosGPS==LocationPermission.denied){        
        return false;    
      }
    }
    return true;
  }

  static LocationSettings _getLocationSettings(){
    if(defaultTargetPlatform==TargetPlatform.android){
        return AndroidSettings(accuracy: LocationAccuracy.high);
    }
    return AppleSettings(accuracy: LocationAccuracy.high);
  }


   static Future<Position> getPosicionActual() async{
       return await Geolocator.getCurrentPosition(locationSettings:_getLocationSettings());
   }

   static distancia(Position posicionInicial, double latitudFinal, double longitudFinal ){
     return Geolocator.distanceBetween(posicionInicial.latitude, posicionInicial.longitude, latitudFinal, longitudFinal);
   }


}