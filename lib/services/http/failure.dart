class Failure implements Exception {
  final String message;
  Failure({this.message = 'Something went wrong'});
}
