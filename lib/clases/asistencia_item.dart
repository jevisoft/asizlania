import 'dart:convert';

import 'package:asiz/api/ApiCas.dart';
import 'package:asiz/api/ApiCasHelper.dart';
import 'package:asiz/api/ApiHelperTest.dart';
import 'package:asiz/clases/trabajador.dart';

class AsistenciaItem {


  String fecha="";
  String registros="";
  String estatus="";
  String sucursal="";
  

  static Future<List<AsistenciaItem>> getAsistenciasUltimos30Dias(Trabajador trabajador) async{
     List<AsistenciaItem> lista=[];
     DateTime ahora=DateTime.now();
     String del=ahora.toLocal().subtract(Duration(days: 30)).toString().substring(0,10);
     String al=ahora.toLocal().toString().substring(0,10);

     var respuesta= await ApiCas.asistencias(Apicashelper.getConsultaAsistenciasDTO(del,al, trabajador));
     if(respuesta.statusCode!=200){
      print("Error al obtener lista ${respuesta.statusCode}");
      return lista;
     }
     print("Se obtuvo respuesta");
     Map<String,dynamic> json=jsonDecode(respuesta.body);
    // Map<String,dynamic> json=jsonDecode(Apihelpertest.getRespuestaAsistencias());

     List<dynamic> asistenciasJson=json["asistencias"] as List<dynamic>;

     asistenciasJson.forEach((asistenciaJson){
          AsistenciaItem asistenciaItem=AsistenciaItem();
          asistenciaItem.fecha=asistenciaJson["fecha"].toString();
          asistenciaItem.registros=asistenciaJson["registros"].toString();
          asistenciaItem.estatus=asistenciaJson["estatus"].toString();
          asistenciaItem.sucursal=asistenciaJson["sucursal"].toString();
          lista.add(asistenciaItem);
     });



     return lista;
  }
}