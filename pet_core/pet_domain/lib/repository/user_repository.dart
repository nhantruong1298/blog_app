import 'package:pet_domain/model/user/google_sign_in.dart';

abstract class UserRepository {
  Future<GoogleSignInResult?> signInWithGoogle();
}
