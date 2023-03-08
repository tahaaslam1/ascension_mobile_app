// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i27;
import 'package:auto_route/empty_router_widgets.dart' as _i5;
import 'package:flutter/material.dart' as _i28;

import '../presentation/screens/auth_wrapper_screen/auth_wrapper_screen.dart'
    as _i2;
import '../presentation/screens/buyer-onboarding-screen/buyer_onboarding_form_flow_screen.dart'
    as _i15;
import '../presentation/screens/buyer_homepage_screen/buyer_homepage_screen.dart'
    as _i16;
import '../presentation/screens/edit_profile_screen/edit_profile_screen.dart'
    as _i20;
import '../presentation/screens/edit_single_listing_screen/edit_single_lisitng_screen.dart'
    as _i18;
import '../presentation/screens/email_verification_screen/email_verification_screen.dart'
    as _i13;
import '../presentation/screens/favourite-listing-screen.dart/favourite_listing_screen.dart'
    as _i11;
import '../presentation/screens/filter_screen/filter_screen.dart' as _i12;
import '../presentation/screens/home_screen/home_screen.dart' as _i6;
import '../presentation/screens/listing_form/listing_form_flow_screen.dart'
    as _i22;
import '../presentation/screens/listing_screen/listing_screen.dart' as _i21;
import '../presentation/screens/login_screen/login_screen.dart' as _i25;
import '../presentation/screens/messages_screen/chat_screen.dart' as _i24;
import '../presentation/screens/messages_screen/messages_screen.dart' as _i23;
import '../presentation/screens/milestone-screen/milestone_screen.dart' as _i9;
import '../presentation/screens/navigator_screen/navigator_screen.dart' as _i4;
import '../presentation/screens/placing_bid_screen/placing_bid_screen.dart'
    as _i10;
import '../presentation/screens/playground_screen/playground_screen.dart'
    as _i7;
import '../presentation/screens/profile_screen/profile_screen.dart' as _i19;
import '../presentation/screens/registration_screen/registration_flow_screen.dart'
    as _i26;
import '../presentation/screens/search_screen/search_screen.dart' as _i14;
import '../presentation/screens/single_listing_screen/single_listing_screen.dart'
    as _i17;
import '../presentation/screens/splash_screen/splash_screen.dart' as _i1;
import '../presentation/screens/unauth_wrapper_screen/unauth_wrapper_screen.dart'
    as _i3;
import '../presentation/screens/view_biding_screen/view_biding_screen.dart'
    as _i8;

