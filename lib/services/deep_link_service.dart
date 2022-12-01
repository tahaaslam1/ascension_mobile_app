// import 'dart:async';
// import 'package:doxa_mobile_app/data/repositories/auth_repository/auth_repository.dart';
// import 'package:doxa_mobile_app/logger.dart';
// import 'package:flutter/foundation.dart';
// import 'package:uni_links/uni_links.dart';

// class DeepLinkService {
//   StreamSubscription? _sub;
//   String? token;

//   Map<String, String> _getLinkData(Uri uri) {
//     String linkData = uri.fragment;
//     List<String> fragments = linkData.split('&');
//     Map<String, String> linkMap = {};
//     for (String fragment in fragments) {
//       List<String> keyValue = fragment.split('=');
//       linkMap[keyValue[0]] = keyValue[1];
//     }
//     return linkMap;
//   }

//   Future<void> handleIncomingDeepLinks({required AuthRepository authRepository}) async {
//     if (!kIsWeb) {
//       _sub = uriLinkStream.listen((Uri? uri) {
//         logger.i(uri);
//         if (uri != null && uri.hasFragment) {
//           Map<String, String> linkData = _getLinkData(uri);
//           if (linkData.containsKey('access_token')) {
//             logger.i(linkData);
//             authRepository.signInWithRefreshToken(uri);
//           }
//         }
//       }, onError: (err) {
//         logger.i(err);
//       });
//     }
//   }

//   void dispose() {
//     _sub?.cancel();
//   }
// }
