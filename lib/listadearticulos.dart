import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import'package:fluttertoast/fluttertoast.dart';


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
  List lista=[];
  ListaCompra({required this.lista});
  @override
  _ListaCompraState createState() => _ListaCompraState();

}

class _ListaCompraState extends State<ListaCompra> {

  var total;
  CollectionReference datosventas=FirebaseFirestore.instance.collection('ventas');
  var  _counter=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Row(
          children: [
            Container(
              width: 230,
                child: Text('Tu compra',)
            ),
            Container(
              width: 20,
              child: Icon(Icons.add_shopping_cart),
            ),
            Container(

                child: Text('$_counter',),

            ),

          ],
        ),

      ),
      body: Column(
          children: [
            Expanded(
              child: ListView.builder(itemCount: widget.lista.length,
                itemBuilder: (BuildContext context,i){
                  final item=widget.lista[i][0];
                  return Dismissible(
                    onDismissed: (_){
                      widget.lista.removeAt(i);
                    },
                    movementDuration: Duration(milliseconds: 100),
                    key: Key(item),
                    child: ListTile(
                      title: Text(widget.lista[i][0]+"  "+widget.lista[i][1]),
                      //subtitle: Text(widget.lista[i][1]),
                    ),
                    background: Container(
                      color: Colors.amber,
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              color:Colors.amber,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Builder(
                      builder: (context){
                        return ElevatedButton.icon(

                          label: Row(

                            children: [
                              Text("Ver precio de su compra"),
                            ],
                          ),
                          icon: Icon(Icons.shopping_cart,
                            size: 20,
                            color: Colors.orange,

                          ),

                          onPressed: (){
                            total=0;

                            var tt;
                            for(int i=0; i<widget.lista.length;i++){
                              tt=int.parse(widget.lista[i][1]);
                              total=tt+total;
                              setState(() {
                                _counter =widget.lista.length;
                                print(_counter);
                              });

                              Fluttertoast.showToast(msg: "El valor de su compra es "+ total.toString(),
                                  fontSize: 20,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.blueGrey,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER
                              );
                            }

                          },
                        );

                      }
                  ),
                  Container(
                    child: ElevatedButton.icon(

                      label: Text('Confirmar su compra',
                        textAlign: TextAlign.center,),
                      icon: Icon(Icons.eleven_mp_outlined,
                        color: Colors.orange,),
                      onPressed: (){
                        total=0;
                        var tt;
                        for(int i=0; i<widget.lista.length;i++){
                          tt=int.parse(widget.lista[i][1]);
                          total=tt+total;
                          print(total);
                          Fluttertoast.showToast(msg: "El valor de su compra es "+ total.toString(),
                              fontSize: 20,
                              backgroundColor: Colors.red,
                              textColor: Colors.blueGrey,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER
                          );
                        }
                        List nuevalista=[];
                        for( int i=0; i<widget.lista.length; i++){
                          nuevalista.add(widget.lista[i][0]);
                        }
                        datosventas.doc().set({
                          'Producto':nuevalista,
                          'ValorCompra':total
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