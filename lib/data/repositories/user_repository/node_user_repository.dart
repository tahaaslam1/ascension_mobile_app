import 'package:ascension_mobile_app/data/repositories/user_repository/user_repository.dart';
import 'package:ascension_mobile_app/models/user.dart';
import 'package:ascension_mobile_app/services/helper_service.dart';
import 'package:ascension_mobile_app/services/secure_storage_service.dart';

class NodeUserRepository extends UserRepository {
  User? _user;

  @override
  Future<void> createNewUser({required Map<String, dynamic> user, required String uuid}) {
    // TODO: implement createNewUser
    throw UnimplementedError();
  }

  @override
  User? get getLoggedInUser => _user;

  @override
  Future<User?> getUser() async {
    final token = await SecureStorageService.getToken('token');

    if (token == null) {
      return null;
    } else {
      Map<String, dynamic> userMap = HelperService.decodeJwtToken(token: token);

      _user = User.fromMap(userMap);
      return _user;
    }
  }
}
