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

}