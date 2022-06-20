import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet_domain/model/authentication/firebase_auth.dart';
import 'package:pet_domain/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl(this._firebaseAuth);
  late final FirebaseAuth _firebaseAuth;
  @override
  Future<FireBaseAuthResult> signInWithFirebaseAuth(
      String email, String password) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    return FireBaseAuthResult(userName: userCredential.user?.displayName);
  }

  // final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;

  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );

  //   // Once signed in, return the UserCredential
  //   final userCredential =
  //       await FirebaseAuth.instance.signInWithCredential(credential);

  //   return GoogleSignInResult();
}
