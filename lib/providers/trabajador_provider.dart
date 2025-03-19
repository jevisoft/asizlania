import 'dart:ffi';

import 'package:asiz/api/ApiCas.dart';
import 'package:asiz/api/ApiCasHelper.dart';
import 'package:asiz/clases/asistencia.dart';
import 'package:asiz/clases/dispositivo.dart';
import 'package:asiz/clases/trabajador.dart';
import 'package:asiz/data/BaseDatosControlador.dart';
import 'package:flutter/material.dart';

class TrabajadorProvider with ChangeNotifier{

  TrabajadorProvider(Trabajador? trabajador,Dispositivo? dispositivo){

      if(trabajador!=null) _trabajador=trabajador;
      if(dispositivo!=null) _dispositivo=dispositivo;
  }

  Trabajador _trabajador=Trabajador();
  Dispositivo _dispositivo=Dispositivo();
  bool _sincronizado=true;

  Trabajador get trabajador=>_trabajador;
  Dispositivo get dispositivo=>_dispositivo;
  bool get sincronizado=>_sincronizado; 

  void setTrabajador(Trabajador trabajadorX, Dispositivo dispositivoX){
     _trabajador=trabajadorX;
     _dispositivo=dispositivoX;
     notifyListeners();
  }

  void limpiar(){
      _trabajador=Trabajador();
      _dispositivo=Dispositivo();
      notifyListeners();
  }

  Future <void> sincronizaAsistencias() async{
    _sincronizado=true;
  if(_trabajador.nombre==''){      
      return;}
  List<Asistencia> asistenciasPendiente=await BaseDatosControlador.getAsistenciasNoSync();
    if(asistenciasPendiente.isEmpty){     
      return;
    } 
    var respuesta=await ApiCas.checa(Apicashelper.getDTOAsistencias(asistenciasPendiente, _trabajador, _dispositivo));
    if(respuesta.statusCode!=200){
      _sincronizado=false;        
      return;
    }    
    await BaseDatosControlador.borraAsistencias(asistenciasPendiente);
    
  }


}