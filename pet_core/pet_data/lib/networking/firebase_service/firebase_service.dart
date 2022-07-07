import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet_data/mapper/error_data_mapper.dart';
import 'package:pet_domain/exception/business_exception.dart';
import 'package:pet_domain/model/authentication/firebase_auth.dart';
import 'package:pet_domain/repository/log_service.dart';

class FireBaseService {
  final FirebaseAuth _firebaseAuth;
  final LogService _logService;
  FireBaseService(this._firebaseAuth, this._logService);

  Future<FireBaseAuthResult> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return FireBaseAuthResult(userName: result.user?.displayName);
    } catch (error) {
      throw _mapError(error);
    }
  }

  BusinessException _mapError(Object error) {
    _logService.error(error);
    return ErrorDataMapper.mapFirebaseException(error);
  }
}
