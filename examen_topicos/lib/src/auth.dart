import 'package:firebase_auth/firebase_auth.dart';
class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future inicioConEyP(String email, String passw) async {

    try{
      final AuthResult authResult = await _auth.signInWithEmailAndPassword(
        email: email,
        password: passw
      );

        final FirebaseUser user = authResult.user; 

        return user;
    }catch(e){
      print('Error al vivir :[');
      return null;  
    }
    
  }

  Future registroConEyP(String email, String passw) async{
    try{
      final AuthResult authResult  = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: passw
      ); 
      final FirebaseUser user = authResult.user; 
      return user;
    }catch(e){
      print('error al nacer mi yave :v ');
      return null; 
    }
    
  }
}
