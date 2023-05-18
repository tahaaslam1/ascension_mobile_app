import 'package:ascension_mobile_app/business_logic/blocs/listing/get_auctioned_listing/get_auctioned_listing_bloc.dart';
import 'package:ascension_mobile_app/business_logic/blocs/listing/get_recommended_listing_bloc/get_recommended_listing_bloc.dart';
import 'package:ascension_mobile_app/business_logic/blocs/searching/bloc/searching_bloc.dart';
import 'package:ascension_mobile_app/business_logic/blocs/searching/searching_bloc.dart';
import 'package:ascension_mobile_app/business_logic/cubits/favourite/favourite_cubit.dart';
import 'package:ascension_mobile_app/business_logic/cubits/filter/filter_cubit.dart';
import 'package:ascension_mobile_app/business_logic/cubits/listing_form_flow_screen/switch_cubit/listing_switch_cubit.dart';
import 'package:ascension_mobile_app/data/repositories/chat_repository/chat_repository.dart';
import 'package:ascension_mobile_app/data/repositories/listing_repository/listing_repository.dart';
import 'package:ascension_mobile_app/data/repositories/listing_repository/node_listing_repository.dart';
import 'package:ascension_mobile_app/data/repositories/selectable_repository/selectable_repository.dart';
import 'package:ascension_mobile_app/data/repositories/user_repository/user_repository.dart';
import 'package:ascension_mobile_app/presentation/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:ascension_mobile_app/routes/router.gr.dart';
import 'package:ascension_mobile_app/services/http/http_services.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../business_logic/blocs/auth/auth_bloc.dart';
import '../../../../business_logic/blocs/listing/get_listing_bloc/get_listing_bloc.dart';
import '../../../../business_logic/blocs/listing/single_listing_bloc/single_listing_bloc.dart';
import '../../../../business_logic/blocs/message/inbox_bloc/inbox_bloc.dart';
import '../../../../data/repositories/chat_repository/node_chat_repository.dart';
import '../../../../models/user.dart';
import '../../../../services/local_storage_services.dart';

class BuyerNavigatorScreen extends StatelessWidget {
  static const String route = '';
  const BuyerNavigatorScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ListingRepository>(
          create: (context) => NodeListingRepository(httpClient: context.read<HttpService>(), localStorageService: LocalStorageService()),
        ),
        RepositoryProvider<ChatRepository>(
          create: (context) => NodeChatRepository(httpClient: context.read<HttpService>()),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<InboxBloc>(
            create: (context) => InboxBloc(
              userRepository: RepositoryProvider.of<UserRepository>(context),
              chatRepository: RepositoryProvider.of<ChatRepository>(context),
            ),
          ),
          BlocProvider<GetListingBloc>(
            create: (context) => GetListingBloc(
              listingRepository: RepositoryProvider.of<ListingRepository>(context),
            )..add(ListingFetched()),
          ),
          BlocProvider<GetAuctionedListingBloc>(
            create: (context) => GetAuctionedListingBloc(
              listingRepository: RepositoryProvider.of<ListingRepository>(context),
            )..add(FetchAuctionedListing()),
          ),
          BlocProvider<SingleListingBloc>(
            create: (context) => SingleListingBloc(
              listingRepository: RepositoryProvider.of<ListingRepository>(context),
            ),
          ),
          BlocProvider<GetRecommendedListingBloc>(
            create: (context) => GetRecommendedListingBloc(
              listingRepository: RepositoryProvider.of<ListingRepository>(context),
            ),
          ),
          BlocProvider<FavouriteCubit>(
            create: (context) => FavouriteCubit(
              listingRepository: RepositoryProvider.of<ListingRepository>(context),
            ),
          ),
          BlocProvider<SearchingBloc>(
            create: (context) => SearchingBloc(
              listingRepository: RepositoryProvider.of<ListingRepository>(context),
            ),
          ),
          BlocProvider<FilterCubit>(
            create: (context) => FilterCubit(),
          ),
          BlocProvider<ListingSwitchCubit>(
            create: (context) => ListingSwitchCubit(),
          ),
        ],
        child: AutoTabsScaffold(
          routes: const [BuyerHomeRouter(), SearchRouter(), MessagesRouter(), ProfileRouter()],
          bottomNavigationBuilder: (_, tabsRouter) {
            return BottomNavBar(
              tabsRouter: tabsRouter,
              isSeller: BlocProvider.of<AuthBloc>(context).state.user.userType == UserType.seller,
            );
          },
        ),
      ),
    );
  }
}
