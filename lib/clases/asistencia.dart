import 'package:asiz/clases/centro_trabajo.dart';
import 'package:asiz/clases/horario.dart';

class Asistencia{
  CentroTrabajo? centroTrabajo;
  String fechaHoraUTC='';
  String fechaHoraLocal='';
  bool sync=false;
  String fechaHoraUTCsync='';
  Horario? horario; 
  String idAsistencia='';

  static String getIdAsistencia(DateTime horaCheck,int idTrabajador, int idDispositivo){
         return "${horaCheck.year}${rellenaALaIzquierda(horaCheck.month)}${rellenaALaIzquierda(horaCheck.day)}${rellenaALaIzquierda(horaCheck.hour)}${rellenaALaIzquierda(horaCheck.minute)}${rellenaALaIzquierda(horaCheck.second)}_${idTrabajador}_$idDispositivo";
         
  }

  static String rellenaALaIzquierda(int numero){
    if(numero<10) return "0$numero";
    return numero.toString();
  }

  

}