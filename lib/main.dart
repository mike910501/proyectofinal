import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:loginfinal/clientes.dart';
import 'package:loginfinal/compraproductos.dart';
import 'package:loginfinal/negocios.dart';
import 'package:loginfinal/otro.dart';
import 'package:loginfinal/productos.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'APP Tiendas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.brown,
        )
      ),
      home: const Hometiendas(),
    );
  }
}

class Hometiendas extends StatelessWidget {
  const Hometiendas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    return Scaffold(
      body:
      Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: const BoxDecoration(
              color: Color(0xFFF5CEB8),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage('imagenes/decoracion.png')

              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    //padding: EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: Image.asset('imagenes/OPCION.png', width: 300,height: 300,),
                    //margin: EdgeInsets.symmetric(vertical: 10),//Sirve para dar espacio entre cosas
                    ),

                  Expanded(
                    child: GridView.count(
                      crossAxisCount:2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: const <Widget>[
                        categorias(
                          imagen: 'imagenes/clientes.png',
                          //press: () async => Navigator.push(context, MaterialPageRoute(builder: (context)=>ClientesTienda())),

                          ),
                        categorias2(
                          imagen: 'imagenes/negocios.png',

                        ),
                        categorias3(
                          imagen: 'imagenes/productos.png',

                        ),
                        categorias4(
                          imagen: 'imagenes/carrito.png',

                        ),
                        categorias5(
                          imagen: 'imagenes/nosotros.png',

                        ),

                      ],),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),);
  }
}

class categorias extends StatelessWidget {
  final String imagen;
  //final String title;
  //final Function press;

  const categorias({
    Key? key,
    required this.imagen,
    //required this.title,
    //required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        alignment: Alignment.center,

        //padding:EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0,17),
              blurRadius: 17,
              spreadRadius: -23,
               color: Color(0xFFE6E6E6),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(

            //onTap: (widget.press),
            onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>ClientesTienda()));},

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.center,
                    child: Image.asset(imagen),

                  ),
                  const Text('CLIENTES',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 15,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),

      ),
      ),
    );
  }
}



class categorias2 extends StatelessWidget {
  final String imagen;
  //final String title;
  //final Function press;

  const categorias2({
    Key? key,
    required this.imagen,
    //required this.title,
    //required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        alignment: Alignment.center,

        //padding:EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0,17),
              blurRadius: 17,
              spreadRadius: -23,
              color: Color(0xFFE6E6E6),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(

            //onTap: (widget.press),
            onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Negocios()));},

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: Image.asset(imagen),

                  ),
                  const Text('NEGOCIOS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 15,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),

        ),
      ),
    );
  }
}


class categorias3 extends StatelessWidget {
  final String imagen;
  //final String title;
  //final Function press;

  const categorias3({
    Key? key,
    required this.imagen,
    //required this.title,
    //required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        alignment: Alignment.center,

        //padding:EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0,17),
              blurRadius: 17,
              spreadRadius: -23,
              color: Color(0xFFE6E6E6),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(

            //onTap: (widget.press),
            onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>productos()));},

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: Image.asset(imagen),

                  ),
                  const Text('PRODUCTOS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 15,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),


        ),
      ),
    );
  }
}


class categorias4 extends StatelessWidget {
  final String imagen;
  //final String title;
  //final Function press;

  const categorias4({
    Key? key,
    required this.imagen,
    //required this.title,
    //required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        alignment: Alignment.center,

        //padding:EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0,17),
              blurRadius: 17,
              spreadRadius: -23,
              color: Color(0xFFE6E6E6),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(

            //onTap: (widget.press),
            onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Compras()));},

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: Image.asset(imagen),

                  ),
                  const Text('COMPRAS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 15,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),

        ),
      ),
    );
  }
}

class categorias5 extends StatelessWidget {
  final String imagen;
  //final String title;
  //final Function press;

  const categorias5({
    Key? key,
    required this.imagen,
    //required this.title,
    //required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        alignment: Alignment.center,

        //padding:EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0,17),
              blurRadius: 17,
              spreadRadius: -23,
              color: Color(0xFFE6E6E6),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(

            //onTap: (widget.press),
            onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>InkWellDrawer()));},

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: Image.asset(imagen),

                  ),
                  const Text('NOSOTROS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 15,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),

        ),
      ),
    );
  }
}







