import 'package:flutter/material.dart';
import 'package:foodapp/src/services/food_services.dart';
import 'package:provider/provider.dart';
import 'package:foodapp/src/pages/crearResenia_page.dart';
import 'package:foodapp/src/pages/crearRestaurante_page.dart';
import 'package:foodapp/src/pages/detalleRestaurante_page.dart';
import 'package:foodapp/src/pages/home_page.dart';
 
void main(){
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>FoodServices())
      ],
      child: MyApp()
    )
  );
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomePage(),
      routes: {
        'detalleRestaurante' : (BuildContext context) => DetalleRestaurantePage(),
        'crearComentario'    : (BuildContext context) => CrearReseniaPage(),
        'nuevoRestaurante'   : (BuildContext context) => CrearRestaurantePage()
      },
    );
  }
}