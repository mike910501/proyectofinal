import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loginfinal/negocios.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/*
class Detallenegocios extends StatefulWidget {
  final Negocio negocio;

  Detallenegocios({required this.negocio});

  @override
  _DetallenegociosState createState() => _DetallenegociosState();
}

class _DetallenegociosState extends State<Detallenegocios> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: Text(widget.negocio.paginaweb),
        ),
        body: Container(
          color: Color(0xFF630000),
          padding: EdgeInsets.all(20),
          //margin: EdgeInsets.all(20),
          height: 300,
          //width: 650,
            child: Card(
              elevation: 10,
              //shadowColor: Colors.lightGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Color(0xFFD8B6A4),

                child: Column(
                  children: [
                    Image.network(widget.negocio.imagen,width: 100,height: 100, alignment: Alignment.topRight,),
                    //Image.network(widget.dato,width: 200,height: 200,)
                    Text(widget.negocio.nombre,
                        style: const TextStyle(fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF000000),
                        ),
                    ),

                    Container(

                      padding: EdgeInsets.only(top:0),
                      alignment: Alignment.center,
                      child: ElevatedButton.icon(
                        label: const Text("Ir pagina WEB",
                          textAlign: TextAlign.center,),
                        icon: const Icon(Icons.eleven_mp_outlined,
                            size:30,
                            color: Colors.red),
                        onPressed: () async{
                          if(await canLaunch(widget.negocio.paginaweb)){
                            await launch(widget.negocio.paginaweb);
                          }

                        },
                      ),
                    ),

                  ],
                ),

            ),

        ),
      ),
    );
  }
}

 */

class Detallenegocios extends StatefulWidget {
  final Negocio negocio;


  Detallenegocios({required this.negocio});

  @override
  _DetallenegociosState createState() => _DetallenegociosState();
}

class _DetallenegociosState extends State<Detallenegocios> {
  final Stream<QuerySnapshot> consultar=FirebaseFirestore.instance.collection('productos').snapshots();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Container(
                  child: Image.network(widget.negocio.imagen, width: 45,),
              ),
              Container(
                child: Text(widget.negocio.nombre, style: TextStyle(fontSize: 35),),
              )
            ],
          ),
                  
        ),
        body: Column(
          children: [
            Text(widget.negocio.categoria),
            Container(
            height: 70,

              child: Text(widget.negocio.paginaweb,),
            ),
          ],

        ),
      ),
    );

  }
}
