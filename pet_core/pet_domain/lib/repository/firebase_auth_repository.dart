import 'package:pet_domain/model/authentication/firebase_auth.dart';

abstract class FirebaseAuthRepository {
  Future<SignInWithEmailResult> signInWithEmailAndPassword(
      String email, String password);
}
