import 'package:asiz/clases/trabajador.dart';
import 'package:asiz/data/BaseDatosControlador.dart';
import 'package:asiz/pantallas/PantallaChecar.dart';
import 'package:asiz/providers/trabajador_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pantallas/principal.dart';
import 'pantallas/PantallaVincular.dart';
import 'pantallas/PantallaAsistencias.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
void main() async{
  await dotenv.load(fileName: '.env');
  Trabajador? trabajador=await BaseDatosControlador.getTrabajador();
  runApp(ChangeNotifierProvider(create: (_)=> TrabajadorProvider(trabajador),
   child:const MyApp(),));
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AsiZ',      
      initialRoute: '/',
      routes:{
        '/':(context)=>PantallaPrincipal(),
        '/asistencias':(context)=>PantallaAsistencias(),
        '/checar':(context)=>PantallaChecar(),
        '/vincular':(context)=>PantallaVincular()
      }
    );
  }
}
