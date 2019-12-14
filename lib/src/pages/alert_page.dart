import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Page"),
      ),
      body: _contenido(context),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.keyboard_arrow_left ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  Widget _contenido(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text("Mostrar alerta!"),
        color: Colors.blue,
        onPressed: () => _mostrarAlerta(context),
        textColor: Colors.white,
        shape: StadiumBorder(),
      ),
    );
  }

  void _mostrarAlerta(BuildContext context){

      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context){ 
            return AlertDialog(
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0)),
              title: Text("Titulo"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("Contenido"),
                  SizedBox(height: 10.0,),
                  FlutterLogo(size: 50.0,)
                ],
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text("Cancelar"),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                FlatButton(
                  child: Text("Ok"),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
         }
      );
    }
    
}