import 'package:pet_data/networking/service_manager.dart';
import 'package:pet_domain/model/authentication/firebase_auth.dart';
import 'package:pet_domain/repository/firebase_repository.dart';

class FirebaseRepositoryImpl extends FirebaseRepository {
  final ServiceManager _serviceManager;
  FirebaseRepositoryImpl(this._serviceManager);
  @override
  Future<FireBaseAuthResult> signInWithEmailAndPassword(
      String email, String password) async {
    return _serviceManager.signInWithEmailAndPassword(email, password);
  }
}
