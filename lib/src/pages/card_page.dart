import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Card Page"),
        ),
        body: _listaCards(),
      ),
    );
  }

  Widget _listaCards(){
    return ListView(
      padding: EdgeInsets.all(10.0),
      children: <Widget>[
        _cardTipo1(),
        SizedBox(height: 20.0,),
        _cardTipo2()
      ],
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0) ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: ListTile(
              leading: Icon(Icons.kitchen, color: Colors.blue,),
              title: Text("Soy el titulo de esta tarjeta"),
              subtitle: Text("Asdasda asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd "),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: (){},
              ),
              FlatButton(
                child: Text("Ok"),
                onPressed: (){},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0) ),
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/2/2c/NZ_Landscape_from_the_van.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration( milliseconds: 200 ),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(7.0),
            child: Text("El titulo de este paisaje")
            )
        ],
      ),
    );
  }

}