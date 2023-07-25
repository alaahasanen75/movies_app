import 'package:flutter_application_1/core/netwoke/error_masage.dart';

class ServerException implements Exception {
  final ErrorModel error;

  ServerException(this.error);
}




class LocaldbException implements Exception {
  final String massage ;

  LocaldbException(this.massage);
}
