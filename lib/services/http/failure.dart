class Failure implements Exception {
  final String message;
  Failure({this.message = 'Something went wrong'});
}

class Failure2 implements Exception {
  final String message;
  final String userId;
  Failure2({this.message = 'Something went wrong', required this.userId});
}

class Failure3 implements Exception {
  final Map<String, dynamic> data;
  Failure3({required this.data});
}
