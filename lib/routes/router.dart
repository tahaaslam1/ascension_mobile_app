import 'package:ascension_mobile_app/presentation/screens/auth_wrapper_screen/auth_wrapper_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/buyer_screens/buyer_homepage_screen/buyer_homepage_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/buyer_screens/buyer_navigator_screen/buyer_navigator_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/buyer_screens/filter_screen/filter_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/seller_screens/seller_home_screen/seller_home_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/seller_screens/listing_form/listing_form_flow_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/seller_screens/listing_screen/listing_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/login_screen/login_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/messages_screen/chat_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/messages_screen/messages_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/seller_screens/seller_navigator_screen/seller_navigator_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/playground_screen/playground_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/profile_screen/profile_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/registration_screen/registration_flow_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/buyer_screens/search_screen/search_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/single_listing_screen/single_listing_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/splash_screen/splash_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/unauth_wrapper_screen/unauth_wrapper_screen.dart';
import 'package:ascension_mobile_app/presentation/screens/view_biding_screen/view_biding_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';

import '../presentation/screens/buyer_screens/buyer_onboarding_screen/buyer_onboarding_form_flow_screen.dart';
import '../presentation/screens/seller_screens/edit_single_listing_screen/edit_single_lisitng_screen.dart';
import '../presentation/screens/email_verification_screen/email_verification_screen.dart';
import '../presentation/screens/buyer_screens/favourite_listing_screen.dart/favourite_listing_screen.dart';
import '../presentation/screens/seller_screens/milestone_screen/milestone_screen.dart';
import '../presentation/screens/buyer_screens/placing_bid_screen/placing_bid_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: [
    AutoRoute(
      path: SplashScreen.route,
      page: SplashScreen,
    ),
    AutoRoute(
      path: AuthWrapperScreen.route,
      page: AuthWrapperScreen,
      children: [
        AutoRoute(
          path: BuyerNavigatorScreen.route,
          page: BuyerNavigatorScreen,
          children: [
            AutoRoute(
              path: BuyerHomeScreen.route,
              name: 'BuyerHomeRouter',
              page: EmptyRouterPage,
              children: [
                AutoRoute(
                  initial: true,
                  page: BuyerHomeScreen,
                ),
              ],
            ),
            AutoRoute(
              path: SearchScreen.route,
              name: 'SearchRouter',
              page: EmptyRouterPage,
              children: [
                AutoRoute(
                  initial: true,
                  page: SearchScreen,
                ),
                AutoRoute(
                  path: FilterScreen.route,
                  page: FilterScreen,
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
                AutoRoute(
                  path: EditProfileScreen.route,
                  page: EditProfileScreen,
                )
              ],
            ),
          ],
        ),
        AutoRoute(
          path: SellerNavigatorScreen.route,
          page: SellerNavigatorScreen,
          children: [
            AutoRoute(
              path: SellerHomeScreen.route,
              name: 'SellerHomeRouter',
              page: EmptyRouterPage,
              children: [
                AutoRoute(
                  initial: true,
                  page: SellerHomeScreen,
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

                AutoRoute(
                  path: MileStoneScreen.route,
                  page: MileStoneScreen,
                  meta: {'hideBottomNav': true},
                ),
                AutoRoute(
                  path: PlacingBidScreen.route,
                  page: PlacingBidScreen,
                  meta: {'hideBottomNav': true},
                ),
                AutoRoute(
                  path: FavouriteListingScreen.route,
                  page: FavouriteListingScreen,
                  meta: {'hideBottomNav': true},
                ),
                AutoRoute(
                  path: FilterScreen.route,
                  page: FilterScreen,
                  meta: {'hideBottomNav': true},
                ),
                AutoRoute(
                  path: EmailVerificationScreen.route,
                  page: EmailVerificationScreen,
                  meta: {'hideBottomNav': true},
                ),
                // AutoRoute(
                //   path: SearchScreen.route,
                //   page: SearchScreen,
                //   meta: {'hideBottomNav': true},
                // ),
                AutoRoute(
                  path: BuyerOnboardingFormFlowScreen.route,
                  page: BuyerOnboardingFormFlowScreen,
                  meta: {'hideBottomNav': true},
                ),
                // AutoRoute(
                //   path: BuyerHomePageScreen.route,
                //   page: BuyerHomePageScreen,
                //   meta: {'hideBottomNav': true},
                // ),
                // AutoRoute(
                //   path: ProfileScreen.route,
                //   page: ProfileScreen,
                //   meta: {'hideBottomNav': true},
                // ),
                // AutoRoute(
                //   path: EditProfileScreen.route,
                //   page: EditProfileScreen,
                //   meta: {'hideBottomNav': true},
                // ),
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
                AutoRoute(
                  path: SingleListingScreen.route,
                  page: SingleListingScreen,
                  meta: {'hideBottomNav': true},
                ),
                AutoRoute(
                  path: EditSingleListingScreen.route,
                  page: EditSingleListingScreen,
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
                AutoRoute(
                  path: MileStoneScreen.route,
                  page: MileStoneScreen,
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
                AutoRoute(
                  path: EditProfileScreen.route,
                  page: EditProfileScreen,
                )
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
