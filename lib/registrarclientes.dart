import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loginfinal/categorianegocios.dart';
import 'package:loginfinal/clientes.dart';
import 'package:loginfinal/compraproductos.dart';
import 'package:loginfinal/consultarproductostienda.dart';
import 'package:loginfinal/listadearticulos.dart';
import 'package:loginfinal/main.dart';
import 'package:loginfinal/negocios.dart';


class GestionCliente extends StatefulWidget {
  const GestionCliente({Key? key}) : super(key: key);

  @override
  _GestionClienteState createState() => _GestionClienteState();
}

class _GestionClienteState extends State<GestionCliente> {

  final List lista=[];
  final codigo=TextEditingController();
  final nombre=TextEditingController();
  final direccion=TextEditingController();
  final telefono=TextEditingController();
  final celular=TextEditingController();
  CollectionReference datoscliente=FirebaseFirestore.instance.collection('clientes');


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: Text("Gestion clientes")
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

        body: ListView(

          children: [
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Image.asset('imagenes/cliente.png', width: 150,height: 150,),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(color: const Color(0xD3C7BBBB).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextField(
                      controller: codigo,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        border: InputBorder.none,
                        hintText: 'Codigo Cliente',
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            CupertinoIcons.plus_rectangle,
                            color: Colors.blue,
                            size: 30,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(color: const Color(0xD3C7BBBB).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextField(
                      controller: nombre,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        border: InputBorder.none,
                        hintText: 'Nombre Cliente',
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            CupertinoIcons.person_alt_circle,
                            color: Colors.blue,
                            size: 30,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: const Color(0xD3C7BBBB).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextField(
                      controller: direccion,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        border: InputBorder.none,
                        hintText: 'Direccion Cliente',
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            CupertinoIcons.location_solid,
                            color: Colors.blue,
                            size: 30,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(color: const Color(0xD3C7BBBB).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextField(
                      controller: telefono,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        border: InputBorder.none,
                        hintText: 'Telefono Cliente',
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            CupertinoIcons.phone,
                            color: Colors.blue,
                            size: 30,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: const Color(0xD3C7BBBB).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextField(
                      controller: celular,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        border: InputBorder.none,
                        hintText: 'celular Cliente',
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            CupertinoIcons.phone_solid,
                            color: Colors.blue,
                            size: 30,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                  ),


                  Container(
                    padding: EdgeInsets.only(top:5),
                    alignment: Alignment.center,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(250, 40),
                      ),
                      label: Text('Registrar',
                        textAlign: TextAlign.center,),
                      icon: Icon(Icons.account_circle,
                        size:20,
                        color: Colors.lightGreen,
                      ),

                      onPressed: (){


                        if(codigo.text.isEmpty|nombre.text.isEmpty||direccion.text.isEmpty||telefono.text.isEmpty||celular.text.isEmpty){
                          Fluttertoast.showToast(msg: "Ingrese todos los campos",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                          );
                        }
                        else {
                          datoscliente.doc(codigo.text).set({
                            "nombre": nombre.text,
                            "direccion": direccion.text,
                            "telefono": telefono.text,
                            "celular": celular.text
                          });
                        }

                          Fluttertoast.showToast(msg: "Datos guardados",
                              fontSize: 20,
                              backgroundColor: Colors.lightBlueAccent,
                              textColor: Colors.yellow,
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM);
                          codigo.clear();
                          nombre.clear();
                          direccion.clear();
                          telefono.clear();
                          celular.clear();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ListaCompra(lista: lista)),
                        );
                        }

                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(top:5),
                    alignment: Alignment.center,
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(250, 40),
                        ),
                        label: Text('Actualizar',
                          textAlign: TextAlign.center,),
                        icon: Icon(Icons.account_circle,
                          size:20,
                          color: Colors.lightGreen,
                        ),

                        onPressed: (){
                          datoscliente.doc(codigo.text).update({
                            "nombre": nombre.text,
                            "direccion": direccion.text,
                            "telefono": telefono.text,
                            "celular": celular.text,
                          });

                          Fluttertoast.showToast(msg: "Datos modificados",
                              fontSize: 20,
                              backgroundColor: Colors.lightBlueAccent,
                              textColor: Colors.yellow,
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM);
                        }
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(top:5),
                    alignment: Alignment.center,
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(250, 40),
                        ),
                        label: Text('Eliminar',
                          textAlign: TextAlign.center,),
                        icon: Icon(Icons.account_circle,
                          size:20,
                          color: Colors.lightGreen,
                        ),

                        onPressed: (){
                          datoscliente.doc(codigo.text).delete();
                          Fluttertoast.showToast(msg: "Datos eliminador",
                              fontSize: 20,
                              backgroundColor: Colors.lightBlueAccent,
                              textColor: Colors.yellow,
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM);
                          codigo.clear();
                          nombre.clear();
                          direccion.clear();
                          telefono.clear();
                          celular.clear();
                        }
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );



  }
}
