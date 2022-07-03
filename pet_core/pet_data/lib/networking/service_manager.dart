import 'package:pet_data/data_source/data_storage.dart';
import 'package:pet_data/networking/firebase_service/firebase_service.dart';
import 'package:pet_domain/model/authentication/firebase_auth.dart';
import 'package:pet_domain/repository/log_service.dart';

class ServiceManager {
  late final FireBaseService _fireBaseService;
  ServiceManager(DataStorage dataStorage, LogService logService) {
    // _fireBaseService = fireBaseService;
  }

  Future<FireBaseAuthResult> signInWithEmailAndPassword(
      String email, String password) {
    return _fireBaseService.signInWithEmailAndPassword(email, password);
  }
}
