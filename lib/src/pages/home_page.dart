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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final foodServices = Provider.of<FoodServices>(context);
    foodServices.listarRestaurantes();

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
            final restaurantes = ListFood.fromjsonList(snapshot.data);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   height: size.height * 0.1,
                //   child: Text('Cambiar comida'),
                // ),
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
      height: size.height * 0.88,
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
                padding: EdgeInsets.only(left: 10.0 ),
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