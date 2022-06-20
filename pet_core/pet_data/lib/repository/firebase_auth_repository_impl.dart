import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet_domain/model/authentication/firebase_auth.dart';
import 'package:pet_domain/repository/firebase_auth_repository.dart';

class FirebaseAuthRepositoryImpl extends FirebaseAuthRepository {
  final FirebaseAuth _firebaseAuth;
  FirebaseAuthRepositoryImpl(this._firebaseAuth);
  @override
  Future<FireBaseAuthResult> signInWithEmailAndPassword(
      String email, String password) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    return FireBaseAuthResult(userName: userCredential.user?.email);
  }
}
