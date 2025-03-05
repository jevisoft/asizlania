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

    /* var respuesta= await ApiCas.asistencias(Apicashelper.getConsultaAsistenciasDTO(del,al, trabajador));
     if(respuesta.statusCode!=200){
      return lista;
     }
     Map<String,dynamic> json=jsonDecode(respuesta.body);*/
     Map<String,dynamic> json=jsonDecode(Apihelpertest.getRespuestaAsistencias());

     List<dynamic> asistencias_json=json["asistencias"] as List<dynamic>;

     asistencias_json.forEach((asistencia_json){
          AsistenciaItem asistencia_item=AsistenciaItem();
          asistencia_item.fecha=asistencia_json["fecha"].toString();
          asistencia_item.registros=asistencia_json["registros"].toString();
          asistencia_item.estatus=asistencia_json["estatus"].toString();
          asistencia_item.sucursal=asistencia_json["sucursal"].toString();
          lista.add(asistencia_item);
     });



     return lista;
  }
}