import 'package:examen_topicos/src/auth.dart';
import 'package:flutter/material.dart';
//import 'package:brew_crew';


class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //-------------------------------------------------------------------------------
  //Controladores para validar los campos .....
  TextEditingController emailController = TextEditingController(); 
  TextEditingController passwordController = TextEditingController(); 
  //--------------------------------------------------------------------------------


  final AuthService _auth = AuthService();

  String _nombre = ''; 

  //final Auths 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Examen Final'),
        centerTitle: true,
      ),
      body: _inicio(context),
    ); 

  }

  Widget _inicio(BuildContext context){
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      children: <Widget>[ 

        _crearEmail(), 
        Divider(), 
        _crearPasswd(), 
        Divider(), 
        Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: <Widget>[
        Center(
          child: RaisedButton(
            onPressed: () async {

              dynamic resultUser = await _auth.inicioConEyP(emailController.text, passwordController.text); 

              if( resultUser != null){
                Navigator.pushNamed(context, 'home');
              }
               
            }, 
            child: Text('Inicio de Sesión'), 
            color: Colors.blue,
            textColor: Colors.white,
            shape: StadiumBorder(),
          ),
        ), 
        SizedBox(width: 15), 
        Center(
          child: RaisedButton(
            onPressed: () async{

              dynamic resultUser = await _auth.registroConEyP(emailController.text, passwordController.text); 

              if( resultUser != null){
                Navigator.pushNamed(context, 'home'); 
              }
              
            }, 
            child: Text('Registrate'), 
            color: Colors.lightGreen,
            textColor: Colors.white,
            shape: StadiumBorder(),
          ),
        ), 
      ],
    ), 
        
      ],
    ); 
  }

  //Funcion para Firebase ----------------------------------------------------------
  //Funcion para Firebase ----------------------------------------------------------
  //Funcion para Firebase ----------------------------------------------------------
  //Funcion para Firebase ----------------------------------------------------------
  //Funcion para Firebase ----------------------------------------------------------
  //Funcion para Firebase ----------------------------------------------------------
  

  

  //-----------------------------------------------------------------------------------------------
  //-----------------------------------------------------------------------------------------------
  //-----------------------------------------------------------------------------------------------
  //-----------------------------------------------------------------------------------------------
  //-----------------------------------------------------------------------------------------------
   

  Widget _crearEmail() {
    return TextField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ) , 
        hintText: 'Ingresa tu email',
        labelText: 'Email', 
        helperText: 'Ayudanos a encontrarte', 
        suffix: Icon(Icons.email), 
        icon: Icon(Icons.alternate_email), 
      ),
    ); 
  }

  Widget _crearPasswd() {
    return TextField(
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ) , 
        hintText: 'Ingresa tu Password',
        labelText: 'Password', 
        helperText: 'Ingresa tu password para acceder al sistema', 
        suffix: Icon(Icons.security), 
        icon: Icon(Icons.enhanced_encryption), 
      ),
    ); 
  }




}