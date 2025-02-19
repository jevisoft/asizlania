import 'package:flutter/material.dart';

class BotonCheckIn extends StatelessWidget{
  const BotonCheckIn({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container( width: 270, 
                  height: 100,
                  child:TextButton(onPressed: (){},                
                style: TextButton.styleFrom(
                 backgroundColor:  Color.fromRGBO(234, 125, 216, 1),
                 foregroundColor: Color.fromRGBO(79, 5, 59, 1)
                 
                ),
                child:  Text('Checar',style: TextStyle( fontSize: 18))
                ) ,
                );
    
  }
}