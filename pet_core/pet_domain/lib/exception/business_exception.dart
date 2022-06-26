import 'package:pet_domain/exception/business_exception_code.dart';

class BusinessException implements Exception {
  final BusinessExceptionCode businessExceptionCode;
  // final ExceptionReference? exceptionReference;
  final String? dataExceptionCode;
  final String? debugMessage;
  final String? extraJson;
  final String? exceptionType;
  final dynamic originalException;
  // late List<ExceptionReference> errorDetails;

  BusinessException({
    required this.businessExceptionCode,
    // this.exceptionReference,
    this.dataExceptionCode,
    this.debugMessage,
    this.extraJson,
    this.exceptionType,
    this.originalException,
    // this.errorDetails = const []
  });

  @override
  String toString() {
    return 'BusinessException(businessExceptionCode: ${businessExceptionCode.toString()}, dataExceptionCode: $dataExceptionCode, debugMessage: $debugMessage, extraJson: $extraJson, exceptionType: $exceptionType, originalException: ${originalException?.toString()})';
  }
}
