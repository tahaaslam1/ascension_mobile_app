import 'package:ascension_mobile_app/models/user.dart';
import 'package:image_picker/image_picker.dart';

abstract class UserRepository {
  Future<User?> getUser();
  Future<void> createNewUser({required Map<String, dynamic> user, required String uuid});
  User? get getLoggedInUser;
  Future<void> updateProfile({required String email, required String firstName, required lastName, XFile? profileUrl, required String userId, String? oldImage});
}
