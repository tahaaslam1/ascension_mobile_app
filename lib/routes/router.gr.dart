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
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:auto_route/empty_router_widgets.dart' as _i5;
import 'package:flutter/material.dart' as _i20;

import '../presentation/screens/auth_wrapper_screen/auth_wrapper_screen.dart'
    as _i2;
import '../presentation/screens/buyer_homepage_screen/buyer_homepage_screen.dart'
    as _i9;
import '../presentation/screens/edit_profile_screen/edit_profile_screen.dart'
    as _i16;
import '../presentation/screens/filter_screen/filter_screen.dart' as _i10;
import '../presentation/screens/home_screen/home_screen.dart' as _i6;
import '../presentation/screens/listing_screen/listing_screen.dart' as _i12;
import '../presentation/screens/login_screen/login_screen.dart' as _i17;
import '../presentation/screens/messages_screen/messages_screen.dart' as _i14;
import '../presentation/screens/navigator_screen/navigator_screen.dart' as _i4;
import '../presentation/screens/playground_screen/playground_screen.dart'
    as _i7;
import '../presentation/screens/profile_screen/profile_screen.dart' as _i15;
import '../presentation/screens/registration_screen/registration_flow_screen.dart'
    as _i18;
import '../presentation/screens/search_screen/search_screen.dart' as _i11;
import '../presentation/screens/single_listing_screen/single_listing_screen.dart'
    as _i13;
import '../presentation/screens/splash_screen/splash_screen.dart' as _i1;
import '../presentation/screens/unauth_wrapper_screen/unauth_wrapper_screen.dart'
    as _i3;
import '../presentation/screens/view_biding_screen/view_biding_screen.dart'
    as _i8;

