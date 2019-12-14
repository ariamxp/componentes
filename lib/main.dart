import 'package:componentes/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Componentes App',
      //home: HomePage()
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: ( RouteSettings settings ){
        print('Ruta llamada: ${ settings.name }');
        return MaterialPageRoute(
             builder: (context) => AlertPage()
           );
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        //prefix0.GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
          const Locale('en', 'US'), // English
          const Locale('es', 'ES'), // Español
        ],
    );
  }
}