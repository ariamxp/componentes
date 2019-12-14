import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar: AppBar(
           title: Text("Sliders"),
         ),
         body: _contenido(),
       ),
    );
  }

  Widget _contenido() {

    return Container(
      padding: EdgeInsets.only(top: 50.0),
      child: Column(
        children: <Widget>[
          _crearSlider(),
          _crearCheckbox(),
          _crearSwitch(),
          _crearImagen(),
        ],
      ),
    );

  }

  Widget _crearSlider() {

    return Slider(
      activeColor: Colors.indigo,
      label: 'Tamaño de la imagen',
      //divisions: 20,
      value: _valorSlider,
      min: 10,
      max: 400,
      onChanged: ( _bloquearCheck ) ? null : (valor){
        setState(() {
          _valorSlider = valor;
        });
      },
    );

  }

  Widget _crearImagen() {
    return Expanded(
          child: Image(
          image: NetworkImage('https://i.blogs.es/24bcec/the-batman-affleck/1366_2000.jpg'),
          width: _valorSlider,
          fit: BoxFit.cover,
        ),
      );
  }

  Widget _crearCheckbox() {
    //return Checkbox(
    //  value: _bloquearCheck,
    //  onChanged: (valor){
    //    setState(() {
    //      _bloquearCheck = valor;
    //    });
    //  },
    //);

    return CheckboxListTile(
      value: _bloquearCheck,
      title: Text("Bloquear slider"),
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
  }

  Widget _crearSwitch() {

    return SwitchListTile(
      value: _bloquearCheck,
      title: Text("Bloquear slider"),
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );

  }
}