import 'dart:convert';

import 'package:asiz/clases/trabajador.dart';
import 'package:asiz/helpers/InfoDispositivo.dart';

class Apicashelper {
    
    static String getVincularDTO(InformacionDispositivo info_dispositivo, String codigo_vinculacion){
       Map<String,String> data={
    "codigo":codigo_vinculacion,
    "descripcion":info_dispositivo.modelo,
    "sistema":info_dispositivo.sistemaOperativo,
    "identificador":info_dispositivo.id
   };
     return jsonEncode(data);
    }


    static String getConsultaAsistenciasDTO(String del, String al, Trabajador trabajador){
Map<String,String> data={
    "del":del,
    "al":al,
    "id_empleado":trabajador.idEmpleado.toString()
   };
     return jsonEncode(data);
    }

    

    static String getErrorBody(String body){
      if(body.length<100) return body;
      return body.substring(0,99);
    }

}