import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_mobile/screens/calculator.dart';
import 'package:project_mobile/screens/homepage.dart';

import '../screens/galerycourse.dart';

class MenuDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
            children: [
              ListTile(
                  title: Text("Home"),
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder:(context) => HomePage() ));
                  }
              ),
              ListTile(
                  title: Text("Calculadora"),
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder:(context) => CalculadoraPage() ));
                  }
              ),ListTile(
                  title: Text("Cursos"),
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder:(context) => CursosPage() ));
                  }
              ),
            ]
        )
    );
  }
}