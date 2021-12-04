import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loginfinal/categorianegocios.dart';
import 'package:loginfinal/clientes.dart';
import 'package:loginfinal/compraproductos.dart';
import 'package:loginfinal/consultarproductostienda.dart';
import 'dart:convert';
import 'package:loginfinal/detallenegocios.dart';
import 'package:loginfinal/main.dart';
import 'package:loginfinal/registrarclientes.dart';


class Negocios extends StatelessWidget {
  const Negocios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Negocios registrados'),
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
        body: (
            Consultanegocios()
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
                    MaterialPageRoute(builder: (context) => Categoria()),
                  );
                },
                label: Text('Categoria Tienda'),
                icon: Icon(Icons.add_circle_outline),

              ),
              SizedBox(height: 8,),
            ],
          )
      ),
    );
  }
}

class Consultanegocios extends StatefulWidget {
  const Consultanegocios({Key? key}) : super(key: key);

  @override
  _ConsultanegociosState createState() => _ConsultanegociosState();
}

class _ConsultanegociosState extends State<Consultanegocios> {

  final Stream<QuerySnapshot> consultar=FirebaseFirestore.instance.collection('negocios').snapshots();

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
                  title: Text(data['nombre']),
                  subtitle: Text(data['actividad']+'\n' +data['direccion']+'\n' +data['telefono']+'\n' +data['celular']),
                  leading: Image.network(data['imagen'], width: 60,height: 60,),
                  onTap: (){
                    Negocio neg=Negocio(data['actividad'], data['categoria'], data['celular'], data['codigo'], data['direccion'], data['geolocalizacion'], data['imagen'], data['nombre'], data['paginaweb'], data['telefono']);
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>Detallenegocios(negocio:neg)),
                      //MaterialPageRoute(builder: (context)=>Detallecliente(data['imagen'])),
                    );
                  },
                ),
              );
            }
            ).toList()
        );
      },
    );
  }
}

class Negocio{
  String actividad="";
  String categoria="";
  String celular="";
  String codigo="";
  String direccion="";
  String geolocalizacion="";
  String imagen="";
  String nombre="";
  String paginaweb="";
  String telefono="";

  Negocio(
      this.actividad,
      this.categoria,
      this.celular,
      this.codigo,
      this.direccion,
      this.geolocalizacion,
      this.imagen,
      this.nombre,
      this.paginaweb,
      this.telefono);
}


