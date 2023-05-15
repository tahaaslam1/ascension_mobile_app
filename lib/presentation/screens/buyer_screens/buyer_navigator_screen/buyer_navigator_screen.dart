import 'package:ascension_mobile_app/business_logic/blocs/listing/get_auctioned_listing/get_auctioned_listing_bloc.dart';
import 'package:ascension_mobile_app/business_logic/blocs/listing/get_recommended_listing_bloc/get_recommended_listing_bloc.dart';
import 'package:ascension_mobile_app/business_logic/cubits/filter/filter_cubit.dart';
import 'package:ascension_mobile_app/data/repositories/chat_repository/chat_repository.dart';
import 'package:ascension_mobile_app/data/repositories/listing_repository/listing_repository.dart';
import 'package:ascension_mobile_app/data/repositories/listing_repository/node_listing_repository.dart';
import 'package:ascension_mobile_app/data/repositories/selectable_repository/selectable_repository.dart';
import 'package:ascension_mobile_app/data/repositories/user_repository/user_repository.dart';
import 'package:ascension_mobile_app/models/user.dart';
import 'package:ascension_mobile_app/networking/client/http_client.dart';
import 'package:ascension_mobile_app/presentation/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:ascension_mobile_app/routes/router.gr.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../business_logic/blocs/listing/get_listing_bloc/get_listing_bloc.dart';
import '../../../../business_logic/blocs/listing/single_listing_bloc/single_listing_bloc.dart';
import '../../../../business_logic/blocs/message/chat_bloc/chat_bloc.dart';
import '../../../../business_logic/blocs/message/inbox_bloc/inbox_bloc.dart';
import '../../../../business_logic/blocs/searching/searching_bloc.dart';
import '../../../../business_logic/cubits/listing_form_flow_screen/switch_cubit/listing_switch_cubit.dart';
import '../../../../data/repositories/chat_repository/node_chat_repository.dart';
import '../../../../data/repositories/selectable_repository/node_selectable_repository.dart';

class BuyerNavigatorScreen extends StatelessWidget {
  static const String route = '';
  BuyerNavigatorScreen({Key? key}) : super(key: key);
  final _listingRepository = NodeListingRepository(httpClient: HTTPClient(Dio()));
  final _chatRespository = NodeChatRepository(httpClient: HTTPClient(Dio()));
  final _selectableRepository = NodeSelectableRepository(httpClient: HTTPClient(Dio()));
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ListingRepository>(
          create: (context) => _listingRepository,
        ),
        RepositoryProvider<ChatRepository>(
          create: (context) => _chatRespository,
        ),
        RepositoryProvider<SelectableRepository>(
          create: (context) => _selectableRepository,
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
            );
          },
        ),
      ),
    );
  }
}
