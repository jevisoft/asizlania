class Apihelpertest {

   static String getRespuestaDatosTrabajador(){
      return '''
               {
                 "id_empleado":"1",
                 "nombre":"1",
                 "ap":"1",
                 "am":"1",
                 "fecha_nac":"1",
                 "id_foto":"1",
                 "id_empresa":"1",
                 "empresa":"1",
                 "puesto":"1",
                 "id_horario":"1",
                 "horario_desc":"sass",
                 "hora_entrada":"09:00",
                 "id_dispositivo":"1",
                 "codigo_vinculacion":"728127812",
                 "centros_trabajo":[]

               } 
              ''';

   }

   static String getRespuestaAsistencias(){
return '''
               {
                 "asistencias":[
                   {"fecha":"2025-01-01","registros":"08:00:12 - 12:12:10","estatus":"ok","horas":"6","sucursal":"Mendoza"},
                   {"fecha":"2025-01-02","registros":"08:12:54 - 18:12:10","estatus":"ok","horas":"10","sucursal":"Mendoza"}
                 ]
               } 
              ''';

   }

}