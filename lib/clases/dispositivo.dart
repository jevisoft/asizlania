class Dispositivo{
  int idDispositivo=0;
  String codigoVinculacion="";

  static Dispositivo fromJson(Map<String,dynamic> json){
      Dispositivo dispositivo=Dispositivo();
      dispositivo.idDispositivo=int.parse(json["id_dispositivo"].toString());
      dispositivo.codigoVinculacion=json["codigo_vinculacion"].toString();      
      return dispositivo;
  } 
}