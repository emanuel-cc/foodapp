import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodapp/src/services/food_services.dart';
import 'package:foodapp/src/tree_size_dot_widget.dart';
import 'package:foodapp/src/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:provider/provider.dart';

class CrearRestaurantePage extends StatefulWidget {
  CrearRestaurantePage({Key key}) : super(key: key);

  @override
  _CrearRestaurantePageState createState() => _CrearRestaurantePageState();
}

class _CrearRestaurantePageState extends State<CrearRestaurantePage> {
  GlobalKey<FormState> formKey = GlobalKey();
  final picker = ImagePicker();
  String nombre = '';
  String descripcion = '';
  PickedFile foto;
  File image;
  final codesTypeFood = [
      {
        "display": "chinese",
        "value": "cf4ff9dc-51c3-4e0d-b0d7-f3d06d4086af",
      },
      {
        "display": "hamburguers",
        "value": "fc43a9de-dcfb-4d78-9700-7169b5d649ed",
      },
      {
        "display": "italian",
        "value": "32ac1c31-22ed-43f4-aa46-6f0185999c6f",
      },
      {
        "display": "japanese",
        "value": "ea8f54ad-0efa-4c67-a9e3-84c864a4c589",
      },
      {
        "display": "mexican",
        "value": "f65029f3-9d80-43ac-aa2b-c9e88b3daa92",
      },
      {
        "display": "pizza",
        "value": "5e17d62f-1f10-446a-8c4d-b6f88acc5ae3",
      },
      {
        "display": "sdf",
        "value": "da80bd44-8aea-4716-a83d-0051d4f3b890",
      },
      {
        "display": "sushi",
        "value": "3089daf1-3a5d-4abc-96a0-4297bc8ad645",
      },
    ];
  String selectedtypeFoodCode;
  
  seleccionarFoto()async{
    foto = await picker.getImage(source: ImageSource.gallery);
    setState(() {
        
    });
    // if(foto != null){
    //   //limpieza
    //   //fotoUrl = null;
    // }
    //prefs.photoUrl = foto?.path;
    print("Foto");
    // print(foto.path);
    print(foto);
    image = File(foto.path);
  }

  tomarFoto()async{
    foto = await picker.getImage(
      source: ImageSource.camera
    );
    setState(() {
        
    });
    // if(foto != null){
    //   //limpieza
    // }
    print("Foto");
    // print(foto.path);
    print(foto);
    image = File(foto.path);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final foodServices = Provider.of<FoodServices>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nuevo Restaurante"
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color(0xffFF3F33),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 50.0,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: //_mostrarFoto(prefs.photoEditar.toString())
                        (foto != null) ? Image.file(
                          image,
                          fit: BoxFit.cover,
                          height: size.height * 0.6,
                          width: size.width * 0.4,
                        ):
                        Image( 
                          image: NetworkImage('https://www.zamzar.com/images/filetypes/jpg.png'),
                          height: size.height * 0.6,
                          width: size.width * 0.4
                        )
                      /*FadeInImage(
                        image: _mostrarFoto(), //prefs.photoUrl.toString() != '' ? NetworkImage( prefs.photoUrl.toString()) : ( foto != null ? Image.network(foto.path,fit: BoxFit.fill ) : AssetImage( 'assets/iconoapp/Selftour1.png') ),
                        placeholder: AssetImage('assets/loading.gif'),
                        fit: BoxFit.fill,
                        )*/
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          backgroundColor: Color(0xFFD62250),
                          child: IconButton(
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                            onPressed: tomarFoto
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: CircleAvatar(
                          backgroundColor: Color(0xFFD62250),
                          child: IconButton(
                            icon: Icon(
                              Icons.image,
                              color: Colors.white,
                            ),
                            onPressed: seleccionarFoto
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                width: size.width * 0.9,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: "Nombre"
                  ),
                  onChanged: (value){
                    nombre = value;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                width: size.width * 0.9,
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: "Descripción"
                  ),
                  onChanged: (value){
                    descripcion = value;
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Container(
                padding: EdgeInsets.only(left: 30.0, right: 20.0),
                child: DropDownFormField(
                  titleText: 'Tipo de restaurante',
                  hintText: 'Elige el tipo de restaurante',
                  value: selectedtypeFoodCode,
                  onSaved: (value){
                    setState(() {
                      selectedtypeFoodCode = value;
                    });
                  },
                  onChanged: (value){
                    setState(() {
                      selectedtypeFoodCode = value;
                    });
                    print(selectedtypeFoodCode);
                  },
                  dataSource: codesTypeFood,
                  textField: "display",
                  valueField: "value",
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Container(
                width: size.width * 0.5,
                child: ProgressButton(
                  width: size.width * 0.5,
                  progressWidget: ThreeSizeDot(),
                  defaultWidget: Text(
                    'Guardar',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  color: Color(0xFFD62250),
                  animate: false,
                  onPressed: ()async{
                    if(formKey.currentState.validate()){
                      formKey.currentState.save();
                      await Future.delayed(Duration(seconds: 2), ()async{ 
                          await foodServices.crearRestaurante(nombre, descripcion, image, selectedtypeFoodCode)
                              .then((resp){
                                print(resp);
                                if(resp['slug'] == null){
                                  mostrarAlerta(context, "Hay campos vacíos", '', 'assets/error.png');
                                }else{
                                  foodServices.listarRestaurantes();
                                  Navigator.pop(context);
                                  mostrarAlerta(context, "Registro Exitoso", '', 'assets/check.jpg');
                                }
                              }).catchError((err){
                                print(err);
                                mostrarAlerta(context, "Hay campos vacíos", '', 'assets/error.png');
                              });
                        });
                    }else{
                      mostrarAlerta(context, 'Hay campos vacíos', '', 'assets/error.png');
                    }
                  },
                )
              )
            ],
          )
        ),
      ),
    );
  }
}