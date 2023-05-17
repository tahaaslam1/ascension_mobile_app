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
import 'package:auto_route/auto_route.dart' as _i30;
import 'package:auto_route/empty_router_widgets.dart' as _i6;
import 'package:flutter/material.dart' as _i31;

import '../presentation/screens/auth_wrapper_screen/auth_wrapper_screen.dart'
    as _i2;
import '../presentation/screens/buyer_screens/buyer_home_screen/buyer_home_screen.dart'
    as _i7;
import '../presentation/screens/buyer_screens/buyer_navigator_screen/buyer_navigator_screen.dart'
    as _i4;
import '../presentation/screens/buyer_screens/buyer_onboarding_screen/buyer_onboarding_form_flow_screen.dart'
    as _i24;
import '../presentation/screens/buyer_screens/favourite_listing_screen.dart/favourite_listing_screen.dart'
    as _i9;
import '../presentation/screens/buyer_screens/filter_screen/filter_screen.dart'
    as _i11;
import '../presentation/screens/buyer_screens/placing_bid_screen/placing_bid_screen.dart'
    as _i22;
import '../presentation/screens/buyer_screens/search_screen/search_screen.dart'
    as _i10;
import '../presentation/screens/edit_profile_screen/edit_profile_screen.dart'
    as _i18;
import '../presentation/screens/email_verification_screen/email_verification_screen.dart'
    as _i23;
import '../presentation/screens/login_screen/login_screen.dart' as _i28;
import '../presentation/screens/messages_screen/chat_screen.dart' as _i13;
import '../presentation/screens/messages_screen/messages_screen.dart' as _i12;
import '../presentation/screens/playground_screen/playground_screen.dart'
    as _i20;
import '../presentation/screens/profile_screen/profile_screen.dart' as _i17;
import '../presentation/screens/registration_screen/registration_flow_screen.dart'
    as _i29;
import '../presentation/screens/seller_screens/edit_single_listing_screen/edit_single_lisitng_screen.dart'
    as _i25;
import '../presentation/screens/seller_screens/listing_form/listing_form_flow_screen.dart'
    as _i27;
import '../presentation/screens/seller_screens/listing_screen/listing_screen.dart'
    as _i26;
import '../presentation/screens/seller_screens/milestone/craete_milestone_screen.dart'
    as _i15;
import '../presentation/screens/seller_screens/milestone/edit_milestone_screen.dart'
    as _i16;
import '../presentation/screens/seller_screens/milestone/milestone_screen.dart'
    as _i14;
import '../presentation/screens/seller_screens/seller_home_screen/seller_home_screen.dart'
    as _i19;
import '../presentation/screens/seller_screens/seller_navigator_screen/seller_navigator_screen.dart'
    as _i5;
import '../presentation/screens/single_listing_screen/single_listing_screen.dart'
    as _i8;
import '../presentation/screens/splash_screen/splash_screen.dart' as _i1;
import '../presentation/screens/unauth_wrapper_screen/unauth_wrapper_screen.dart'
    as _i3;
import '../presentation/screens/view_biding_screen/view_biding_screen.dart'
    as _i21;

