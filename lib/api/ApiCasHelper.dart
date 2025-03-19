import 'dart:convert';

import 'package:asiz/clases/asistencia.dart';
import 'package:asiz/clases/dispositivo.dart';
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

    static String getDTOAsistencias(List<Asistencia> asistencias,Trabajador trabajador,Dispositivo dispositivo){
     String cad="";
    
     asistencias.forEach((asistencia){
          cad+="(${asistencia.centroTrabajo?.idSucursal},'${asistencia.fechaHoraUTC}',${trabajador.idEmpleado},${asistencia.horario?.idHorario},'${asistencia.idAsistencia}',${asistencia.centroTrabajo?.idCentro},${dispositivo.idDispositivo}),";
     });
     cad=cad.substring(0,cad.length-1);

      Map<String,String> data={
        "checos":cad
      };

     return jsonEncode(data);
    }

}