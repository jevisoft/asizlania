import 'package:flutter/material.dart';

class Mensajeshelper {

   static void muestraMensaje(BuildContext context,String mensaje){
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mensaje)));
   }

}