import 'package:pet_domain/model/authentication/firebase_auth.dart';

abstract class UserRepository {
  Future<FireBaseAuthResult> signInWithFirebaseAuth(String email,String password);
}
