import 'package:ascension_mobile_app/models/user.dart';

abstract class UserRepository {
  Future<User?> getUser();
  Future<void> createNewUser({required Map<String, dynamic> user, required String uuid});
  User? get getLoggedInUser;
}
