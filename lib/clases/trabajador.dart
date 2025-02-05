import 'centro_trabajo.dart';
import 'horario.dart';

class Trabajador{
  int idEmpleado=0;
  String nombre='';
  String apellidoPaterno='';
  String apellidoMaterno='';
  String fechaNacimiento='';
  int idFoto=0;
  int idEmpresa=0;
  String empresa='';
  String puesto='';
  Horario? horario;    
  List<CentroTrabajo>? centrosDeTrabajo;

  CentroTrabajo? getCentroTrabajoPrincipal(){
        return centrosDeTrabajo?.firstWhere((CentroTrabajo ct)=>ct.esPrincipal);
  } 

}