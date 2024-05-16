
class BIException implements Exception {

  String? code;

  final String message;

  BIException({this.code, required this.message});

}