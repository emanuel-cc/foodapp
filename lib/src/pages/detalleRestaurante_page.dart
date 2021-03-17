import 'package:flutter/material.dart';
import 'package:foodapp/src/models/food_model.dart';

class DetalleRestaurantePage extends StatefulWidget {
  DetalleRestaurantePage({Key key}) : super(key: key);

  @override
  _DetalleRestaurantePageState createState() => _DetalleRestaurantePageState();
}

class _DetalleRestaurantePageState extends State<DetalleRestaurantePage> {
  @override
  Widget build(BuildContext context) {
    FoodResponse restaurante = ModalRoute.of(context).settings.arguments;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xffFF3F33),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 20.0, top: 20.0),
              child: Row(
                children: [
                  Container(
                    child: FadeInImage(
                      placeholder: AssetImage(
                        'assets/loading.gif'
                      ), 
                      image: NetworkImage(
                        '${restaurante.logo}'
                      ),
                      fit: BoxFit.fill,
                      width: size.width * 0.45,
                      height: size.height * 0.25,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.04,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${restaurante.name}',
                        style: TextStyle(
                          fontSize: 16.0
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Text(
                            (restaurante.rating == null ) ? '0':
                            '${ restaurante.rating.floor() }',
                            style: TextStyle(
                              fontSize: 12.0
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                '${ restaurante.description }',
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Text(
                    'Reseñas',
                    style: TextStyle(
                      fontSize: 17.0
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.3,
                  ),
                  ElevatedButton.icon(
                    icon: Icon(
                      Icons.add
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green
                    ),
                    label: Text(
                      "Crear reseña"
                    ),
                    onPressed: (){
                      Navigator.pushNamed(context, 'crearComentario',arguments: restaurante );
                    }
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            (restaurante.reviews.length == 0) ?
            Container(
              padding: EdgeInsets.only(left: 10.0 ),
              child: Text(
                "No hay reseñas"
              ),
            ):
            _listaResenias(context, restaurante.reviews),
          ],
        ),
      ),
    );
  }

  Widget _listaResenias(BuildContext context, List<Review> resenias){
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.47,
      padding: EdgeInsets.only(bottom: size.height * 0.06),
      child: ListView.builder(
        itemCount: resenias.length,
        itemBuilder: (BuildContext context, int i){
          return Card(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('${ resenias[i].email }'),
                      SizedBox(
                        width: size.width * 0.04,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(
                        "${ resenias[i].rating }"
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    "${ resenias[i].comments }",
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    "${ resenias[i].created.day }/${ resenias[i].created.month }/${ resenias[i].created.year }",
                    style: TextStyle(
                      fontSize: 10.0
                    ),
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}