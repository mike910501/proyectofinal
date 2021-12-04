import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:loginfinal/categorianegocios.dart';
import 'package:loginfinal/clientes.dart';
import 'package:loginfinal/compraproductos.dart';
import 'package:loginfinal/main.dart';
import 'package:loginfinal/negocios.dart';
import 'package:loginfinal/registrarclientes.dart';

class productostienda extends StatefulWidget {
  const productostienda({Key? key}) : super(key: key);

  @override
  _productostiendaState createState() => _productostiendaState();
}

class _productostiendaState extends State<productostienda> {
  TextEditingController buscar=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Productos en tienda'),
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
                      setState(() { });
                    },
                    decoration: InputDecoration(
                        hintText: 'Cual es el producto a buscar'
                    ),
                  ),
                ),
                Expanded(
                  child: Buscardata(
                    text: buscar.text,
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


class Buscardata extends StatelessWidget {
  final String text;
  const Buscardata({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Stream<QuerySnapshot>consulta=FirebaseFirestore.instance.collection("negocios").where('productos',arrayContainsAny:[text]).snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: consulta,
      builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
        print(text);
        if(!snapshot.hasData){
          return Center(
            child:CircularProgressIndicator(),
          );
        }

        return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document){
              Map<String,dynamic> data = document.data()! as Map<String,dynamic>;

              return Container(
                color: Colors.blue,
                margin: EdgeInsets.only(top: 5),
                child: ListTile(
                  title: Text(data['nombre']),
                  subtitle: Text(data['actividad']+'\n' +data['direccion']+'\n' +data['telefono']+'\n' +data['celular']),
                  leading: Image.network(data['imagen'], width: 60,height: 60,),
                ),


              );
            }
            ).toList()
        );
      },
    );
  }
}