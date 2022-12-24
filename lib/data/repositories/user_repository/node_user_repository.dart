import 'package:ascension_mobile_app/data/repositories/user_repository/user_repository.dart';
import 'package:ascension_mobile_app/models/user.dart';

class NodeUserRepository extends UserRepository{
  @override
  Future<void> createNewUser({required Map<String, dynamic> user, required String uuid}) {
    // TODO: implement createNewUser
    throw UnimplementedError();
  }

  @override
  // TODO: implement getLoggedInUser
  User? get getLoggedInUser => throw UnimplementedError();

  @override
  Future<User?> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

}