// ignore_for_file: constant_identifier_names
import 'package:pet_domain/exception/business_exception.dart';
import 'package:pet_domain/exception/business_exception_code.dart';

const GLOBAL_BUSINESS_EXCEPTION_CODE = [
  BusinessExceptionCode.UNAUTHORIZED,
  BusinessExceptionCode.UNEXPECTED_ERROR
];

class AppGlobalExceptionHandler {
  AppGlobalExceptionHandler();

  bool isGlobalException(BusinessException businessException) {
    return GLOBAL_BUSINESS_EXCEPTION_CODE
        .contains(businessException.businessExceptionCode);
  }

  bool handleGlobalException(
      BusinessException exception, StackTrace? stackTrace) {
    if (exception.businessExceptionCode == BusinessExceptionCode.UNAUTHORIZED) {
      // if (router.location != SignInModule.routeName) {
      //   router.goNamed(SignInModule.routeName, extra: {'forcedLogout': true});
      // }

      return false;
    }
    if (exception.businessExceptionCode ==
        BusinessExceptionCode.UNEXPECTED_ERROR) {
     // router.goNamed(ErrorScreen.routeName, extra: exception);
    }

    // TODO: handle other exception here and move to ErrorScreen
    // FirebaseCrashlytics.instance.recordError(exception, stackTrace);
    return false;
  }
}
