import 'package:ascension_mobile_app/business_logic/blocs/listing/get_recommended_listing_bloc/get_recommended_listing_bloc.dart';
import 'package:ascension_mobile_app/business_logic/blocs/listing/get_single_listing_bloc/get_single_listing_bloc.dart';
import 'package:ascension_mobile_app/data/repositories/chat_repository/chat_repository.dart';
import 'package:ascension_mobile_app/data/repositories/listing_repository/listing_repository.dart';
import 'package:ascension_mobile_app/data/repositories/listing_repository/node_listing_repository.dart';
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
import '../../../../business_logic/blocs/message/chat_bloc/chat_bloc.dart';
import '../../../../business_logic/blocs/message/inbox_bloc/inbox_bloc.dart';
import '../../../../data/repositories/chat_repository/node_chat_repository.dart';

class BuyerNavigatorScreen extends StatelessWidget {
  static const String route = '';
  BuyerNavigatorScreen({Key? key}) : super(key: key);
  final _listingRepository = NodeListingRepository(httpClient: HTTPClient(Dio()));
  final _chatRespository = NodeChatRepository(httpClient: HTTPClient(Dio()));
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ListingRepository>(
          create: (context) => _listingRepository,
        ),
        RepositoryProvider<ChatRepository>(
          create: (context) => _chatRespository,
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
            ),
          ),
          BlocProvider<GetSingleListingBloc>(
            create: (context) => GetSingleListingBloc(
              listingRepository: RepositoryProvider.of<ListingRepository>(context),
            ),
          ),
          BlocProvider<GetRecommendedListingBloc>(
            create: (context) => GetRecommendedListingBloc(
              listingRepository: RepositoryProvider.of<ListingRepository>(context),
            ),
          )
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
