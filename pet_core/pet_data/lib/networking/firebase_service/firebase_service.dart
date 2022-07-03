import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet_domain/model/authentication/firebase_auth.dart';

class FireBaseService {
  final FirebaseAuth _firebaseAuth;
  FireBaseService(this._firebaseAuth);
  Future<FireBaseAuthResult> signInWithEmailAndPassword(
      String email, String password) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    return FireBaseAuthResult(userName: userCredential.user?.email);
  }
}
