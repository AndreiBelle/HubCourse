import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Elevatebuttoncomponent extends StatelessWidget{
  final String label;
  final VoidCallback onPressed;
  final Color cor;
  final Color corTexto;

  //Contrutor
  Elevatebuttoncomponent({
    required this.label,
    required this.onPressed,
    required this.cor,
    this.corTexto = Colors.black,
  });


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: cor,
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: corTexto,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

}