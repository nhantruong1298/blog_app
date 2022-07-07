import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet_data/data_source/data_storage.dart';
import 'package:pet_data/networking/firebase_service/firebase_service.dart';
import 'package:pet_domain/model/authentication/firebase_auth.dart';
import 'package:pet_domain/repository/log_service.dart';

class ServiceManager {
  late final FireBaseService _fireBaseService;
  late final DataStorage _dataStorage;
  late final LogService _logService;

  static ServiceManager? _instance;
  ServiceManager._internal();

  factory ServiceManager(DataStorage dataStorage, LogService logService) {
    if (_instance != null) {
      return _instance!;
    }

    _instance = ServiceManager._internal();
    _instance!._dataStorage = dataStorage;
    _instance!._logService = logService;
    _instance!._fireBaseService =
        FireBaseService(FirebaseAuth.instance, _instance!._logService);

    return _instance!;
  }

  Future<FireBaseAuthResult> signInWithEmailAndPassword(
      String email, String password) {
    return _fireBaseService.signInWithEmailAndPassword(email, password);
  }
}
