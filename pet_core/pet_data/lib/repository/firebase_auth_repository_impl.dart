import 'package:pet_data/networking/service_manager.dart';
import 'package:pet_domain/model/authentication/firebase_auth.dart';
import 'package:pet_domain/repository/firebase_auth_repository.dart';

class FirebaseAuthRepositoryImpl extends FirebaseAuthRepository {
  final ServiceManager _serviceManager;
  FirebaseAuthRepositoryImpl(this._serviceManager);
  @override
  Future<SignInWithEmailResult> signInWithEmailAndPassword(
      String email, String password) async {
    final response =
        await _serviceManager.signInWithEmailAndPassword(email, password);

    return SignInWithEmailResult(userName: response.userName,userId: response.userId);
  }
}
