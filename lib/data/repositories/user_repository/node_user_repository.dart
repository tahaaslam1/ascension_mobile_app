import 'package:ascension_mobile_app/data/repositories/user_repository/user_repository.dart';
import 'package:ascension_mobile_app/models/user.dart';
import 'package:ascension_mobile_app/services/helper_service.dart';
import 'package:ascension_mobile_app/services/secure_storage_service.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants.dart';
import '../../../logger.dart';
import '../../../services/http/failure.dart';
import '../../../services/http/http_services.dart';

class NodeUserRepository extends UserRepository {
  User? _user;
  final HttpService _httpClient;
  NodeUserRepository({required HttpService httpService}) : _httpClient = httpService;
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

  @override
  Future<void> updateProfile({required String email, required firstName, required lastName, XFile? profileUrl, required userId, String? oldImage}) async {
    try {
      logger.d(firstName, lastName);
      logger.d(profileUrl, userId);
      String endpoint = '/updateUserProfile';
      if (profileUrl == null) {
        final Response response = await _httpClient.request<Map<String, dynamic>>(RequestMethod.put, endpoint,
            data: {'first_name': firstName, 'last_name': lastName, 'profile_picture': oldImage}, queryParameters: {'user_id': userId});
        await SecureStorageService.removeToken();
        await SecureStorageService.storeToken(key: 'token', token: response.data['data']['token']);
      } else {
        final cloudinary = CloudinaryPublic(cloudinaryCloudName, cloudinaryUploadPreset);
        CloudinaryResponse profile_image = await cloudinary.uploadFile(CloudinaryFile.fromFile(profileUrl!.path, resourceType: CloudinaryResourceType.Image));
        logger.d(profile_image.url);
        Response response = await _httpClient.request<Map<String, dynamic>>(RequestMethod.put, endpoint,
            data: {'first_name': firstName, 'last_name': lastName, 'profile_picture': profile_image.url.toString()}, queryParameters: {'user_id': userId});
        await SecureStorageService.removeToken();
        await SecureStorageService.storeToken(key: 'token', token: response.data['data']['token']);
        
      }
    } catch (_) {
      throw Failure();
    }
  }
}
