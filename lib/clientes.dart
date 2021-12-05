import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loginfinal/categorianegocios.dart';
import 'package:loginfinal/compraproductos.dart';
import 'package:loginfinal/consultarproductostienda.dart';
import 'package:loginfinal/main.dart';
import 'package:loginfinal/negocios.dart';
import 'dart:convert';

import 'package:loginfinal/registrarclientes.dart';

class ClientesTienda extends StatelessWidget {
  const ClientesTienda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Clientes registrados en la APP'),
        ),

        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.white],
                    end: Alignment.bottomCenter,
                  ),
                ),
                accountName: const Text('ENCUENTRALO', style: TextStyle(color: Colors.black, fontSize: 20),),
                accountEmail: const Text('encuentralo@gmail.com', style: TextStyle(color: Colors.black, fontSize: 20,),),
                currentAccountPicture: Image.asset("imagenes/OPCION.png",
                  //width: 500,height: 500,
                  //alignment: Alignment.topCenter,
                ),
              ),
              ListTile(
                title: Text('Home'),
                leading: Image.asset("imagenes/home.png", ),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>MyApp()));
                },
              ),
              ListTile(
                title: Text('Gestion Clientes'),
                leading: Image.asset("imagenes/clientes.png", ),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>ClientesTienda()));
                },
              ),
              ListTile(
                title: Text('Registrar Cliente'),
                leading: Image.asset("imagenes/cliente.png"),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>GestionCliente()));
                },
              ),

              ListTile(
                title: Text('Gestion Negocios'),
                leading: Image.asset("imagenes/negocios.png"),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>Negocios()));
                },
              ),

              ListTile(
                title: Text('Productos en Tienda'),
                leading: Image.asset("imagenes/estante.png"),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>productostienda()));
                },
              ),
              ListTile(
                title: Text('Getion Compras'),
                leading: Image.asset("imagenes/carrito.png"),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>Compras()));
                },
              ),
              ListTile(
                title: Text('Categoria Tiendas'),
                leading: Image.asset("imagenes/categoria.png"),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>Categoria()));
                },
              ),
            ],

          ),
        ),
        body: (
            Consultacliente()
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton.extended(
              //label: const T
              backgroundColor: Colors.pink,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GestionCliente()),
                );
              },
              label: Text('Registrar Clientes'),
              icon: Icon(Icons.add_circle_outline),

            ),
            SizedBox(height: 8,),
          ],
        ),
      ),

    );
  }
}

class Consultacliente extends StatefulWidget {
  const Consultacliente({Key? key}) : super(key: key);

  @override
  _ConsultaclienteState createState() => _ConsultaclienteState();
}

class _ConsultaclienteState extends State<Consultacliente> {

  final Stream<QuerySnapshot> consultar=FirebaseFirestore.instance.collection('clientes').snapshots();
 var pru='mike';
  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
      stream: consultar,
      builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasError){
          return Text('Error');
        }
        if(snapshot.connectionState==ConnectionState.waiting){
          return Text('cargando...');
        }



        return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document){
              Map<String,dynamic> data = document.data()! as Map<String,dynamic>;
              return Container(
                color: Color(0xD775A1F5),
                margin: EdgeInsets.only(top: 5),
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: 33,
                    backgroundColor: Colors.blue,
                    child: CircleAvatar(
                      radius: 27,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        child: Icon(
                          Icons.android_rounded,
                          color: Colors.white,
                          size: 35,

                        ),
                        radius: 23.0,
                        //backgroundImage:
                        //NetworkImage('https://www.woolha.com/media/2020/03/eevee.png'),
                        //backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),

                  title: Text(data['nombre']),
                  subtitle: Text(data['direccion']+'\n' +data['telefono']+'\n' +data['celular'],
                  ),
                ),

              );
            }).toList()
        );

      },

    );

  }
}