class AppRouter extends _i30.RootStackRouter {
  AppRouter([_i31.GlobalKey<_i31.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i30.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    AuthWrapperRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.AuthWrapperScreen(),
      );
    },
    UnAuthWrapperRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.UnAuthWrapperScreen(),
      );
    },
    BuyerNavigatorRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.BuyerNavigatorScreen(),
      );
    },
    SellerNavigatorRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.SellerNavigatorScreen(),
      );
    },
    BuyerHomeRouter.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.EmptyRouterPage(),
      );
    },
    SearchRouter.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.EmptyRouterPage(),
      );
    },
    MessagesRouter.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.EmptyRouterPage(),
      );
    },
    ProfileRouter.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.EmptyRouterPage(),
      );
    },
    BuyerHomeRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.BuyerHomeScreen(),
      );
    },
    SingleListingRoute.name: (routeData) {
      final args = routeData.argsAs<SingleListingRouteArgs>();
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.SingleListingScreen(
          key: args.key,
          listingId: args.listingId,
          industry: args.industry,
        ),
      );
    },
    FavouriteListingRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.FavouriteListingScreen(),
      );
    },
    SearchRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.SearchScreen(),
      );
    },
    FilterRoute.name: (routeData) {
      final args = routeData.argsAs<FilterRouteArgs>(
          orElse: () => const FilterRouteArgs());
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.FilterScreen(key: args.key),
      );
    },
    MessagesRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.MessagesScreen(),
      );
    },
    ChatRoute.name: (routeData) {
      final args = routeData.argsAs<ChatRouteArgs>();
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.ChatScreen(
          key: args.key,
          recipientId: args.recipientId,
          recipientFirstName: args.recipientFirstName,
          recipientLastName: args.recipientLastName,
          listingTitle: args.listingTitle,
          listingId: args.listingId,
        ),
      );
    },
    MileStoneRoute.name: (routeData) {
      final args = routeData.argsAs<MileStoneRouteArgs>();
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i14.MileStoneScreen(
          key: args.key,
          buyerId: args.buyerId,
          sellerId: args.sellerId,
          buyerName: args.buyerName,
          listingTitle: args.listingTitle,
          listingId: args.listingId,
        ),
      );
    },
    CreateMileStoneRoute.name: (routeData) {
      final args = routeData.argsAs<CreateMileStoneRouteArgs>();
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i15.CreateMileStoneScreen(
          key: args.key,
          buyerId: args.buyerId,
          sellerId: args.sellerId,
          buyerName: args.buyerName,
          listingTitle: args.listingTitle,
          listingId: args.listingId,
        ),
      );
    },
    EditMilestoneRoute.name: (routeData) {
      final args = routeData.argsAs<EditMilestoneRouteArgs>();
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i16.EditMilestoneScreen(
          key: args.key,
          buyerId: args.buyerId,
          sellerId: args.sellerId,
          milestoneTitle: args.milestoneTitle,
          milestoneId: args.milestoneId,
          listingId: args.listingId,
          endDate: args.endDate,
          startDate: args.startDate,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.ProfileScreen(),
      );
    },
    EditProfileRoute.name: (routeData) {
      final args = routeData.argsAs<EditProfileRouteArgs>(
          orElse: () => const EditProfileRouteArgs());
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i18.EditProfileScreen(key: args.key),
      );
    },
    SellerHomeRouter.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.EmptyRouterPage(),
      );
    },
    ListingRouter.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.EmptyRouterPage(),
      );
    },
    SellerHomeRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i19.SellerHomeScreen(),
      );
    },
    PlaygroundRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i20.PlaygroundScreen(),
        fullscreenDialog: true,
      );
    },
    ViewBidingRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i21.ViewBidingScreen(),
      );
    },
    PlacingBidRoute.name: (routeData) {
      final args = routeData.argsAs<PlacingBidRouteArgs>(
          orElse: () => const PlacingBidRouteArgs());
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i22.PlacingBidScreen(key: args.key),
      );
    },
    EmailVerificationRoute.name: (routeData) {
      final args = routeData.argsAs<EmailVerificationRouteArgs>();
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i23.EmailVerificationScreen(
          key: args.key,
          email: args.email,
        ),
      );
    },
    BuyerOnboardingFormFlowRoute.name: (routeData) {
      final args = routeData.argsAs<BuyerOnboardingFormFlowRouteArgs>(
          orElse: () => const BuyerOnboardingFormFlowRouteArgs());
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i24.BuyerOnboardingFormFlowScreen(key: args.key),
      );
    },
    EditSingleListingRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i25.EditSingleListingScreen(),
      );
    },
    ListingRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i26.ListingScreen(),
      );
    },
    ListingFormFlowRoute.name: (routeData) {
      final args = routeData.argsAs<ListingFormFlowRouteArgs>(
          orElse: () => const ListingFormFlowRouteArgs());
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i27.ListingFormFlowScreen(key: args.key),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i28.LoginScreen(key: args.key),
      );
    },
    RegistrationFlowRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i29.RegistrationFlowScreen(),
      );
    },
  };

  @override
  List<_i30.RouteConfig> get routes => [
        _i30.RouteConfig(
          SplashRoute.name,
          path: 'splash',
        ),
        _i30.RouteConfig(
          AuthWrapperRoute.name,
          path: '/auth',
          children: [
            _i30.RouteConfig(
              BuyerNavigatorRoute.name,
              path: '',
              parent: AuthWrapperRoute.name,
              children: [
                _i30.RouteConfig(
                  BuyerHomeRouter.name,
                  path: 'buyer-home-screen',
                  parent: BuyerNavigatorRoute.name,
                  children: [
                    _i30.RouteConfig(
                      BuyerHomeRoute.name,
                      path: '',
                      parent: BuyerHomeRouter.name,
                    ),
                    _i30.RouteConfig(
                      SingleListingRoute.name,
                      path: 'single-lising-screen',
                      parent: BuyerHomeRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    _i30.RouteConfig(
                      SingleListingRoute.name,
                      path: 'single-lising-screen',
                      parent: BuyerHomeRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    _i30.RouteConfig(
                      FavouriteListingRoute.name,
                      path: 'favourite-listing-screen',
                      parent: BuyerHomeRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                  ],
                ),
                _i30.RouteConfig(
                  SearchRouter.name,
                  path: 'search-screen',
                  parent: BuyerNavigatorRoute.name,
                  children: [
                    _i30.RouteConfig(
                      SearchRoute.name,
                      path: '',
                      parent: SearchRouter.name,
                    ),
                    _i30.RouteConfig(
                      FilterRoute.name,
                      path: 'filter-screen',
                      parent: SearchRouter.name,
                    ),
                  ],
                ),
                _i30.RouteConfig(
                  MessagesRouter.name,
                  path: 'messages-screen',
                  parent: BuyerNavigatorRoute.name,
                  children: [
                    _i30.RouteConfig(
                      MessagesRoute.name,
                      path: '',
                      parent: MessagesRouter.name,
                    ),
                    _i30.RouteConfig(
                      ChatRoute.name,
                      path: 'chat-screen',
                      parent: MessagesRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    _i30.RouteConfig(
                      MileStoneRoute.name,
                      path: 'milestone-screen',
                      parent: MessagesRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    _i30.RouteConfig(
                      CreateMileStoneRoute.name,
                      path: 'create-milestone-screen',
                      parent: MessagesRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    _i30.RouteConfig(
                      EditMilestoneRoute.name,
                      path: 'edit-milestone-screen',
                      parent: MessagesRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                  ],
                ),
                _i30.RouteConfig(
                  ProfileRouter.name,
                  path: 'profile-screen',
                  parent: BuyerNavigatorRoute.name,
                  children: [
                    _i30.RouteConfig(
                      ProfileRoute.name,
                      path: '',
                      parent: ProfileRouter.name,
                    ),
                    _i30.RouteConfig(
                      EditProfileRoute.name,
                      path: 'edit-profile-screen',
                      parent: ProfileRouter.name,
                    ),
                  ],
                ),
              ],
            ),
            _i30.RouteConfig(
              SellerNavigatorRoute.name,
              path: '',
              parent: AuthWrapperRoute.name,
              children: [
                _i30.RouteConfig(
                  SellerHomeRouter.name,
                  path: 'seller-home-screen',
                  parent: SellerNavigatorRoute.name,
                  children: [
                    _i30.RouteConfig(
                      SellerHomeRoute.name,
                      path: '',
                      parent: SellerHomeRouter.name,
                    ),
                    _i30.RouteConfig(
                      PlaygroundRoute.name,
                      path: 'playground',
                      parent: SellerHomeRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    _i30.RouteConfig(
                      ViewBidingRoute.name,
                      path: 'view-biding-screen',
                      parent: SellerHomeRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    _i30.RouteConfig(
                      MileStoneRoute.name,
                      path: 'milestone-screen',
                      parent: SellerHomeRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    _i30.RouteConfig(
                      CreateMileStoneRoute.name,
                      path: 'create-milestone-screen',
                      parent: SellerHomeRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    _i30.RouteConfig(
                      PlacingBidRoute.name,
                      path: 'placing-bid-screen',
                      parent: SellerHomeRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    _i30.RouteConfig(
                      FavouriteListingRoute.name,
                      path: 'favourite-listing-screen',
                      parent: SellerHomeRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    _i30.RouteConfig(
                      FilterRoute.name,
                      path: 'filter-screen',
                      parent: SellerHomeRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    _i30.RouteConfig(
                      EmailVerificationRoute.name,
                      path: 'verify-email',
                      parent: SellerHomeRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    _i30.RouteConfig(
                      BuyerOnboardingFormFlowRoute.name,
                      path: 'buyer-onboarding-form-flow-screen',
                      parent: SellerHomeRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    _i30.RouteConfig(
                      EditMilestoneRoute.name,
                      path: 'edit-milestone-screen',
                      parent: SellerHomeRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    _i30.RouteConfig(
                      ProfileRouter.name,
                      path: 'profile-screen',
                      parent: SellerHomeRouter.name,
                      children: [
                        _i30.RouteConfig(
                          ProfileRoute.name,
                          path: '',
                          parent: ProfileRouter.name,
                        ),
                        _i30.RouteConfig(
                          EditProfileRoute.name,
                          path: 'edit-profile-screen',
                          parent: ProfileRouter.name,
                        ),
                      ],
                    ),
                    _i30.RouteConfig(
                      SingleListingRoute.name,
                      path: 'single-lising-screen',
                      parent: SellerHomeRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    _i30.RouteConfig(
                      EditSingleListingRoute.name,
                      path: 'edit-listing-screen',
                      parent: SellerHomeRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                  ],
                ),
                _i30.RouteConfig(
                  ListingRouter.name,
                  path: 'listing-screen',
                  parent: SellerNavigatorRoute.name,
                  children: [
                    _i30.RouteConfig(
                      ListingRoute.name,
                      path: '',
                      parent: ListingRouter.name,
                    ),
                    _i30.RouteConfig(
                      SingleListingRoute.name,
                      path: 'single-lising-screen',
                      parent: ListingRouter.name,
                    ),
                    _i30.RouteConfig(
                      ListingFormFlowRoute.name,
                      path: 'listing-form-flow-screen',
                      parent: ListingRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    _i30.RouteConfig(
                      ViewBidingRoute.name,
                      path: 'view-biding-screen',
                      parent: ListingRouter.name,
                    ),
                    _i30.RouteConfig(
                      CreateMileStoneRoute.name,
                      path: 'create-milestone-screen',
                      parent: ListingRouter.name,
                    ),
                    _i30.RouteConfig(
                      EditMilestoneRoute.name,
                      path: 'edit-milestone-screen',
                      parent: ListingRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                  ],
                ),
                _i30.RouteConfig(
                  MessagesRouter.name,
                  path: 'messages-screen',
                  parent: SellerNavigatorRoute.name,
                  children: [
                    _i30.RouteConfig(
                      MessagesRoute.name,
                      path: '',
                      parent: MessagesRouter.name,
                    ),
                    _i30.RouteConfig(
                      ChatRoute.name,
                      path: 'chat-screen',
                      parent: MessagesRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    _i30.RouteConfig(
                      MileStoneRoute.name,
                      path: 'milestone-screen',
                      parent: MessagesRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    _i30.RouteConfig(
                      CreateMileStoneRoute.name,
                      path: 'create-milestone-screen',
                      parent: MessagesRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    _i30.RouteConfig(
                      EditMilestoneRoute.name,
                      path: 'edit-milestone-screen',
                      parent: MessagesRouter.name,
                      meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                  ],
                ),
                _i30.RouteConfig(
                  ProfileRouter.name,
                  path: 'profile-screen',
                  parent: SellerNavigatorRoute.name,
                  children: [
                    _i30.RouteConfig(
                      ProfileRoute.name,
                      path: '',
                      parent: ProfileRouter.name,
                    ),
                    _i30.RouteConfig(
                      EditProfileRoute.name,
                      path: 'edit-profile-screen',
                      parent: ProfileRouter.name,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        _i30.RouteConfig(
          UnAuthWrapperRoute.name,
          path: '/unauth',
          children: [
            _i30.RouteConfig(
              '#redirect',
              path: '',
              parent: UnAuthWrapperRoute.name,
              redirectTo: 'login',
              fullMatch: true,
            ),
            _i30.RouteConfig(
              LoginRoute.name,
              path: 'login',
              parent: UnAuthWrapperRoute.name,
            ),
            _i30.RouteConfig(
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
class SplashRoute extends _i30.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: 'splash',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.AuthWrapperScreen]
class AuthWrapperRoute extends _i30.PageRouteInfo<void> {
  const AuthWrapperRoute({List<_i30.PageRouteInfo>? children})
      : super(
          AuthWrapperRoute.name,
          path: '/auth',
          initialChildren: children,
        );

  static const String name = 'AuthWrapperRoute';
}

/// generated route for
/// [_i3.UnAuthWrapperScreen]
class UnAuthWrapperRoute extends _i30.PageRouteInfo<void> {
  const UnAuthWrapperRoute({List<_i30.PageRouteInfo>? children})
      : super(
          UnAuthWrapperRoute.name,
          path: '/unauth',
          initialChildren: children,
        );

  static const String name = 'UnAuthWrapperRoute';
}

/// generated route for
/// [_i4.BuyerNavigatorScreen]
class BuyerNavigatorRoute extends _i30.PageRouteInfo<void> {
  const BuyerNavigatorRoute({List<_i30.PageRouteInfo>? children})
      : super(
          BuyerNavigatorRoute.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'BuyerNavigatorRoute';
}

/// generated route for
/// [_i5.SellerNavigatorScreen]
class SellerNavigatorRoute extends _i30.PageRouteInfo<void> {
  const SellerNavigatorRoute({List<_i30.PageRouteInfo>? children})
      : super(
          SellerNavigatorRoute.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'SellerNavigatorRoute';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class BuyerHomeRouter extends _i30.PageRouteInfo<void> {
  const BuyerHomeRouter({List<_i30.PageRouteInfo>? children})
      : super(
          BuyerHomeRouter.name,
          path: 'buyer-home-screen',
          initialChildren: children,
        );

  static const String name = 'BuyerHomeRouter';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class SearchRouter extends _i30.PageRouteInfo<void> {
  const SearchRouter({List<_i30.PageRouteInfo>? children})
      : super(
          SearchRouter.name,
          path: 'search-screen',
          initialChildren: children,
        );

  static const String name = 'SearchRouter';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class MessagesRouter extends _i30.PageRouteInfo<void> {
  const MessagesRouter({List<_i30.PageRouteInfo>? children})
      : super(
          MessagesRouter.name,
          path: 'messages-screen',
          initialChildren: children,
        );

  static const String name = 'MessagesRouter';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class ProfileRouter extends _i30.PageRouteInfo<void> {
  const ProfileRouter({List<_i30.PageRouteInfo>? children})
      : super(
          ProfileRouter.name,
          path: 'profile-screen',
          initialChildren: children,
        );

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i7.BuyerHomeScreen]
class BuyerHomeRoute extends _i30.PageRouteInfo<void> {
  const BuyerHomeRoute()
      : super(
          BuyerHomeRoute.name,
          path: '',
        );

  static const String name = 'BuyerHomeRoute';
}

/// generated route for
/// [_i8.SingleListingScreen]
class SingleListingRoute extends _i30.PageRouteInfo<SingleListingRouteArgs> {
  SingleListingRoute({
    _i31.Key? key,
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

  final _i31.Key? key;

  final String listingId;

  final String? industry;

  @override
  String toString() {
    return 'SingleListingRouteArgs{key: $key, listingId: $listingId, industry: $industry}';
  }
}

/// generated route for
/// [_i9.FavouriteListingScreen]
class FavouriteListingRoute extends _i30.PageRouteInfo<void> {
  const FavouriteListingRoute()
      : super(
          FavouriteListingRoute.name,
          path: 'favourite-listing-screen',
        );

  static const String name = 'FavouriteListingRoute';
}

/// generated route for
/// [_i10.SearchScreen]
class SearchRoute extends _i30.PageRouteInfo<void> {
  const SearchRoute()
      : super(
          SearchRoute.name,
          path: '',
        );

  static const String name = 'SearchRoute';
}

/// generated route for
/// [_i11.FilterScreen]
class FilterRoute extends _i30.PageRouteInfo<FilterRouteArgs> {
  FilterRoute({_i31.Key? key})
      : super(
          FilterRoute.name,
          path: 'filter-screen',
          args: FilterRouteArgs(key: key),
        );

  static const String name = 'FilterRoute';
}

class FilterRouteArgs {
  const FilterRouteArgs({this.key});

  final _i31.Key? key;

  @override
  String toString() {
    return 'FilterRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i12.MessagesScreen]
class MessagesRoute extends _i30.PageRouteInfo<void> {
  const MessagesRoute()
      : super(
          MessagesRoute.name,
          path: '',
        );

  static const String name = 'MessagesRoute';
}

/// generated route for
/// [_i13.ChatScreen]
class ChatRoute extends _i30.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    _i31.Key? key,
    required String? recipientId,
    required String recipientFirstName,
    required String recipientLastName,
    required String listingTitle,
    required String listingId,
  }) : super(
          ChatRoute.name,
          path: 'chat-screen',
          args: ChatRouteArgs(
            key: key,
            recipientId: recipientId,
            recipientFirstName: recipientFirstName,
            recipientLastName: recipientLastName,
            listingTitle: listingTitle,
            listingId: listingId,
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
    required this.listingId,
  });

  final _i31.Key? key;

  final String? recipientId;

  final String recipientFirstName;

  final String recipientLastName;

  final String listingTitle;

  final String listingId;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key, recipientId: $recipientId, recipientFirstName: $recipientFirstName, recipientLastName: $recipientLastName, listingTitle: $listingTitle, listingId: $listingId}';
  }
}

/// generated route for
/// [_i14.MileStoneScreen]
class MileStoneRoute extends _i30.PageRouteInfo<MileStoneRouteArgs> {
  MileStoneRoute({
    _i31.Key? key,
    required String buyerId,
    required String sellerId,
    required String buyerName,
    required String listingTitle,
    required String listingId,
  }) : super(
          MileStoneRoute.name,
          path: 'milestone-screen',
          args: MileStoneRouteArgs(
            key: key,
            buyerId: buyerId,
            sellerId: sellerId,
            buyerName: buyerName,
            listingTitle: listingTitle,
            listingId: listingId,
          ),
        );

  static const String name = 'MileStoneRoute';
}

class MileStoneRouteArgs {
  const MileStoneRouteArgs({
    this.key,
    required this.buyerId,
    required this.sellerId,
    required this.buyerName,
    required this.listingTitle,
    required this.listingId,
  });

  final _i31.Key? key;

  final String buyerId;

  final String sellerId;

  final String buyerName;

  final String listingTitle;

  final String listingId;

  @override
  String toString() {
    return 'MileStoneRouteArgs{key: $key, buyerId: $buyerId, sellerId: $sellerId, buyerName: $buyerName, listingTitle: $listingTitle, listingId: $listingId}';
  }
}

/// generated route for
/// [_i15.CreateMileStoneScreen]
class CreateMileStoneRoute
    extends _i30.PageRouteInfo<CreateMileStoneRouteArgs> {
  CreateMileStoneRoute({
    _i31.Key? key,
    required String buyerId,
    required String sellerId,
    required String buyerName,
    required String listingTitle,
    required String listingId,
  }) : super(
          CreateMileStoneRoute.name,
          path: 'create-milestone-screen',
          args: CreateMileStoneRouteArgs(
            key: key,
            buyerId: buyerId,
            sellerId: sellerId,
            buyerName: buyerName,
            listingTitle: listingTitle,
            listingId: listingId,
          ),
        );

  static const String name = 'CreateMileStoneRoute';
}

class CreateMileStoneRouteArgs {
  const CreateMileStoneRouteArgs({
    this.key,
    required this.buyerId,
    required this.sellerId,
    required this.buyerName,
    required this.listingTitle,
    required this.listingId,
  });

  final _i31.Key? key;

  final String buyerId;

  final String sellerId;

  final String buyerName;

  final String listingTitle;

  final String listingId;

  @override
  String toString() {
    return 'CreateMileStoneRouteArgs{key: $key, buyerId: $buyerId, sellerId: $sellerId, buyerName: $buyerName, listingTitle: $listingTitle, listingId: $listingId}';
  }
}

/// generated route for
/// [_i16.EditMilestoneScreen]
class EditMilestoneRoute extends _i30.PageRouteInfo<EditMilestoneRouteArgs> {
  EditMilestoneRoute({
    _i31.Key? key,
    required String buyerId,
    required String sellerId,
    required String milestoneTitle,
    required String milestoneId,
    required String listingId,
    required DateTime endDate,
    required DateTime startDate,
  }) : super(
          EditMilestoneRoute.name,
          path: 'edit-milestone-screen',
          args: EditMilestoneRouteArgs(
            key: key,
            buyerId: buyerId,
            sellerId: sellerId,
            milestoneTitle: milestoneTitle,
            milestoneId: milestoneId,
            listingId: listingId,
            endDate: endDate,
            startDate: startDate,
          ),
        );

  static const String name = 'EditMilestoneRoute';
}

class EditMilestoneRouteArgs {
  const EditMilestoneRouteArgs({
    this.key,
    required this.buyerId,
    required this.sellerId,
    required this.milestoneTitle,
    required this.milestoneId,
    required this.listingId,
    required this.endDate,
    required this.startDate,
  });

  final _i31.Key? key;

  final String buyerId;

  final String sellerId;

  final String milestoneTitle;

  final String milestoneId;

  final String listingId;

  final DateTime endDate;

  final DateTime startDate;

  @override
  String toString() {
    return 'EditMilestoneRouteArgs{key: $key, buyerId: $buyerId, sellerId: $sellerId, milestoneTitle: $milestoneTitle, milestoneId: $milestoneId, listingId: $listingId, endDate: $endDate, startDate: $startDate}';
  }
}

/// generated route for
/// [_i17.ProfileScreen]
class ProfileRoute extends _i30.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i18.EditProfileScreen]
class EditProfileRoute extends _i30.PageRouteInfo<EditProfileRouteArgs> {
  EditProfileRoute({_i31.Key? key})
      : super(
          EditProfileRoute.name,
          path: 'edit-profile-screen',
          args: EditProfileRouteArgs(key: key),
        );

  static const String name = 'EditProfileRoute';
}

class EditProfileRouteArgs {
  const EditProfileRouteArgs({this.key});

  final _i31.Key? key;

  @override
  String toString() {
    return 'EditProfileRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.EmptyRouterPage]
class SellerHomeRouter extends _i30.PageRouteInfo<void> {
  const SellerHomeRouter({List<_i30.PageRouteInfo>? children})
      : super(
          SellerHomeRouter.name,
          path: 'seller-home-screen',
          initialChildren: children,
        );

  static const String name = 'SellerHomeRouter';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class ListingRouter extends _i30.PageRouteInfo<void> {
  const ListingRouter({List<_i30.PageRouteInfo>? children})
      : super(
          ListingRouter.name,
          path: 'listing-screen',
          initialChildren: children,
        );

  static const String name = 'ListingRouter';
}

/// generated route for
/// [_i19.SellerHomeScreen]
class SellerHomeRoute extends _i30.PageRouteInfo<void> {
  const SellerHomeRoute()
      : super(
          SellerHomeRoute.name,
          path: '',
        );

  static const String name = 'SellerHomeRoute';
}

/// generated route for
/// [_i20.PlaygroundScreen]
class PlaygroundRoute extends _i30.PageRouteInfo<void> {
  const PlaygroundRoute()
      : super(
          PlaygroundRoute.name,
          path: 'playground',
        );

  static const String name = 'PlaygroundRoute';
}

/// generated route for
/// [_i21.ViewBidingScreen]
class ViewBidingRoute extends _i30.PageRouteInfo<void> {
  const ViewBidingRoute()
      : super(
          ViewBidingRoute.name,
          path: 'view-biding-screen',
        );

  static const String name = 'ViewBidingRoute';
}

/// generated route for
/// [_i22.PlacingBidScreen]
class PlacingBidRoute extends _i30.PageRouteInfo<PlacingBidRouteArgs> {
  PlacingBidRoute({_i31.Key? key})
      : super(
          PlacingBidRoute.name,
          path: 'placing-bid-screen',
          args: PlacingBidRouteArgs(key: key),
        );

  static const String name = 'PlacingBidRoute';
}

class PlacingBidRouteArgs {
  const PlacingBidRouteArgs({this.key});

  final _i31.Key? key;

  @override
  String toString() {
    return 'PlacingBidRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i23.EmailVerificationScreen]
class EmailVerificationRoute
    extends _i30.PageRouteInfo<EmailVerificationRouteArgs> {
  EmailVerificationRoute({
    _i31.Key? key,
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

  final _i31.Key? key;

  final String email;

  @override
  String toString() {
    return 'EmailVerificationRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i24.BuyerOnboardingFormFlowScreen]
class BuyerOnboardingFormFlowRoute
    extends _i30.PageRouteInfo<BuyerOnboardingFormFlowRouteArgs> {
  BuyerOnboardingFormFlowRoute({_i31.Key? key})
      : super(
          BuyerOnboardingFormFlowRoute.name,
          path: 'buyer-onboarding-form-flow-screen',
          args: BuyerOnboardingFormFlowRouteArgs(key: key),
        );

  static const String name = 'BuyerOnboardingFormFlowRoute';
}

class BuyerOnboardingFormFlowRouteArgs {
  const BuyerOnboardingFormFlowRouteArgs({this.key});

  final _i31.Key? key;

  @override
  String toString() {
    return 'BuyerOnboardingFormFlowRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i25.EditSingleListingScreen]
class EditSingleListingRoute extends _i30.PageRouteInfo<void> {
  const EditSingleListingRoute()
      : super(
          EditSingleListingRoute.name,
          path: 'edit-listing-screen',
        );

  static const String name = 'EditSingleListingRoute';
}

/// generated route for
/// [_i26.ListingScreen]
class ListingRoute extends _i30.PageRouteInfo<void> {
  const ListingRoute()
      : super(
          ListingRoute.name,
          path: '',
        );

  static const String name = 'ListingRoute';
}

/// generated route for
/// [_i27.ListingFormFlowScreen]
class ListingFormFlowRoute
    extends _i30.PageRouteInfo<ListingFormFlowRouteArgs> {
  ListingFormFlowRoute({_i31.Key? key})
      : super(
          ListingFormFlowRoute.name,
          path: 'listing-form-flow-screen',
          args: ListingFormFlowRouteArgs(key: key),
        );

  static const String name = 'ListingFormFlowRoute';
}

class ListingFormFlowRouteArgs {
  const ListingFormFlowRouteArgs({this.key});

  final _i31.Key? key;

  @override
  String toString() {
    return 'ListingFormFlowRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i28.LoginScreen]
class LoginRoute extends _i30.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i31.Key? key})
      : super(
          LoginRoute.name,
          path: 'login',
          args: LoginRouteArgs(key: key),
        );

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i31.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i29.RegistrationFlowScreen]
class RegistrationFlowRoute extends _i30.PageRouteInfo<void> {
  const RegistrationFlowRoute()
      : super(
          RegistrationFlowRoute.name,
          path: 'register',
        );

  static const String name = 'RegistrationFlowRoute';
}
