import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Componentes'),
        ),
        body: contenido(),
      )
    ;
  }

  Widget contenido(){
    return Container(
      child: ListView(
        //children: _crearItems(),
        children: _crearItemsCorto(),
      ),
    );
  }

  List<Widget> _crearItems(){

    List<Widget> lista = List<Widget>();

    for (String opt in opciones) {

      final tempWidget = ListTile(
        title: Text(opt),
      );
      final separador = Divider();

      lista..add( tempWidget )
           ..add( separador );
      
    }
    
    return lista;
  }


  List<Widget> _crearItemsCorto(){

    return opciones.map( (item){

      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + " !"),
            subtitle: Text("Otra cosa mas..."),
            leading: Icon(Icons.access_alarm),
            trailing: Icon(Icons.arrow_right),
            onTap: (){},
          ),
          Divider()
        ],
      );

    }).toList();

  }



}