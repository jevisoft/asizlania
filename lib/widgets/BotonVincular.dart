import 'package:flutter/material.dart';

class BotonVincular extends StatelessWidget{
   final Function()? onClick;

  const BotonVincular({super.key,required this.onClick });

  @override
  Widget build(BuildContext context) {
    return  Container( width: 250, 
                  height: 70,                  
                  child:TextButton(onPressed: onClick,                
                style: TextButton.styleFrom(
                 backgroundColor:  Color.fromRGBO(234, 125, 216, 1),
                 foregroundColor: Color.fromRGBO(79, 5, 59, 1)                 
                ),
                child:  Text('Vincular',
                  style: TextStyle( fontSize: 18),)
                ) ,
                );
    
  }
}