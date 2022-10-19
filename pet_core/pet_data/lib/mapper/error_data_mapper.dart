import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet_domain/exception/business_exception.dart';
import 'package:pet_domain/exception/business_exception_code.dart';

class ErrorDataMapper {
  static const String UNKNOW_ERROR_MESSAGE = "Wrong error response syntax";

  static BusinessException mapFirebaseException(dynamic data) {
    if (data is BusinessException) {
      return data;
    }
    if (data is FirebaseAuthException) {
      return BusinessException(
          businessExceptionCode:
              _errorMapper[data.code] ?? BusinessExceptionCode.UNEXPECTED_ERROR,
          debugMessage: data.message,
          originalException: data);
    }

    return BusinessException(
      businessExceptionCode: BusinessExceptionCode.UNEXPECTED_ERROR,
      debugMessage: UNKNOW_ERROR_MESSAGE,
      originalException: data,
    );
  }

  static final Map<String, BusinessExceptionCode> _errorMapper = {
    'user-not-found': BusinessExceptionCode.USER_NOT_FOUND,
    'wrong-password': BusinessExceptionCode.PASSWORD_INVALID,
    'network-request-failed': BusinessExceptionCode.NETWORK_ERROR,
    
  };
}
