import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; 
import 'dart:convert';

import '../utils/utils.dart' as util; 
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String _cityEnte = ''; 
  Future _goToNetxtS(BuildContext context) async {
    Map results = await Navigator.of(context).push(
      MaterialPageRoute<Map>(builder: (BuildContext context ){
        return ChangeCity(); 
      })
    ); 

    if( results != null && results.containsKey('enter')){
      _cityEnte = results['enter']; 
    }


  }

  

  void ShowStuff() async{
    Map data = await getWeather(util.appId, util.defaultCity); 
    print(data.toString()); 
  }

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clima'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: <Widget>[
          RaisedButton(
            onPressed: (){ 
              //BOTON--------------------------------------------------------------------------------------------
              _goToNetxtS(context);   },
            child: Icon(Icons.menu, color: Colors.white,),
            color: Colors.blue,
          ), 
        ],
      ),
      body: Stack(
        
        children: <Widget>[
          Center(
            child: Image.asset('assets/fnd.jpg', 
            height: 1900.0,
            fit: BoxFit.fill,
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.fromLTRB(0.0, 10.9, 20.9, 0.0),
            child: Text('${_cityEnte == null ? util.defaultCity : _cityEnte}' , style: _nohayeltexto(),),
          ), 
          Container(
            margin: EdgeInsets.fromLTRB(0.0, 500.0, 0.0, 0.0),

            alignment: Alignment.center,
            child: updateTempWidget(_cityEnte)
          ),  

          
        ],
      ),
    ); 
  }


//Peticion HTTP --------------------------------------------------------------------------------------
//Peticion HTTP --------------------------------------------------------------------------------------
//Peticion HTTP --------------------------------------------------------------------------------------
//Peticion HTTP --------------------------------------------------------------------------------------
//Peticion HTTP --------------------------------------------------------------------------------------
//Peticion HTTP --------------------------------------------------------------------------------------
  Future<Map> getWeather(String appId, String city) async{
    String apiUrl = 'https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=$appId&lang=es';
    http.Response response =  await http.get(apiUrl);
    return json.decode(response.body); 
  }

//-----------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------

  Widget updateTempWidget(String city){

    return FutureBuilder(
      future: getWeather(util.appId, city == null ? util.defaultCity : city),
      builder: (BuildContext context, AsyncSnapshot<Map> snapsot){
        if(snapsot.hasData){
          Map content = snapsot.data; 
          return Container(
            child: Column(
              children: <Widget>[
                ListTile(

                  title: Text(content['main']['temp'].toString() + ' °C', style: _textoAbajo(),),
                  subtitle: Text('Temp Max: '+content['main']['temp_max'].toString(), style: _nohayeltexto2(),),
                ),
                ListTile(
                  subtitle: Text('Tem Min: '+content['main']['temp_min'].toString(), style: _nohayeltexto2(),),
                ) 
              ],
            ),
          ); 
        }else{
          return Container(); 
        }
      }); 
  }


  





  TextStyle _nohayeltexto(){
    return TextStyle(
      fontSize: 70.0, 
      color: Colors.blueGrey,
      fontStyle: FontStyle.italic, 

    ); 
  }

  TextStyle _nohayeltexto2(){
    return TextStyle(
      fontSize: 35.0, 
      color: Colors.blueGrey,
      fontStyle: FontStyle.italic,

    ); 
  }

  TextStyle _textoAbajo(){
    return TextStyle(
      color: Colors.blueGrey, 
      fontStyle: FontStyle.normal, 
      fontWeight: FontWeight.w500, 
      fontSize: 90.0,
    ); 
  }


}

class ChangeCity extends StatelessWidget{

  String nombre = ''; 
  TextEditingController cityController = TextEditingController(); 

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Ingresa la nueva ciudad'),
          centerTitle: true,
        ),
        body: new Stack(
          children: <Widget>[
            Center(
              child: Image.asset('assets/fnd.jpg', height: 1200.0, width: 490.0, fit: BoxFit.fill,),
            ), 
            ListView(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              children: <Widget>[
                _crearMetodo(),
                Divider(),
                Center(
                  child: RaisedButton(
                    onPressed: (){
                      //---------------------------------------ESPACIO DEL BOTON
                      Navigator.pop(context, {
                        'enter' : cityController.text
                      }); 
                    }, 
                    child: Text('Verificar'), 
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: StadiumBorder(),
                  ),
                ), 
              ],
            )
          ],
        ),
      ); 
    }


    Widget _crearMetodo() {
    return TextField(
      controller: cityController,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ) ,
        counter: Text('Letras ${nombre.length}'), 
        hintText: 'Ingresa la nueva Ciudad',
        labelText: 'Ciudad', 
        helperText: 'Ingresa una ciudad nueva y descubre...', 
        suffix: Icon(Icons.arrow_forward_ios), 
        icon: Icon(Icons.location_city), 


      ),
    ); 
  }


  }