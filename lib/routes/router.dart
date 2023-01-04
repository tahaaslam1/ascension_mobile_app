import 'package:ascension_mobile_app/presentation/screens/auth_wrapper_screen/auth_wrapper_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/home_screen/home_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/listing_form/listing_form_flow_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/listing_screen/listing_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/login_screen/login_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/messages_screen/chat_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/messages_screen/messages_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/navigator_screen/navigator_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/playground_screen/playground_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/profile_screen/profile_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/registration_screen/registration_flow_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/single_listing_screen/single_listing_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/splash_screen/splash_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/unauth_wrapper_screen/unauth_wrapper_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/view_biding_screen/view_biding_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: [
    AutoRoute(
      // name: 'AuthenticatedStackRouter',
      path: SplashScreen.route,
      page: SplashScreen,
    ),
    AutoRoute(
      path: AuthWrapperScreen.route,
      page: AuthWrapperScreen,
      children: [
        AutoRoute(
          path: NavigatorScreen.route,
          page: NavigatorScreen,
          children: [
            AutoRoute(
              path: HomeScreen.route,
              name: 'HomeRouter',
              page: EmptyRouterPage,
              children: [
                AutoRoute(
                  initial: true,
                  page: HomeScreen,
                ),
                AutoRoute(
                  path: PlaygroundScreen.route,
                  page: PlaygroundScreen,
                  meta: {'hideBottomNav': true},
                  fullscreenDialog: true,
                ),
                AutoRoute(
                  path: ViewBidingScreen.route,
                  page: ViewBidingScreen,
                  meta: {'hideBottomNav': true},
                ),
              ],
            ),
            AutoRoute(
              path: ListingScreen.route,
              name: 'ListingRouter',
              page: EmptyRouterPage,
              children: [
                AutoRoute(
                  initial: true,
                  page: ListingScreen,
                ),
                AutoRoute(
                  path: SingleListingScreen.route,
                  page: SingleListingScreen,
                ),
                AutoRoute(
                  path: ListingFormFlowScreen.route,
                  page: ListingFormFlowScreen,
                  meta: {'hideBottomNav': true},
                ),
                AutoRoute(
                  path: ViewBidingScreen.route,
                  page: ViewBidingScreen,
                ),
              ],
            ),
            AutoRoute(
              path: MessagesScreen.route,
              name: 'MessagesRouter',
              page: EmptyRouterPage,
              children: [
                AutoRoute(
                  initial: true,
                  page: MessagesScreen,
                ),
                AutoRoute(
                  path: ChatScreen.route,
                  page: ChatScreen,
                  meta: {'hideBottomNav': true},
                )
              ],
            ),
            AutoRoute(
              path: ProfileScreen.route,
              name: 'ProfileRouter',
              page: EmptyRouterPage,
              children: [
                AutoRoute(
                  initial: true,
                  page: ProfileScreen,
                ),
                AutoRoute(path: EditProfileScreen.route, page: EditProfileScreen)
              ],
            ),
          ],
        )
      ],
    ),
    AutoRoute(
      path: UnAuthWrapperScreen.route,
      page: UnAuthWrapperScreen,
      children: [
        AutoRoute(
          path: LoginScreen.route,
          page: LoginScreen,
          initial: true,
        ),
        AutoRoute(
          path: RegistrationFlowScreen.route,
          page: RegistrationFlowScreen,
        ),
        // AutoRoute(
        //   path: EmailVerificationScreen.route,
        //   page: EmailVerificationScreen,
        // ),
      ],
    ),
  ],
)
class $AppRouter {}
