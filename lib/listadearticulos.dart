import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import'package:fluttertoast/fluttertoast.dart';
import 'package:loginfinal/main.dart';
import 'package:loginfinal/registrarclientes.dart';


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
  ListaCompra({required this.lista});
  @override
  _ListaCompraState createState() => _ListaCompraState();

}

class _ListaCompraState extends State<ListaCompra> {

  var total;
  CollectionReference datosventas = FirebaseFirestore.instance.collection(
      'ventas');
  final correo = TextEditingController();
  final direccion = TextEditingController();
  final celular = TextEditingController();
  var _counter = 0;


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

                        /*
                          ElevatedButton.icon(
                            label: Text("Ver precio de su compra",
                              textAlign: TextAlign.center,),
                            icon: Icon(Icons.shopping_cart,
                              size: 20,
                              color: Colors.orange,

                            ),
                            onPressed: () {
                              total = 0;
                              var tt;
                              for (int i = 0; i < widget.lista.length; i++) {
                                tt = int.parse(widget.lista[i][1]);
                                total = tt + total;
                                setState(() {
                                  _counter = widget.lista.length;
                                  print(_counter);
                                });

                                Fluttertoast.showToast(
                                    msg: "El valor de su compra es " +
                                        total.toString(),
                                    fontSize: 20,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.blueGrey,
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER
                                );
                              }
                            },

                          );
                        */
                      }
                  ),
                  Container(
                    child: ElevatedButton.icon(

                      label: Text('Confirmar su compra',
                        textAlign: TextAlign.center,),
                      icon: Icon(Icons.eleven_mp_outlined,
                        color: Colors.orange,),
                      onPressed: () {
                        total = 0;
                        var tt;
                        for (int i = 0; i < widget.lista.length; i++) {
                          tt = int.parse(widget.lista[i][1]);
                          total = tt + total;
                          print(total);

                          Fluttertoast.showToast(
                              msg: "El valor de su compra es " +
                                  total.toString(),
                              fontSize: 20,
                              backgroundColor: Colors.red,
                              textColor: Colors.blueGrey,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER
                          );
                          setState(() {
                            total;
                          });
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
                                    Container(
                                      child: TextField(
                                        controller: correo,
                                        decoration: InputDecoration(
                                          label: Text('Correo electronico'),
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                      height: 70,
                                      width: 200,
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
                                    Container(

                                      child: TextField(
                                        controller: celular,
                                        decoration: InputDecoration(
                                          label: Text('Numero de Celular'),
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
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  GestionCliente()),
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

                        List nuevalista = [];
                        for (int i = 0; i < widget.lista.length; i++) {
                          nuevalista.add(widget.lista[i][0]);
                        }
                        datosventas.doc().set({
                          'Producto': nuevalista,
                          'ValorCompra': total
                        });
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