class AppRouter extends _i27.RootStackRouter {
  AppRouter([_i28.GlobalKey<_i28.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i27.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    AuthWrapperRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.AuthWrapperScreen(),
      );
    },
    UnAuthWrapperRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.UnAuthWrapperScreen(),
      );
    },
    NavigatorRoute.name: (routeData) {
      final args = routeData.argsAs<NavigatorRouteArgs>(
          orElse: () => const NavigatorRouteArgs());
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.NavigatorScreen(key: args.key),
      );
    },
    HomeRouter.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.EmptyRouterPage(),
      );
    },
    ListingRouter.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.EmptyRouterPage(),
      );
    },
    MessagesRouter.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.EmptyRouterPage(),
      );
    },
    ProfileRouter.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.EmptyRouterPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.HomeScreen(),
      );
    },
    PlaygroundRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.PlaygroundScreen(),
        fullscreenDialog: true,
      );
    },
    ViewBidingRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.ViewBidingScreen(),
      );
    },
    MileStoneRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.MileStoneScreen(),
      );
    },
    PlacingBidRoute.name: (routeData) {
      final args = routeData.argsAs<PlacingBidRouteArgs>(
          orElse: () => const PlacingBidRouteArgs());
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.PlacingBidScreen(key: args.key),
      );
    },
    FavouriteListingRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.FavouriteListingScreen(),
      );
    },
    FilterRoute.name: (routeData) {
      final args = routeData.argsAs<FilterRouteArgs>(
          orElse: () => const FilterRouteArgs());
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.FilterScreen(key: args.key),
      );
    },
    EmailVerificationRoute.name: (routeData) {
      final args = routeData.argsAs<EmailVerificationRouteArgs>();
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.EmailVerificationScreen(
          key: args.key,
          email: args.email,
        ),
      );
    },
    SearchRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.SearchScreen(),
      );
    },
    BuyerOnboardingFormFlowRoute.name: (routeData) {
      final args = routeData.argsAs<BuyerOnboardingFormFlowRouteArgs>(
          orElse: () => const BuyerOnboardingFormFlowRouteArgs());
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i15.BuyerOnboardingFormFlowScreen(key: args.key),
      );
    },
    BuyerHomePageRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i16.BuyerHomePageScreen(),
      );
    },
    SingleListingRoute.name: (routeData) {
      final args = routeData.argsAs<SingleListingRouteArgs>();
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i17.SingleListingScreen(
          key: args.key,
          listingId: args.listingId,
          industry: args.industry,
        ),
      );
    },
    EditSingleListingRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i18.EditSingleListingScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i19.ProfileScreen(),
      );
    },
    EditProfileRoute.name: (routeData) {
      final args = routeData.argsAs<EditProfileRouteArgs>(
          orElse: () => const EditProfileRouteArgs());
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i20.EditProfileScreen(key: args.key),
      );
    },
    ListingRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i21.ListingScreen(),
      );
    },
    ListingFormFlowRoute.name: (routeData) {
      final args = routeData.argsAs<ListingFormFlowRouteArgs>(
          orElse: () => const ListingFormFlowRouteArgs());
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i22.ListingFormFlowScreen(key: args.key),
      );
    },
    MessagesRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i23.MessagesScreen(),
      );
    },
    ChatRoute.name: (routeData) {
      final args = routeData.argsAs<ChatRouteArgs>();
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i24.ChatScreen(
          key: args.key,
          recipientId: args.recipientId,
          recipientFirstName: args.recipientFirstName,
          recipientLastName: args.recipientLastName,
          listingTitle: args.listingTitle,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i25.LoginScreen(key: args.key),
      );
    },
    RegistrationFlowRoute.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i26.RegistrationFlowScreen(),
      );
    },
  };

  @override
  List<_i27.RouteConfig> get routes => [
        _i27.RouteConfig(
          SplashRoute.name,
          path: 'splash',
        ),
        _i27.RouteConfig(
          AuthWrapperRoute.name,
          path: '/auth',
          children: [
            _i27.RouteConfig(
              NavigatorRoute.name,
              path: '',
              parent: AuthWrapperRoute.name,
              children: [
                _i27.RouteConfig(
                  HomeRouter.name,
                  path: 'home-screen',
                  parent: NavigatorRoute.name,
                  children: [
                    _i27.RouteConfig(
                      HomeRoute.name,
                      path: '',
                      parent: HomeRouter.name,
                    ),
                    _i27.RouteConfig(
                      PlaygroundRoute.name,
                      path: 'playground',
                      parent: HomeRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    _i27.RouteConfig(
                      ViewBidingRoute.name,
                      path: 'view-biding-screen',
                      parent: HomeRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    _i27.RouteConfig(
                      MileStoneRoute.name,
                      path: 'milestone-screen',
                      parent: HomeRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    _i27.RouteConfig(
                      PlacingBidRoute.name,
                      path: 'placing-bid-screen',
                      parent: HomeRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    _i27.RouteConfig(
                      FavouriteListingRoute.name,
                      path: 'favourite-listing-screen',
                      parent: HomeRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    _i27.RouteConfig(
                      FilterRoute.name,
                      path: 'filter-screen',
                      parent: HomeRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    _i27.RouteConfig(
                      EmailVerificationRoute.name,
                      path: 'verify-email',
                      parent: HomeRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    _i27.RouteConfig(
                      SearchRoute.name,
                      path: 'search-screen',
                      parent: HomeRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    _i27.RouteConfig(
                      BuyerOnboardingFormFlowRoute.name,
                      path: 'buyer-onboarding-form-flow-screen',
                      parent: HomeRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    _i27.RouteConfig(
                      BuyerHomePageRoute.name,
                      path: 'buyer-homepage-screen',
                      parent: HomeRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    _i27.RouteConfig(
                      ProfileRouter.name,
                      path: 'profile-screen',
                      parent: HomeRouter.name,
                      children: [
                        _i27.RouteConfig(
                          ProfileRoute.name,
                          path: '',
                          parent: ProfileRouter.name,
                        ),
                        _i27.RouteConfig(
                          EditProfileRoute.name,
                          path: 'edit-profile-screen',
                          parent: ProfileRouter.name,
                        ),
                      ],
                    ),
                    _i27.RouteConfig(
                      SingleListingRoute.name,
                      path: 'single-lising-screen',
                      parent: HomeRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    _i27.RouteConfig(
                      EditSingleListingRoute.name,
                      path: 'edit-listing-screen',
                      parent: HomeRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                  ],
                ),
                _i27.RouteConfig(
                  ListingRouter.name,
                  path: 'listing-screen',
                  parent: NavigatorRoute.name,
                  children: [
                    _i27.RouteConfig(
                      ListingRoute.name,
                      path: '',
                      parent: ListingRouter.name,
                    ),
                    _i27.RouteConfig(
                      SingleListingRoute.name,
                      path: 'single-lising-screen',
                      parent: ListingRouter.name,
                    ),
                    _i27.RouteConfig(
                      ListingFormFlowRoute.name,
                      path: 'listing-form-flow-screen',
                      parent: ListingRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    _i27.RouteConfig(
                      ViewBidingRoute.name,
                      path: 'view-biding-screen',
                      parent: ListingRouter.name,
                    ),
                    _i27.RouteConfig(
                      MileStoneRoute.name,
                      path: 'milestone-screen',
                      parent: ListingRouter.name,
                    ),
                  ],
                ),
                _i27.RouteConfig(
                  MessagesRouter.name,
                  path: 'messages-screen',
                  parent: NavigatorRoute.name,
                  children: [
                    _i27.RouteConfig(
                      MessagesRoute.name,
                      path: '',
                      parent: MessagesRouter.name,
                    ),
                    _i27.RouteConfig(
                      ChatRoute.name,
                      path: 'chat-screen',
                      parent: MessagesRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                  ],
                ),
                _i27.RouteConfig(
                  ProfileRouter.name,
                  path: 'profile-screen',
                  parent: NavigatorRoute.name,
                  children: [
                    _i27.RouteConfig(
                      ProfileRoute.name,
                      path: '',
                      parent: ProfileRouter.name,
                    ),
                    _i27.RouteConfig(
                      EditProfileRoute.name,
                      path: 'edit-profile-screen',
                      parent: ProfileRouter.name,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
        _i27.RouteConfig(
          UnAuthWrapperRoute.name,
          path: '/unauth',
          children: [
            _i27.RouteConfig(
              '#redirect',
              path: '',
              parent: UnAuthWrapperRoute.name,
              redirectTo: 'login',
              fullMatch: true,
            ),
            _i27.RouteConfig(
              LoginRoute.name,
              path: 'login',
              parent: UnAuthWrapperRoute.name,
            ),
            _i27.RouteConfig(
              RegistrationFlowRoute.name,
              path: 'register',
              parent: UnAuthWrapperRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i27.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: 'splash',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.AuthWrapperScreen]
class AuthWrapperRoute extends _i27.PageRouteInfo<void> {
  const AuthWrapperRoute({List<_i27.PageRouteInfo>? children})
      : super(
          AuthWrapperRoute.name,
          path: '/auth',
          initialChildren: children,
        );

  static const String name = 'AuthWrapperRoute';
}

/// generated route for
/// [_i3.UnAuthWrapperScreen]
class UnAuthWrapperRoute extends _i27.PageRouteInfo<void> {
  const UnAuthWrapperRoute({List<_i27.PageRouteInfo>? children})
      : super(
          UnAuthWrapperRoute.name,
          path: '/unauth',
          initialChildren: children,
        );

  static const String name = 'UnAuthWrapperRoute';
}

/// generated route for
/// [_i4.NavigatorScreen]
class NavigatorRoute extends _i27.PageRouteInfo<NavigatorRouteArgs> {
  NavigatorRoute({
    _i28.Key? key,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          NavigatorRoute.name,
          path: '',
          args: NavigatorRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'NavigatorRoute';
}

class NavigatorRouteArgs {
  const NavigatorRouteArgs({this.key});

  final _i28.Key? key;

  @override
  String toString() {
    return 'NavigatorRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.EmptyRouterPage]
class HomeRouter extends _i27.PageRouteInfo<void> {
  const HomeRouter({List<_i27.PageRouteInfo>? children})
      : super(
          HomeRouter.name,
          path: 'home-screen',
          initialChildren: children,
        );

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class ListingRouter extends _i27.PageRouteInfo<void> {
  const ListingRouter({List<_i27.PageRouteInfo>? children})
      : super(
          ListingRouter.name,
          path: 'listing-screen',
          initialChildren: children,
        );

  static const String name = 'ListingRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class MessagesRouter extends _i27.PageRouteInfo<void> {
  const MessagesRouter({List<_i27.PageRouteInfo>? children})
      : super(
          MessagesRouter.name,
          path: 'messages-screen',
          initialChildren: children,
        );

  static const String name = 'MessagesRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class ProfileRouter extends _i27.PageRouteInfo<void> {
  const ProfileRouter({List<_i27.PageRouteInfo>? children})
      : super(
          ProfileRouter.name,
          path: 'profile-screen',
          initialChildren: children,
        );

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i6.HomeScreen]
class HomeRoute extends _i27.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i7.PlaygroundScreen]
class PlaygroundRoute extends _i27.PageRouteInfo<void> {
  const PlaygroundRoute()
      : super(
          PlaygroundRoute.name,
          path: 'playground',
        );

  static const String name = 'PlaygroundRoute';
}

/// generated route for
/// [_i8.ViewBidingScreen]
class ViewBidingRoute extends _i27.PageRouteInfo<void> {
  const ViewBidingRoute()
      : super(
          ViewBidingRoute.name,
          path: 'view-biding-screen',
        );

  static const String name = 'ViewBidingRoute';
}

/// generated route for
/// [_i9.MileStoneScreen]
class MileStoneRoute extends _i27.PageRouteInfo<void> {
  const MileStoneRoute()
      : super(
          MileStoneRoute.name,
          path: 'milestone-screen',
        );

  static const String name = 'MileStoneRoute';
}

/// generated route for
/// [_i10.PlacingBidScreen]
class PlacingBidRoute extends _i27.PageRouteInfo<PlacingBidRouteArgs> {
  PlacingBidRoute({_i28.Key? key})
      : super(
          PlacingBidRoute.name,
          path: 'placing-bid-screen',
          args: PlacingBidRouteArgs(key: key),
        );

  static const String name = 'PlacingBidRoute';
}

class PlacingBidRouteArgs {
  const PlacingBidRouteArgs({this.key});

  final _i28.Key? key;

  @override
  String toString() {
    return 'PlacingBidRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.FavouriteListingScreen]
class FavouriteListingRoute extends _i27.PageRouteInfo<void> {
  const FavouriteListingRoute()
      : super(
          FavouriteListingRoute.name,
          path: 'favourite-listing-screen',
        );

  static const String name = 'FavouriteListingRoute';
}

/// generated route for
/// [_i12.FilterScreen]
class FilterRoute extends _i27.PageRouteInfo<FilterRouteArgs> {
  FilterRoute({_i28.Key? key})
      : super(
          FilterRoute.name,
          path: 'filter-screen',
          args: FilterRouteArgs(key: key),
        );

  static const String name = 'FilterRoute';
}

class FilterRouteArgs {
  const FilterRouteArgs({this.key});

  final _i28.Key? key;

  @override
  String toString() {
    return 'FilterRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i13.EmailVerificationScreen]
class EmailVerificationRoute
    extends _i27.PageRouteInfo<EmailVerificationRouteArgs> {
  EmailVerificationRoute({
    _i28.Key? key,
    required String email,
  }) : super(
          EmailVerificationRoute.name,
          path: 'verify-email',
          args: EmailVerificationRouteArgs(
            key: key,
            email: email,
          ),
        );

  static const String name = 'EmailVerificationRoute';
}

class EmailVerificationRouteArgs {
  const EmailVerificationRouteArgs({
    this.key,
    required this.email,
  });

  final _i28.Key? key;

  final String email;

  @override
  String toString() {
    return 'EmailVerificationRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i14.SearchScreen]
class SearchRoute extends _i27.PageRouteInfo<void> {
  const SearchRoute()
      : super(
          SearchRoute.name,
          path: 'search-screen',
        );

  static const String name = 'SearchRoute';
}

/// generated route for
/// [_i15.BuyerOnboardingFormFlowScreen]
class BuyerOnboardingFormFlowRoute
    extends _i27.PageRouteInfo<BuyerOnboardingFormFlowRouteArgs> {
  BuyerOnboardingFormFlowRoute({_i28.Key? key})
      : super(
          BuyerOnboardingFormFlowRoute.name,
          path: 'buyer-onboarding-form-flow-screen',
          args: BuyerOnboardingFormFlowRouteArgs(key: key),
        );

  static const String name = 'BuyerOnboardingFormFlowRoute';
}

class BuyerOnboardingFormFlowRouteArgs {
  const BuyerOnboardingFormFlowRouteArgs({this.key});

  final _i28.Key? key;

  @override
  String toString() {
    return 'BuyerOnboardingFormFlowRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i16.BuyerHomePageScreen]
class BuyerHomePageRoute extends _i27.PageRouteInfo<void> {
  const BuyerHomePageRoute()
      : super(
          BuyerHomePageRoute.name,
          path: 'buyer-homepage-screen',
        );

  static const String name = 'BuyerHomePageRoute';
}

/// generated route for
/// [_i17.SingleListingScreen]
class SingleListingRoute extends _i27.PageRouteInfo<SingleListingRouteArgs> {
  SingleListingRoute({
    _i28.Key? key,
    required String listingId,
    required String? industry,
  }) : super(
          SingleListingRoute.name,
          path: 'single-lising-screen',
          args: SingleListingRouteArgs(
            key: key,
            listingId: listingId,
            industry: industry,
          ),
        );

  static const String name = 'SingleListingRoute';
}

class SingleListingRouteArgs {
  const SingleListingRouteArgs({
    this.key,
    required this.listingId,
    required this.industry,
  });

  final _i28.Key? key;

  final String listingId;

  final String? industry;

  @override
  String toString() {
    return 'SingleListingRouteArgs{key: $key, listingId: $listingId, industry: $industry}';
  }
}

/// generated route for
/// [_i18.EditSingleListingScreen]
class EditSingleListingRoute extends _i27.PageRouteInfo<void> {
  const EditSingleListingRoute()
      : super(
          EditSingleListingRoute.name,
          path: 'edit-listing-screen',
        );

  static const String name = 'EditSingleListingRoute';
}

/// generated route for
/// [_i19.ProfileScreen]
class ProfileRoute extends _i27.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i20.EditProfileScreen]
class EditProfileRoute extends _i27.PageRouteInfo<EditProfileRouteArgs> {
  EditProfileRoute({_i28.Key? key})
      : super(
          EditProfileRoute.name,
          path: 'edit-profile-screen',
          args: EditProfileRouteArgs(key: key),
        );

  static const String name = 'EditProfileRoute';
}

class EditProfileRouteArgs {
  const EditProfileRouteArgs({this.key});

  final _i28.Key? key;

  @override
  String toString() {
    return 'EditProfileRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i21.ListingScreen]
class ListingRoute extends _i27.PageRouteInfo<void> {
  const ListingRoute()
      : super(
          ListingRoute.name,
          path: '',
        );

  static const String name = 'ListingRoute';
}

/// generated route for
/// [_i22.ListingFormFlowScreen]
class ListingFormFlowRoute
    extends _i27.PageRouteInfo<ListingFormFlowRouteArgs> {
  ListingFormFlowRoute({_i28.Key? key})
      : super(
          ListingFormFlowRoute.name,
          path: 'listing-form-flow-screen',
          args: ListingFormFlowRouteArgs(key: key),
        );

  static const String name = 'ListingFormFlowRoute';
}

class ListingFormFlowRouteArgs {
  const ListingFormFlowRouteArgs({this.key});

  final _i28.Key? key;

  @override
  String toString() {
    return 'ListingFormFlowRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i23.MessagesScreen]
class MessagesRoute extends _i27.PageRouteInfo<void> {
  const MessagesRoute()
      : super(
          MessagesRoute.name,
          path: '',
        );

  static const String name = 'MessagesRoute';
}

/// generated route for
/// [_i24.ChatScreen]
class ChatRoute extends _i27.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    _i28.Key? key,
    required String? recipientId,
    required String recipientFirstName,
    required String recipientLastName,
    required String listingTitle,
  }) : super(
          ChatRoute.name,
          path: 'chat-screen',
          args: ChatRouteArgs(
            key: key,
            recipientId: recipientId,
            recipientFirstName: recipientFirstName,
            recipientLastName: recipientLastName,
            listingTitle: listingTitle,
          ),
        );

  static const String name = 'ChatRoute';
}

class ChatRouteArgs {
  const ChatRouteArgs({
    this.key,
    required this.recipientId,
    required this.recipientFirstName,
    required this.recipientLastName,
    required this.listingTitle,
  });

  final _i28.Key? key;

  final String? recipientId;

  final String recipientFirstName;

  final String recipientLastName;

  final String listingTitle;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key, recipientId: $recipientId, recipientFirstName: $recipientFirstName, recipientLastName: $recipientLastName, listingTitle: $listingTitle}';
  }
}

/// generated route for
/// [_i25.LoginScreen]
class LoginRoute extends _i27.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i28.Key? key})
      : super(
          LoginRoute.name,
          path: 'login',
          args: LoginRouteArgs(key: key),
        );

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i28.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i26.RegistrationFlowScreen]
class RegistrationFlowRoute extends _i27.PageRouteInfo<void> {
  const RegistrationFlowRoute()
      : super(
          RegistrationFlowRoute.name,
          path: 'register',
        );

  static const String name = 'RegistrationFlowRoute';
}
