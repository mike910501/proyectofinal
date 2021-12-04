import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loginfinal/clientes.dart';
import 'package:loginfinal/compraproductos.dart';
import 'package:loginfinal/consultarproductostienda.dart';
import 'dart:convert';

import 'package:loginfinal/main.dart';
import 'package:loginfinal/negocios.dart';
import 'package:loginfinal/registrarclientes.dart';


class Categoria extends StatefulWidget {
  const Categoria({Key? key}) : super(key: key);

  @override
  _CategoriaState createState() => _CategoriaState();
}

class _CategoriaState extends State<Categoria> {
  TextEditingController buscar=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Categoria del Negocio"),
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
                accountName: const Text('TIENDAS', style: TextStyle(color: Colors.black, fontSize: 20),),
                accountEmail: const Text('tienda@gmail.com', style: TextStyle(color: Colors.black, fontSize: 20,),),
                currentAccountPicture: Image.asset("imagenes/open.png",
                  //width: 200,height: 200,
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

        body: Center(
          child: SizedBox(
            width: 360,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: buscar,
                    onChanged: (value){
                      setState((){});
                    },
                    decoration: InputDecoration(
                      label:Text('Digite el tipo de negocio que busca'),
                    ),

                  ),
                ),
                Expanded(child: Consultanegocios(
                  tex:buscar.text,
                ))
              ],
            ),
          ),
        ),
      ),
    );

  }
}

class Consultanegocios extends StatelessWidget {
  final String tex;
  const Consultanegocios({Key? key, required this.tex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final Stream<QuerySnapshot>consulta=FirebaseFirestore.instance.collection("clientes").where("nombre",isEqualTo: tex).snapshots();
    final Stream<QuerySnapshot>consultar=FirebaseFirestore.instance.collection("negocios").where('categoria', isEqualTo: tex).snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: consultar,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('cargando...');
        }
        return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

              return Container(
                color: Color(0xD775A1F5),
                margin: EdgeInsets.only(top: 5),
                child: ListTile(
                  title: Text(data['nombre']),
                  subtitle: Text(data['actividad'] +
                      '\n' +
                      data['direccion'] +
                      '\n' +
                      data['telefono'] +
                      '\n' +
                      data['celular']),
                  leading: Image.network(
                    data['imagen'],
                    width: 60,
                    height: 60,
                  ),
                ),
              );
            }).toList());
      },
    );
  }
}