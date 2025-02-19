import 'package:flutter/material.dart';


class PantallaAsistencias extends StatelessWidget{
  const PantallaAsistencias({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
        icon: Icon(Icons.arrow_back, color: const Color.fromARGB(255, 229, 228, 228)),
        onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Asistencias'),        
        centerTitle: true,
        backgroundColor: Color.fromRGBO(156, 17, 140, 1),
        foregroundColor: Color.fromRGBO(255, 255, 255, 1),
        ),
      body:ListView(
  padding: const EdgeInsets.all(8),
  children: <Widget>[
    Container(
      height: 150,
      padding: EdgeInsets.all(10),
      color: Colors.purple[300],
      child: const Center(child: Text('01/01/2025 12:23'))      
    ),
    Container(
      height: 150,
      color: Colors.purple[200],
      child: const Center(child: Text('01/01/2025 12:23')),
    ),
    Container(
      height: 150,
      color: Colors.purple[100],
      child: const Center(child: Text('01/01/2025 12:23')),
    ),
  ],
),
      backgroundColor: Color.fromRGBO(0, 0, 0, 1)      
      
    );
    
  }

}