import 'package:flutter/material.dart';
import 'package:foodapp/src/models/food_model.dart';
import 'package:foodapp/src/services/food_services.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool marcarChina= false;
  bool marcarHamburguer = false;
  bool marcarItalian = false;
  bool marcarJapan = false;
  bool marcarMexican = false;
  bool marcarPizza = false;
  bool marcarSdf = false;
  bool marcarSushi = false;

  final foodServices = FoodServices();
  @override
  void initState() {
    super.initState();
    foodServices.listarRestaurantes();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final foodServices = FoodServices();
    return Scaffold(
      appBar: AppBar(
        title: Text('Food App'),
        elevation: 0.0,
        actions: [
          ElevatedButton.icon(
            icon: Icon(
              Icons.add
            ),
            onPressed: (){
              Navigator.pushNamed(context, 'nuevoRestaurante');
            }, 
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  // if (states.contains(MaterialState.pressed))
                  //   return Colors.green;
                  return Colors.green; // Use the component's default.
                },
              ),
            ),
            label: Text(
              "Nuevo Restaurante"
            )
          )
        ],
        backgroundColor: Color(0xffFF3F33),
      ),
      body: StreamBuilder(
        stream: foodServices.restaurantesStream,
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
            ListFood restaurantes = ListFood.fromjsonList(snapshot.data);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: size.height * 0.1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Filtrar por tipo de comida"
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: ()async{
                                  setState(() {
                                    
                                  });
                                  marcarChina = true;
                                  marcarHamburguer = false;
                                  marcarItalian = false;
                                  marcarJapan = false;
                                  marcarMexican = false;
                                  marcarPizza = false;
                                  marcarSdf = false;
                                  marcarSushi = false;
                                  await foodServices.listarRestaurantes(slug_type: 'cf4ff9dc-51c3-4e0d-b0d7-f3d06d4086af');
                                  
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Container(
                                    width: size.width * 0.15,
                                    color: (marcarChina) ? Color(0xffFF3F33):Colors.transparent,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'China',
                                      style: TextStyle(
                                        color: (marcarChina)?Colors.white:Colors.black
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              GestureDetector(
                                onTap: ()async{
                                  setState(() {
                                    
                                  });
                                  marcarHamburguer = true;
                                  marcarChina = false;
                                  marcarItalian = false;
                                  marcarJapan = false;
                                  marcarMexican = false;
                                  marcarPizza = false;
                                  marcarSdf = false;
                                  marcarSushi = false;
                                    await foodServices.listarRestaurantes(slug_type: 'fc43a9de-dcfb-4d78-9700-7169b5d649ed');
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Container(
                                    width: size.width * 0.3,
                                    color: (marcarHamburguer) ? Color(0xffFF3F33) :  Colors.transparent,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Hamburguesas',
                                      style: TextStyle(
                                        color: (marcarHamburguer)?Colors.white:Colors.black
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              GestureDetector(
                                onTap: ()async{
                                  setState(() {
                                    
                                  });
                                  marcarItalian = true;
                                  marcarHamburguer = false;
                                  marcarChina = false;
                                  marcarJapan = false;
                                  marcarMexican = false;
                                  marcarPizza = false;
                                  marcarSdf = false;
                                  marcarSushi = false;
                                    await foodServices.listarRestaurantes(slug_type: '32ac1c31-22ed-43f4-aa46-6f0185999c6f');
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Container(
                                    width: size.width * 0.2,
                                    color: (marcarItalian) ? Color(0xffFF3F33) : Colors.transparent,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Italiano',
                                      style: TextStyle(
                                        color: (marcarItalian)?Colors.white:Colors.black
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              GestureDetector(
                                onTap: ()async{
                                  setState(() {
                                    
                                  });
                                  marcarJapan = true;
                                  marcarItalian = false;
                                  marcarHamburguer = false;
                                  marcarChina = false;
                                  marcarMexican = false;
                                  marcarPizza = false;
                                  marcarSdf = false;
                                  marcarSushi = false;
                                    await foodServices.listarRestaurantes(slug_type: 'ea8f54ad-0efa-4c67-a9e3-84c864a4c589');
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Container(
                                    width: size.width * 0.2,
                                    alignment: Alignment.center,
                                    color: (marcarJapan) ? Color(0xffFF3F33):Colors.transparent,
                                    child: Text(
                                      'Japonesa',
                                      style: TextStyle(
                                        color: (marcarJapan)?Colors.white:Colors.black
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              GestureDetector(
                                onTap: ()async{
                                  setState(() {
                                    
                                  });
                                  marcarMexican = true;
                                  marcarJapan = false;
                                  marcarItalian = false;
                                  marcarHamburguer = false;
                                  marcarChina = false;
                                  marcarPizza = false;
                                  marcarSdf = false;
                                  marcarSushi = false;
                                    await foodServices.listarRestaurantes(slug_type: 'f65029f3-9d80-43ac-aa2b-c9e88b3daa92');
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Container(
                                    width: size.width * 0.2,
                                    color: (marcarMexican) ? Color(0xffFF3F33):Colors.transparent,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Mexicana',
                                      style: TextStyle(
                                        color: (marcarMexican)?Colors.white:Colors.black
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              GestureDetector(
                                onTap: ()async{
                                  setState(() {
                                    
                                  });
                                  marcarPizza = true;
                                  marcarMexican = false;
                                  marcarJapan = false;
                                  marcarItalian = false;
                                  marcarHamburguer = false;
                                  marcarChina = false;
                                  marcarSdf = false;
                                  marcarSushi = false;
                                    await foodServices.listarRestaurantes(slug_type: '5e17d62f-1f10-446a-8c4d-b6f88acc5ae3');
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Container(
                                    width: size.width * 0.12,
                                    color: (marcarPizza)?Color(0xffFF3F33):Colors.transparent,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Pizza',
                                      style: TextStyle(
                                        color: (marcarPizza)?Colors.white:Colors.black
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              GestureDetector(
                                onTap: ()async{
                                  setState(() {
                                    
                                  });
                                  marcarSdf = true;
                                  marcarPizza = false;
                                  marcarMexican = false;
                                  marcarJapan = false;
                                  marcarItalian = false;
                                  marcarHamburguer = false;
                                  marcarChina = false;
                                  marcarSushi = false;
                                    await foodServices.listarRestaurantes(slug_type: 'da80bd44-8aea-4716-a83d-0051d4f3b890');
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Container(
                                    width: size.width * 0.12,
                                    color: (marcarSdf) ? Color(0xffFF3F33):Colors.transparent,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'sdf',
                                      style: TextStyle(
                                        color: (marcarSdf)?Colors.white:Colors.black
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              GestureDetector(
                                onTap: ()async{
                                  setState(() {
                                    
                                  });
                                  marcarSushi = true;
                                  marcarSdf = false;
                                  marcarPizza = false;
                                  marcarMexican = false;
                                  marcarJapan = false;
                                  marcarItalian = false;
                                  marcarHamburguer = false;
                                  marcarChina = false;
                                    await foodServices.listarRestaurantes(slug_type: '3089daf1-3a5d-4abc-96a0-4297bc8ad645');
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Container(
                                    width: size.width * 0.14,
                                    color: (marcarSushi)?Color(0xffFF3F33):Colors.transparent,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Sushi',
                                      style: TextStyle(
                                        color: (marcarSushi)?Colors.white:Colors.black
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                listaRestaurantes(context, restaurantes.items),
              ],
            );
          }
        },
      ),
    );
  }

  Widget listaRestaurantes( BuildContext context, List<FoodResponse> restaurantes){
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.78,
      child: ListView.builder(
        itemCount: restaurantes.length,
        itemBuilder: (BuildContext context, int i){
          return GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, 'detalleRestaurante', arguments: restaurantes[i]);
            },
            child: Card(
              child: Container(
                width: size.width * 0.9,
                height: size.height * 0.25,
                padding: EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    FadeInImage(
                      width: size.width * 0.4,
                      height: size.height * 0.2,
                      placeholder: AssetImage(
                        'assets/loading.gif'
                      ), 
                      image: NetworkImage(
                        '${restaurantes[i].logo}'
                      ),
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: size.width * 0.04,
                    ),
                    Text(
                      '${restaurantes[i].name}',
                      style: TextStyle(
                        fontSize: 14.0
                      ),
                    )
                  ],
                ),
              )
            ),
          );
        }
      ),
    );
  }
}