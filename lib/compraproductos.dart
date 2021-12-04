
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

class Compras extends StatefulWidget {

  const Compras({Key? key}) : super(key: key);

  @override
  _ComprasState createState() => _ComprasState();
}

class _ComprasState extends State<Compras> {
  TextEditingController buscar=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Row(
            children: [
              Container(
                width: 230,
                  child: Text('Compra')
              ),
              Container(
                child: Icon(Icons.shopping_cart),
              ),
              Container(

              )
            ],
          ),

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
            width: 350,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: TextField(
                    controller: buscar,
                    onChanged: (value){
                      setState(() {
                      }
                      );
                    },
                    decoration: InputDecoration(
                        label: Text('Digite el nombre del negocio')
                    ),
                  ),
                ),
                Expanded(
                    child:BuscarNegocio(textdato: buscar.text,)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BuscarNegocio extends StatefulWidget {
  final String textdato;

  BuscarNegocio({Key? key, required this.textdato}) : super(key: key);

  @override
  State<BuscarNegocio> createState() => _BuscarNegocioState();
}

class _BuscarNegocioState extends State<BuscarNegocio> {
  final List lista=[];

  var total;

  var _count=0;

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> consultar=FirebaseFirestore.instance.collection('productos').where('negocio', isEqualTo: widget.textdato).snapshots();

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
                        return Column(
                            children:[
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 100,

                                decoration: BoxDecoration(

                                ),
                                child: ListTile(
                                  title: Text(data['nombre'],),
                                  subtitle: Text(data['precio']),
                                  onTap: (){
                                    lista.add([data['nombre'],data['precio']]);
                                    //lista.add(data['precio']);
                                    print(lista);
                                    _count=lista.length;
                                    setState(() {
                                      _count;
                                    });
                                  },

                                ),
                              ),

                            ]
                        );
                      }
                      ).toList()
                  );

                },
              ),
            ),



        ),
        /*Expanded(
            flex: 4,
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(20),
              height: 100,
              color: Colors.deepOrange,
             /* child: ElevatedButton.icon(
                  onPressed: (){
                    total=0;
                    var tt;
                    for(int i=0; i<lista.length;i++){
                      tt=int.parse(lista[i][1]);
                      total=tt+total;
                      _counter =lista.length;
                        print(_counter);
                    }
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ListaCompra(lista: lista)));
                  },
                  icon: Icon(Icons.add_shopping_cart, size: 30, color: Colors.black,),
                  label:Row(
                    children: [
                      Text("Terminar compra", textAlign: TextAlign.center,),
                        Container(
                            child: Text('$_counter'),
                        ),
                    ],
                  ),
              ),

              */

            ),

        ),

         */
        FloatingActionButton.extended(
          //label: const T
          backgroundColor: Colors.amber,
          onPressed: () {

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ListaCompra(lista: lista)),
            );
          },

          icon: Icon(Icons.add),
          label: Row(
            children: [
              Container(
                child: Text('Terminar compra'),
              ),
              Container(
                width: 40,
                child: Icon(Icons.add_shopping_cart),
              ),
              Container(

                child: Text('$_count'),
              )
            ],
          ),


        ),


      ],
    );


  }
}