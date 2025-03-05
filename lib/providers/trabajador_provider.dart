import 'package:asiz/clases/trabajador.dart';
import 'package:flutter/material.dart';

class TrabajadorProvider with ChangeNotifier{

  TrabajadorProvider(Trabajador? trabajador){
      if(trabajador!=null){
        _trabajador=trabajador;
      }
  }

  Trabajador _trabajador=Trabajador();

  Trabajador get trabajador=>_trabajador;

  void setTrabajador(Trabajador trabajador_x){
     _trabajador=trabajador_x;
     notifyListeners();
  }

  void limpiar(){
      _trabajador=Trabajador();
      notifyListeners();
  }


}