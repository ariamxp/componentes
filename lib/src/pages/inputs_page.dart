import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {

  @override
  _InputsPageState createState() => _InputsPageState();

}

class _InputsPageState extends State<InputsPage> {

  String _nombre = '';
  String _email = '';
  String _password = '';
  String _fecha = '';
  String _opcionSeleccionada = 'Volar';
  TextEditingController _fechaController = TextEditingController();
  List<String> _poderes = ['Volar', 'Rayos X', 'Super aliento', 'Super fuerza'];

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar: AppBar(
           title: Text("Inputs Fields"),
         ),
         body: _contenido(),
       ),
    );
  }

  Widget _contenido() {

    return ListView(
      padding: EdgeInsets.all(20),
      children: <Widget>[
        _crearInput(),
        Divider(),
        _crearEmail(),
        Divider(),
        _crearPassword(),
        Divider(),
        _crearFecha( context ),
        Divider(),
        _crearDropDown( context ),
        Divider(),
        _crearPersona(),
      ],
    );

  }

  Widget _crearInput() {

    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5)
        ),
        counter: Text('Letras ${ _nombre.length }'),
        hintText: "Nombre de la persona",
        labelText: "Nombre",
        helperText: "Solo es el nombre",
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (valor){
        setState(() {
          _nombre = valor;
        });
      },
    );

  }

  _crearPersona() {
    return ListTile(
      title: Text('Nombre es $_nombre'),
      subtitle: Text('E-mail es $_email'),
    );
  }

  Widget _crearEmail() {

     return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5)
        ),
        counter: Text('Letras ${ _email.length }'),
        hintText: "E-mail de la persona",
        labelText: "E-mail",
        helperText: "Un e-mail válido",
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email)
      ),
      onChanged: (valor){
        setState(() {
          _email = valor;
        });
      },
    );


  }

  Widget _crearPassword() {

    return TextField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5)
        ),
        counter: Text('Letras ${ _password.length }'),
        hintText: "Password de la persona",
        labelText: "Password",
        helperText: "Un password secreto",
        suffixIcon: Icon(Icons.vpn_key),
        icon: Icon(Icons.lock)
      ),
      onChanged: (valor){
        setState(() {
          _password = valor;
        });
      },
    );

  }

  Widget _crearFecha( BuildContext context ) {

    return TextField(
        enableInteractiveSelection: false,
        controller: _fechaController,
        keyboardType: TextInputType.datetime,
        decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5)
        ),
        hintText: "Fecha de nacimiento",
        labelText: "Fecha",
        helperText: "¿Cuando naciste?",
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today)
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
      onChanged: (valor){
        setState(() {
          _fecha = valor;
        });
      },
    );

  }

  void _selectDate(BuildContext context) async {

    DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2025),
      locale: Locale('es')
    );
    if( picked != null ){
      setState(() {
        _fecha = picked.toString();
        _fechaController.text = _fecha;
      });
    }

  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {

    List<DropdownMenuItem<String>> lista = List();
    _poderes.forEach((poder){
      lista.add(DropdownMenuItem(
          child: Text(poder),
          value: poder,
        )
      );
    });

    return lista;

  }

  Widget _crearDropDown(BuildContext context) {

    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 20.0,),
        Expanded(
            child: DropdownButton(
            value: _opcionSeleccionada,
            items: getOpcionesDropdown(),
            onChanged: (opt){
              setState(() {
                _opcionSeleccionada = opt;
              });
            },
          ),
        ),
      ],
    );

  }

}