import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:foodapp/src/models/food_model.dart';
import 'package:foodapp/src/services/food_services.dart';
import 'package:foodapp/src/tree_size_dot_widget.dart';
import 'package:foodapp/src/utils/utils.dart';
import 'package:provider/provider.dart';

class CrearReseniaPage extends StatefulWidget {
  CrearReseniaPage({Key key}) : super(key: key);

  @override
  _CrearReseniaPageState createState() => _CrearReseniaPageState();
}

class _CrearReseniaPageState extends State<CrearReseniaPage> {
  GlobalKey<FormState> formKey = GlobalKey();
  String email = '';
  String comentario = '';
  bool marcado1 = false;
  bool marcado2 = false;
  bool marcado3 = false;
  bool marcado4 = false;
  bool marcado5 = false;
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    FoodResponse resRestaurante = ModalRoute.of(context).settings.arguments;
    final size = MediaQuery.of(context).size;
    final foodService = Provider.of<FoodServices>(context);

    return Scaffold(
       appBar: AppBar(
         elevation: 0.0,
         backgroundColor: Color(0xffFF3F33),
       ),
       body: SingleChildScrollView(
         child: Form(
           key: formKey,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Container(
                 width: size.width * 0.9,
                 padding: EdgeInsets.only(left: 20.0),
                 child: TextFormField(
                   keyboardType: TextInputType.emailAddress,
                   decoration: InputDecoration(
                     labelText: "Email"
                   ),
                   onSaved: (value){
                     email = value;
                   },
                 ),
               ),
               SizedBox(
                 height: size.height * 0.02,
               ),
               Container(
                 width: size.width * 0.9,
                 padding: EdgeInsets.only(left: 20.0),
                 child: TextFormField(
                   keyboardType: TextInputType.multiline,
                   maxLines: 3,
                   decoration: InputDecoration(
                     labelText: "Comentario"
                   ),
                   onSaved: (value){
                     comentario = value;
                   },
                 ),
               ),
               SizedBox(
                 height: size.height * 0.04,
               ),
               Container(
                 padding: EdgeInsets.only(left: 20.0),
                 child: Text(
                   "Califique al restaurante"
                ),
               ),
               SizedBox(
                 height: size.height * 0.02,
               ),
               valoracion(),
               SizedBox(
                 height: size.height * 0.04,
               ),
               Container(
                 alignment: Alignment.center,
                 child: ProgressButton(
                   width: size.width * 0.5,
                   animate: false,
                   progressWidget: ThreeSizeDot(),
                   defaultWidget: Text(
                    'Guardar comentario',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  color: Color(0xFFD62250),
                  onPressed: ()async{
                    formKey.currentState.save();
                    await Future.delayed(Duration(seconds: 2),()async{
                      await foodService.crearResenia(resRestaurante.slug, email, comentario, contador)
                        .then((resp){
                          print(resp);
                          foodService.listarRestaurantes();
                          Navigator.pop(context);
                          
                          mostrarAlerta(context, 'Se guardó con éxito', '', 'assets/check.jpg');
                          
                        }).catchError((err){
                          print(err);
                        });
                    });
                  },
                 )
               )
             ],
           )
        )
      ),
    );
  }

  Widget valoracion(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
         GestureDetector(
           onTap: (){
             marcar();
           },
           child: Icon( 
             marcado1 ? Icons.star : Icons.star_border,
             color: marcado1 ? Color(0xFF034485) : null,
            )
          ),
         GestureDetector(
           onTap: (){
             marcar2();
           },
           child: Icon( 
             marcado2 ? Icons.star : Icons.star_border,
             color: marcado2 ? Color(0xFF034485) : null,
            )
          ),
         GestureDetector(
           onTap: (){
             marcar3();
           },
           child: Icon( 
             marcado3 ? Icons.star : Icons.star_border,
             color: marcado3 ? Color(0xFF034485) : null,
            )
          ),
         GestureDetector(
           onTap: (){
             marcar4();
           },
           child: Icon( 
             marcado4 ? Icons.star : Icons.star_border,
             color: marcado4 ? Color(0xFF034485) : null,
            )
          ),
         GestureDetector(
           onTap: (){
             marcar5();
           },
           child: Icon( 
             marcado5 ? Icons.star : Icons.star_border,
             color: marcado5 ? Color(0xFF034485) : null,
            )
          ),
          Text(contador.toString())
        ],
      ),
    );
  }

  void marcar(){
    setState(() {
      if(marcado1){
        contador = 1;
       // marcado1 = false;
        marcado2 = false;
        marcado3 = false;
        marcado4 = false;
        marcado5 = false;
      }else{
        contador += 1;
        marcado1 = true;
      }
    });
  }
  void marcar2(){
    setState(() {
      if(marcado2){
        contador = 2;
        //marcado1 = false;
        //marcado2 = false;
        marcado3 = false;
        marcado4 = false;
        marcado5 = false;
        
      }else if(!marcado1){
        contador = 2;
        marcado1 = true;
        marcado2 = true;
      }else if(!marcado2){
        contador = 2;
        marcado2 = true;
      }
    });
  }
  void marcar3(){
    setState(() {
      if(!marcado3){
        contador = 3;
        marcado1 = true;
        marcado2 = true;
        marcado3 = true;
      }else if(marcado3){
        contador = 3;
        marcado1 = true;
        marcado2 = true;
        marcado3 = true;
        marcado4 = false;
        marcado5 = false;
      }
    });
  }
  void marcar4(){
    setState(() {
      if(marcado4){
        contador = 4;
        marcado1 = true;
        marcado2 = true;
        marcado3 = true;
        marcado4 = true;
        marcado5 = false;
      }else if(!marcado4){
        contador = 4;
        marcado1 = true;
        marcado2 = true;
        marcado3 = true;
        marcado4 = true;
      }
    });
  }
  void marcar5(){
    setState(() {
      if(marcado5){
        contador = 5;
        marcado1 = true;
        marcado2 = true;
        marcado3 = true;
        marcado4 = true;
        marcado5 = true;
      }else if(!marcado5){
        contador = 5;
        marcado1 = true;
        marcado2 = true;
        marcado3 = true;
        marcado4 = true;
        marcado5 = true;
      }
    });
  }
}