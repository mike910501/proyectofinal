import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import'package:fluttertoast/fluttertoast.dart';
import 'package:loginfinal/main.dart';
import 'package:loginfinal/registrarclientes.dart';
import 'package:loginfinal/validadorregistro.dart';


class MostrarCarrito extends StatelessWidget {
  List lista=[];
  MostrarCarrito({required this.lista});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListaCompra(
          lista:[]
      ),

    );
  }
}
class ListaCompra extends StatefulWidget {

  final tt=0;
  List lista=[];
  List listaNom=[];
  ListaCompra({required this.lista});
  @override
  _ListaCompraState createState() => _ListaCompraState();
}
class _ListaCompraState extends State<ListaCompra> {
  String nom='';
  var total;
  List transi=[];
  CollectionReference datosventas = FirebaseFirestore.instance.collection('ventas');
  final celular = TextEditingController();
  var _counter = 0;
  @override
  void initState() {
    super.initState();
  }
void GetUsers()async{
  final correo = TextEditingController();
  final direccion = TextEditingController();
    List Nom=[];
    List Borrable=[];
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('clientes');
  CollectionReference datoscliente = FirebaseFirestore .instance.collection ( 'clientes' );
    QuerySnapshot users = await collectionReference.get();
              if(users.docs.length!=0){
                for(var doc in users.docs){
                  Nom.add(doc.data());
                }
              }
    showDialog(context: context, builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40)),
        elevation: 300,
        backgroundColor: Colors.white,
        child: Container(
          height: 400,
          child: Column(
            children: [
              Container(
                child:
                Container(
                  child: Text('Finaliza tu compra',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  margin: EdgeInsets.all(25),
                ),
              ),
              Builder(
                  builder: (context) {
                    return Container(
                      child: TextField(
                        controller: correo,
                        decoration: InputDecoration(
                          label: Text('Correo electronico'),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      height: 70,
                      width: 200,
                    );
                  }
                  ),
              Container(
                child: TextField(
                  controller: direccion,
                  decoration: InputDecoration(
                    label: Text('Dirección de Entrega'),
                    border: OutlineInputBorder(),
                  ),
                ),
                width: 200,
                height: 70,
              ),
              FloatingActionButton.extended(
                //label: const T
                backgroundColor: Colors.amber,
                onPressed: () {
                  for(var doc in users.docs){
                    Map<String, dynamic> data=doc.data()!as Map<String, dynamic>;
                    Borrable.add(data['nombre']);
                    if(correo.text==''||direccion.text==''){
                      Fluttertoast.showToast(
                        msg: 'Debe inhgresar todos los valores',
                        fontSize: 20,
                        backgroundColor: Colors.amber,
                        textColor: Colors.blueGrey,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,);}
                    for (var i in Borrable){
                      if(i==correo.text && direccion.text!=''){
                        Fluttertoast.showToast(
                            msg: "Su pedido ha sido registrado exitosamente" + "\n" + "Será enviado a la dirección: " + direccion.text,
                            fontSize: 20,
                            backgroundColor: Colors.amber,
                            textColor: Colors.blueGrey,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,);
                        datosventas.doc().set({
                          'Producto': widget.lista,
                          'ValorCompra': total,
                        });
                      }
                    }
                  }
                  print(Borrable.length);

                    for(var j in Borrable){
                      if(correo.text!=j){
                        transi.add(j);
                        print(transi.length);
                        }
                    }
                    if(Borrable.length==transi.length){
                      Fluttertoast.showToast(
                        msg: "Usted y Su pedido han sido registrado exitosamente" + "\n" + "Será enviado a la dirección: " + direccion.text,
                        fontSize: 20,
                        backgroundColor: Colors.amber,
                        textColor: Colors.blueGrey,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                      );
                      datoscliente.doc().set({
                        "nombre": correo.text,
                        "direccion": direccion.text,
                      });
                    }
                  correo.clear();
                  direccion.clear();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Hometiendas()),
                  );
                },
                label: Row(
                  children: [
                    Container(
                      child: Text(
                          'Buy ' + total.toString()),
                    ),
                    Container(
                      width: 40,
                      child: Icon(Icons.shopping_cart),
                    ),
                    Container(

                      child: Text('$_counter'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Row(
          children: [
            Container(
                width: 140,
                child: Text('Tu lista', style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold, fontSize: 25),)
            ),
            Container(
              width: 20,
              child: Icon(Icons.attach_money, color: Colors.black, size: 30,),
            ),
            Builder(
              builder: (context) {
                if(widget.lista.length==0){
                  total=0;
                }
                return Container(
                  child: Text('$total', style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold, fontSize: 30),),
                );
              }
            ),
          ],
        ),
      ),
      body: Column(
          children: [
            Expanded(
              child: ListView.builder(itemCount: widget.lista.length,
                itemBuilder: (BuildContext context, i) {
                  final item = widget.lista[i][0];

                  return Dismissible(
                    //movementDuration: Duration(milliseconds: 100),
                    key: UniqueKey(),
                    child: ListTile(
                      title: Text(
                          widget.lista[i][0] + "  " + widget.lista[i][1]),
                      //subtitle: Text(widget.lista[i][1]),
                    ),
                    background: Container(
                      color: Colors.amber,
                    ),
                    onDismissed: (DismissDirection direccion) {
                      setState(() {
                        widget.lista.removeAt(i);
                      });
                    },
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.amber,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Builder(
                      builder: (context) {
                        total = 0;
                        var tt;
                        for(int i = 0; i < widget.lista.length; i++){
                          tt = int.parse(widget.lista[i][1]);
                          total = tt + total;
                          print(total);
                        }
                        return Container(
                          child: Text(''),
                        );
                      }
                  ),
                  Container(
                    child: ElevatedButton.icon(

                      label: Text('Confirmar su compra',
                        textAlign: TextAlign.center,),
                      icon: Icon(Icons.eleven_mp_outlined,
                        color: Colors.orange,),
                      onPressed: () {
                        GetUsers();
                        total = 0;
                        var tt;
                        for (int i = 0; i < widget.lista.length; i++) {
                          tt = int.parse(widget.lista[i][1]);
                          _counter=widget.lista.length;
                          total = tt + total;
                          print(total);

                          Fluttertoast.showToast(
                              msg: "El valor de su compra es " +
                                  total.toString(),
                              fontSize: 20,
                              backgroundColor: Colors.amber,
                              textColor: Colors.blueGrey,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER
                          );
                          setState(() {
                            total;
                            _counter;
                          });
                        }

                      },
                    ),
                  ),

                ],
              ),
            )
          ]
      ),
    );
  }
}
