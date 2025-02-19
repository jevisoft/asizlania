import 'package:asiz/pantallas/PantallaChecar.dart';
import 'package:flutter/material.dart';
import 'pantallas/principal.dart';
import 'pantallas/PantallaVincular.dart';
import 'pantallas/PantallaAsistencias.dart';
void main() => runApp(const MyApp());

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
