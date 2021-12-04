import 'package:flutter/material.dart';
import 'package:loginfinal/main.dart';

class InkWellDrawer extends StatelessWidget {
  @override
  Widget build (BuildContext ctxt) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                    Colors.lightBlue,
                    Colors.blue
                  ])
              ),
              child: Container(

                child: Column(

                  children: <Widget>[
                    Material(
                      borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                      elevation: 10,
                      child: Padding(padding: EdgeInsets.all(8.0),
                        child: Image.asset("imagenes/OPCION.png", height: 110, width: 110),
                      ),
                    ),
                    //const Text('ENCUENTRALO', style: TextStyle(color: Colors.white, fontSize: 25.0),),

                  ],

                ),
              ),
            margin: EdgeInsets.symmetric(vertical: 30),),

          const Text('Grupo de Programadores \n', textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blueGrey, fontSize: 25.0,),
          ),
          CustomListTile(Icons.person, 'Michael Ariel Huertas Pabon \n mikehuertas91@gmail.com', ()=>{}),
          CustomListTile(Icons.person, 'Andres Novoa \n andrenova1232@hotmail.com', ()=>{}),
          CustomListTile(Icons.person, 'Nelson Javier Leguizamón Bayona \n javierlby@yahoo.com', ()=>{}),
          CustomListTile(Icons.person, 'Andres Pacheco Fajardo \n andypsito@hotmail.com', ()=>{}),
          CustomListTile(Icons.person, 'Erica Paola Cardenas Cruz\n ecardenas@gmail.com', ()=>{}),
        ],

      ),
    );
  }
}

class CustomListTile extends StatelessWidget{

  final IconData icon;
  final  String text;
  final Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);
  @override
  Widget build(BuildContext context){
    //ToDO
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child:Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))
        ),
        child: InkWell(
            splashColor: Colors.orangeAccent,
            child: Container(
                height: 40,
                child: Row(
                  mainAxisAlignment : MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(children: <Widget>[
                      Icon(icon),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                      ),
                      Text(text, style: TextStyle(
                          fontSize: 16
                      ),),
                    ],),
                    Icon(Icons.arrow_right)
                  ],)
            ),
        ),
      ),
    );
  }
}