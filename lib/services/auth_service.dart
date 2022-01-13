import 'package:firebase_auth/firebase_auth.dart';

class AuthClass {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future createNewUser(String email, String password) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    }catch(e){
      print(e.toString());
    }
  }

  Future signInWithEmail (String email, String password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }catch(e){
      print(e.toString());
    }
  }

  Future resendPassword(email)async {
    return _auth.sendPasswordResetEmail(email: email);
  }
}



/*
class AuthClass extends ChangeNotifier{
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount ? _user ;
  GoogleSignInAccount get user => _user! ;

  Future<void> googleLogin (BuildContext context) async{
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser != null) return;
      _user =googleUser;
      final googleAuth = await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,accessToken: googleAuth.accessToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      notifyListeners();
    } catch (e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
  Future <void> logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
*/