class AppRouter extends _i19.RootStackRouter {
  AppRouter([_i20.GlobalKey<_i20.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i19.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    AuthWrapperRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.AuthWrapperScreen(),
      );
    },
    UnAuthWrapperRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.UnAuthWrapperScreen(),
      );
    },
    NavigatorRoute.name: (routeData) {
      final args = routeData.argsAs<NavigatorRouteArgs>(
          orElse: () => const NavigatorRouteArgs());
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.NavigatorScreen(key: args.key),
      );
    },
    HomeRouter.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.EmptyRouterPage(),
      );
    },
    ListingRouter.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.EmptyRouterPage(),
      );
    },
    MessagesRouter.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.EmptyRouterPage(),
      );
    },
    ProfileRouter.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.EmptyRouterPage(),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.HomeScreen(key: args.key),
      );
    },
    PlaygroundRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.PlaygroundScreen(),
        fullscreenDialog: true,
      );
    },
    ViewBidingRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.ViewBidingScreen(),
      );
    },
    BuyerHomePageRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.BuyerHomePageScreen(),
      );
    },
    FilterRoute.name: (routeData) {
      final args = routeData.argsAs<FilterRouteArgs>(
          orElse: () => const FilterRouteArgs());
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.FilterScreen(key: args.key),
      );
    },
    SearchRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.SearchScreen(),
      );
    },
    ListingRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.ListingScreen(),
      );
    },
    SingleListingRoute.name: (routeData) {
      final args = routeData.argsAs<SingleListingRouteArgs>(
          orElse: () => const SingleListingRouteArgs());
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.SingleListingScreen(key: args.key),
      );
    },
    MessagesRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.MessagesScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.ProfileScreen(),
      );
    },
    EditProfileRoute.name: (routeData) {
      final args = routeData.argsAs<EditProfileRouteArgs>(
          orElse: () => const EditProfileRouteArgs());
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i16.EditProfileScreen(key: args.key),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i17.LoginScreen(key: args.key),
      );
    },
    RegistrationFlowRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i18.RegistrationFlowScreen(),
      );
    },
  };

  @override
  List<_i19.RouteConfig> get routes => [
        _i19.RouteConfig(
          SplashRoute.name,
          path: 'splash',
        ),
        _i19.RouteConfig(
          AuthWrapperRoute.name,
          path: '/auth',
          children: [
            _i19.RouteConfig(
              NavigatorRoute.name,
              path: '',
              parent: AuthWrapperRoute.name,
              children: [
                _i19.RouteConfig(
                  HomeRouter.name,
                  path: 'home-screen',
                  parent: NavigatorRoute.name,
                  children: [
                    _i19.RouteConfig(
                      HomeRoute.name,
                      path: '',
                      parent: HomeRouter.name,
                    ),
                    _i19.RouteConfig(
                      PlaygroundRoute.name,
                      path: 'playground',
                      parent: HomeRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    _i19.RouteConfig(
                      ViewBidingRoute.name,
                      path: 'view-biding-screen',
                      parent: HomeRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    _i19.RouteConfig(
                      BuyerHomePageRoute.name,
                      path: 'buyer-homepage-screen',
                      parent: HomeRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    _i19.RouteConfig(
                      FilterRoute.name,
                      path: 'filter-screen',
                      parent: HomeRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    _i19.RouteConfig(
                      SearchRoute.name,
                      path: 'search-screen',
                      parent: HomeRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                  ],
                ),
                _i19.RouteConfig(
                  ListingRouter.name,
                  path: 'listing-screen',
                  parent: NavigatorRoute.name,
                  children: [
                    _i19.RouteConfig(
                      ListingRoute.name,
                      path: '',
                      parent: ListingRouter.name,
                    ),
                    _i19.RouteConfig(
                      SingleListingRoute.name,
                      path: 'single-lising-screen',
                      parent: ListingRouter.name,
                    ),
                    _i19.RouteConfig(
                      ViewBidingRoute.name,
                      path: 'view-biding-screen',
                      parent: ListingRouter.name,
                    ),
                  ],
                ),
                _i19.RouteConfig(
                  MessagesRouter.name,
                  path: 'messages-screen',
                  parent: NavigatorRoute.name,
                  children: [
                    _i19.RouteConfig(
                      MessagesRoute.name,
                      path: '',
                      parent: MessagesRouter.name,
                    )
                  ],
                ),
                _i19.RouteConfig(
                  ProfileRouter.name,
                  path: 'profile-screen',
                  parent: NavigatorRoute.name,
                  children: [
                    _i19.RouteConfig(
                      ProfileRoute.name,
                      path: '',
                      parent: ProfileRouter.name,
                    ),
                    _i19.RouteConfig(
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
        _i19.RouteConfig(
          UnAuthWrapperRoute.name,
          path: '/unauth',
          children: [
            _i19.RouteConfig(
              '#redirect',
              path: '',
              parent: UnAuthWrapperRoute.name,
              redirectTo: 'login',
              fullMatch: true,
            ),
            _i19.RouteConfig(
              LoginRoute.name,
              path: 'login',
              parent: UnAuthWrapperRoute.name,
            ),
            _i19.RouteConfig(
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
class SplashRoute extends _i19.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: 'splash',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.AuthWrapperScreen]
class AuthWrapperRoute extends _i19.PageRouteInfo<void> {
  const AuthWrapperRoute({List<_i19.PageRouteInfo>? children})
      : super(
          AuthWrapperRoute.name,
          path: '/auth',
          initialChildren: children,
        );

  static const String name = 'AuthWrapperRoute';
}

/// generated route for
/// [_i3.UnAuthWrapperScreen]
class UnAuthWrapperRoute extends _i19.PageRouteInfo<void> {
  const UnAuthWrapperRoute({List<_i19.PageRouteInfo>? children})
      : super(
          UnAuthWrapperRoute.name,
          path: '/unauth',
          initialChildren: children,
        );

  static const String name = 'UnAuthWrapperRoute';
}

/// generated route for
/// [_i4.NavigatorScreen]
class NavigatorRoute extends _i19.PageRouteInfo<NavigatorRouteArgs> {
  NavigatorRoute({
    _i20.Key? key,
    List<_i19.PageRouteInfo>? children,
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

  final _i20.Key? key;

  @override
  String toString() {
    return 'NavigatorRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.EmptyRouterPage]
class HomeRouter extends _i19.PageRouteInfo<void> {
  const HomeRouter({List<_i19.PageRouteInfo>? children})
      : super(
          HomeRouter.name,
          path: 'home-screen',
          initialChildren: children,
        );

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class ListingRouter extends _i19.PageRouteInfo<void> {
  const ListingRouter({List<_i19.PageRouteInfo>? children})
      : super(
          ListingRouter.name,
          path: 'listing-screen',
          initialChildren: children,
        );

  static const String name = 'ListingRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class MessagesRouter extends _i19.PageRouteInfo<void> {
  const MessagesRouter({List<_i19.PageRouteInfo>? children})
      : super(
          MessagesRouter.name,
          path: 'messages-screen',
          initialChildren: children,
        );

  static const String name = 'MessagesRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class ProfileRouter extends _i19.PageRouteInfo<void> {
  const ProfileRouter({List<_i19.PageRouteInfo>? children})
      : super(
          ProfileRouter.name,
          path: 'profile-screen',
          initialChildren: children,
        );

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i6.HomeScreen]
class HomeRoute extends _i19.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i20.Key? key})
      : super(
          HomeRoute.name,
          path: '',
          args: HomeRouteArgs(key: key),
        );

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.PlaygroundScreen]
class PlaygroundRoute extends _i19.PageRouteInfo<void> {
  const PlaygroundRoute()
      : super(
          PlaygroundRoute.name,
          path: 'playground',
        );

  static const String name = 'PlaygroundRoute';
}

/// generated route for
/// [_i8.ViewBidingScreen]
class ViewBidingRoute extends _i19.PageRouteInfo<void> {
  const ViewBidingRoute()
      : super(
          ViewBidingRoute.name,
          path: 'view-biding-screen',
        );

  static const String name = 'ViewBidingRoute';
}

/// generated route for
/// [_i9.BuyerHomePageScreen]
class BuyerHomePageRoute extends _i19.PageRouteInfo<void> {
  const BuyerHomePageRoute()
      : super(
          BuyerHomePageRoute.name,
          path: 'buyer-homepage-screen',
        );

  static const String name = 'BuyerHomePageRoute';
}

/// generated route for
/// [_i10.FilterScreen]
class FilterRoute extends _i19.PageRouteInfo<FilterRouteArgs> {
  FilterRoute({_i20.Key? key})
      : super(
          FilterRoute.name,
          path: 'filter-screen',
          args: FilterRouteArgs(key: key),
        );

  static const String name = 'FilterRoute';
}

class FilterRouteArgs {
  const FilterRouteArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'FilterRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.SearchScreen]
class SearchRoute extends _i19.PageRouteInfo<void> {
  const SearchRoute()
      : super(
          SearchRoute.name,
          path: 'search-screen',
        );

  static const String name = 'SearchRoute';
}

/// generated route for
/// [_i12.ListingScreen]
class ListingRoute extends _i19.PageRouteInfo<void> {
  const ListingRoute()
      : super(
          ListingRoute.name,
          path: '',
        );

  static const String name = 'ListingRoute';
}

/// generated route for
/// [_i13.SingleListingScreen]
class SingleListingRoute extends _i19.PageRouteInfo<SingleListingRouteArgs> {
  SingleListingRoute({_i20.Key? key})
      : super(
          SingleListingRoute.name,
          path: 'single-lising-screen',
          args: SingleListingRouteArgs(key: key),
        );

  static const String name = 'SingleListingRoute';
}

class SingleListingRouteArgs {
  const SingleListingRouteArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'SingleListingRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i14.MessagesScreen]
class MessagesRoute extends _i19.PageRouteInfo<void> {
  const MessagesRoute()
      : super(
          MessagesRoute.name,
          path: '',
        );

  static const String name = 'MessagesRoute';
}

/// generated route for
/// [_i15.ProfileScreen]
class ProfileRoute extends _i19.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i16.EditProfileScreen]
class EditProfileRoute extends _i19.PageRouteInfo<EditProfileRouteArgs> {
  EditProfileRoute({_i20.Key? key})
      : super(
          EditProfileRoute.name,
          path: 'edit-profile-screen',
          args: EditProfileRouteArgs(key: key),
        );

  static const String name = 'EditProfileRoute';
}

class EditProfileRouteArgs {
  const EditProfileRouteArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'EditProfileRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i17.LoginScreen]
class LoginRoute extends _i19.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i20.Key? key})
      : super(
          LoginRoute.name,
          path: 'login',
          args: LoginRouteArgs(key: key),
        );

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i18.RegistrationFlowScreen]
class RegistrationFlowRoute extends _i19.PageRouteInfo<void> {
  const RegistrationFlowRoute()
      : super(
          RegistrationFlowRoute.name,
          path: 'register',
        );

  static const String name = 'RegistrationFlowRoute';
}
