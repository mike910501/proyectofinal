import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loginfinal/categorianegocios.dart';
import 'package:loginfinal/clientes.dart';
import 'package:loginfinal/consultarproductostienda.dart';
import 'package:loginfinal/listadearticulos.dart';
import 'package:loginfinal/main.dart';
import 'package:loginfinal/negocios.dart';
import 'package:loginfinal/registrarclientes.dart';

class Validador extends StatefulWidget {
  final String textdato;
  const Validador({Key? key, required this.textdato}) : super(key: key);

  @override
  _ValidadorState createState() => _ValidadorState();
}

class _ValidadorState extends State<Validador> {
  final List lista=[];
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> consultar=FirebaseFirestore.instance.collection('nombre').where('clientes', isEqualTo: widget.textdato).snapshots();
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(bottom: 5),
            color: Colors.white,
            child: StreamBuilder<QuerySnapshot>(
              stream: consultar,
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
                if(!snapshot.hasData){
                  return Center(child: CircularProgressIndicator(),);
                }
                return ListView(
                    children: snapshot.data!.docs.map((DocumentSnapshot document){
                      Map<String, dynamic> data=document.data()!as Map<String, dynamic>;
                      return Builder(
                        builder: (context) {
                          for(){

                          }
                          return Column(
                              children:[
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  height: 100,

                                  child: ListTile(
                                    title: Text(data['nombre'],),
                                    onTap: (){
                                      lista.add([data['nombre']]);
                                    },
                                  ),
                                ),
                              ]
                          );
                        }
                      );
                    }
                    ).toList()
                );
              },
            ),
          ),
        ),


      ],
    );
  }
}
