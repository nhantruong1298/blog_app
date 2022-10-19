import 'package:pet_domain/model/authentication/firebase_auth.dart';

abstract class FirebaseAuthRepository {
  Future<FireBaseAuthResult> signInWithEmailAndPassword(
      String email, String password);
}
