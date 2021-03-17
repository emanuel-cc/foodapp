import 'package:flutter/material.dart';

void mostrarAlerta(BuildContext context,String mensaje,String title,String imagen){
  final size = MediaQuery.of(context).size;
  showDialog(
    context: context,
    builder: (context){
      return AlertDialog(
        title: Text(
          '$title',
          style: TextStyle(
            fontFamily: 'Point-SemiBold'
          ),
        ),
        content: Container(
          width: size.width * 0.5,
          height: size.height * 0.35,
          child: Column(
            children: <Widget>[
              Container(
                width: size.width * 0.3,
                height: size.height * 0.2,
                child: Image.asset('$imagen'),
              ),
              Flexible(
                child: Text(
                  mensaje,
                  style: TextStyle(
                    fontFamily: 'Point-SemiBold',
                    fontSize: 12.0
                    ),
                  )
                ),
              ElevatedButton(
                // textTheme: ButtonTextTheme.primary,
                // color: Colors.green,
                // shape: StadiumBorder(),
                child: Text(
                  'Aceptar',
                style: TextStyle(
                  fontFamily: 'Point-SemiBold',
                  color: Colors.white
                  ),
                ),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
              
            ],
          ),
        ),
      );
    }
  );
}