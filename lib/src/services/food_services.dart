import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';
import 'package:foodapp/src/models/food_model.dart';

class FoodServices with ChangeNotifier{
  final url = "tellurium.behuns.com";
  final _foodStreamController               = BehaviorSubject<List<dynamic>>();
  final _reviewsStreamController               = BehaviorSubject<List<Review>>();

  Function(List<dynamic>) get restaurantesSink => _foodStreamController.sink.add;
  Stream<List<dynamic>> get restaurantesStream => _foodStreamController.stream;

@override
void dispose(){
  _foodStreamController?.close();
}

  Future<List<dynamic>> listarRestaurantes({String slug_type=''})async{
    
    // if(slug_type == ''){
    //   Uri uri = Uri.https(url,'/api/restaurants/');
    //   final resp = await http.get(
    //     uri
    //   );
    //   final decodedResp = json.decode(resp.body);

    //   restaurantesSink(decodedResp);
    //   notifyListeners();
    //   return decodedResp;
    // }else{
    // }
      Uri uri = Uri.https(
        url,
        '/api/restaurants/',
        {
          'food_type__slug': (slug_type == '')? '' : '$slug_type'
        });
      final resp = await http.get(
        uri
      );

      final decodedResp = json.decode(resp.body);

      restaurantesSink(decodedResp);
      notifyListeners();
      return decodedResp;
  }

  Future<Map<String,dynamic>> crearRestaurante(String name, String description, File logo, String food_type)async{
    Uri uri = Uri.https(url, '/api/restaurants/');
    final uploadRequest = http.MultipartRequest(
      'POST',
      uri
    )
    ..fields['name'] = "$name"
    ..fields['description'] = "$description"
    ..fields['food_type'] = "$food_type";

    if(logo!=null){
      final mymeType = mime( logo.path).split('/');
      final files = await http.MultipartFile.fromPath(
        'logo', 
        logo?.path,
        contentType: MediaType(
          mymeType[0],
          mymeType[1]
        )
      );

      uploadRequest.files.add(files);
      final streamResponse = await uploadRequest.send();
      final respuesta = await http.Response.fromStream(streamResponse);
      if(respuesta.statusCode != 200 && respuesta.statusCode != 201){
        print(respuesta.body);
        return null;
      }

      final decodedResp = json.decode(respuesta.body);
      notifyListeners();
      return decodedResp;
    }else{
      final streamResponse = await uploadRequest.send();
      final respuesta = await http.Response.fromStream(streamResponse);
      if(respuesta.statusCode != 200 && respuesta.statusCode != 201){
        print(respuesta.body);
        return null;
      }
      final decodedResp = json.decode(respuesta.body);
      notifyListeners();
      return decodedResp;
    }
  }

  Future<Map<String,dynamic>> crearResenia(String slug, String email, String comentario, int rating)async{
    Uri uri = Uri.https(url, '/api/reviews/');
    final body = {
      "restaurant": "$slug",
      "email": "$email",
      "comments": "$comentario",
      "rating": "${rating.toString()}"
    };
    final resp = await http.post(
      uri,
      body: body
    );

    Map<String,dynamic> decodedResp = json.decode(resp.body);
    notifyListeners();
    return decodedResp;
  }
}