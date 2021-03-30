import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:store/models/users.dart';

class Authacation {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String activeUserId;

  Users users(FirebaseUser firebaseUser) {
    return firebaseUser == null ? null : Users.createFirebase(firebaseUser);
  }

  Stream<Users> get controlChange {
    return firebaseAuth.onAuthStateChanged.map(users);
  }

  Future<Users> singIn(String email, String password) async {
    AuthResult result = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return users(result.user);
  }

  Future<Users> singUp(String email, String password) async {
    AuthResult result = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return users(result.user);
  }

  Future<Users> singOut() async {
    await firebaseAuth.signOut();
  }

  Future<void> sendPassword(String email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<Users> googleWidth() async {
    GoogleSignInAccount signInAccount = await GoogleSignIn().signIn();
    GoogleSignInAuthentication signInAuthentication =
        await signInAccount.authentication;
    AuthCredential authCredential = await GoogleAuthProvider.getCredential(
      idToken: signInAuthentication.idToken,
      accessToken: signInAuthentication.accessToken,
    );
    AuthResult result = await firebaseAuth.signInWithCredential(authCredential);
    return users(result.user);
  }
}
