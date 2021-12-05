
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loginfinal/listadearticulos.dart';
import 'package:loginfinal/registrarclientes.dart';


class mostrarValidador extends StatelessWidget {
  var nom;
  List lista=[];
  mostrarValidador({required this.lista, this.nom});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}


class Validador extends StatefulWidget {
  var nom;
  List lista=[];
  Validador({required this.lista, this.nom,});

  @override
  _ValidadorState createState() => _ValidadorState();
}

class _ValidadorState extends State<Validador> {
  final Stream<QuerySnapshot> consultar=FirebaseFirestore.instance.collection('clientes').snapshots();
  int pass = 0;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
          stream: consultar,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(snapshot.hasError){
              return Text('Error');
            }
            if(snapshot.connectionState==ConnectionState.waiting){
              return Text('cargando...');
            }
            return Column(
                children: snapshot.data!.docs.map((DocumentSnapshot document){
                  Map<String,dynamic> data = document.data()! as Map<String,dynamic>;
                  return Container(
                        child: Builder(
                          builder: (context) {
                            //print(widget.lista);
                            //print(widget.nom);
                            //print(data['nombre']);
                            List nuevalista = [];
                            //print(widget.nom+'ooooooooooooooooooooooooooooooo');
                            nuevalista.add(data['nombre']);

                            for(var f in nuevalista){
                              if(f==widget.nom){
                                print('ok');
                              }else{
                                print('no');
                              }
                            }

                            return Container();
                          }
                        ),
                      );

                }).toList()


            );

          },

        );

  }

}

