import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

class InfoDispositivoHelper  {
   static Future<InformacionDispositivo> getInfo() async{
   InformacionDispositivo info=InformacionDispositivo();
   info.id="Desconocido";
   info.sistemaOperativo="";
   info.modelo="";
    
   DeviceInfoPlugin deviceInfo=DeviceInfoPlugin();
     
     if(Platform.isAndroid){
         AndroidDeviceInfo androidInfo=await deviceInfo.androidInfo;
         info.sistemaOperativo="android";
         info.id=androidInfo.id;
         info.modelo="${androidInfo.manufacturer} ${androidInfo.model}";   
     }

     if(Platform.isIOS){
        IosDeviceInfo iosInfo=await deviceInfo.iosInfo;
        info.sistemaOperativo="ios";
         info.id=iosInfo.identifierForVendor.toString();
         info.modelo=iosInfo.modelName;
     }   
     

    return info;
   }

}

class InformacionDispositivo{
   String id="";
   String sistemaOperativo="";
   String modelo="";

}