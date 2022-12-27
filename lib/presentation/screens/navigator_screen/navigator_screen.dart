import 'package:ascension_mobile_app/logger.dart';
import 'package:ascension_mobile_app/presentation/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:ascension_mobile_app/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigatorScreen extends StatelessWidget {
  static const String route = '';
  NavigatorScreen({Key? key}) : super(key: key);
  // final _jobsRepository = SupabaseJobsRepository();
  @override
  Widget build(BuildContext context) {
    return

        // MultiRepositoryProvider(
        //   providers: [
        //     RepositoryProvider<JobsRepository>(
        //       create: (context) => _jobsRepository,
        //     ),
        //   ],
        //   child: MultiBlocProvider(
        //     providers: [
        //       BlocProvider<ProfileBloc>(
        //         create: (context) => ProfileBloc(
        //           userRepository: RepositoryProvider.of<UserRepository>(context),
        //         ),
        //       ),
        //       BlocProvider<GetJobsBloc>(
        //         create: (context) => GetJobsBloc(
        //           userRepository: RepositoryProvider.of<UserRepository>(context),
        //           jobsRepository: RepositoryProvider.of<JobsRepository>(context),
        //         ),
        //       ),
        //       BlocProvider<GetSingleJobBloc>(
        //         create: (context) => GetSingleJobBloc(
        //           userRepository: RepositoryProvider.of<UserRepository>(context),
        //           jobsRepository: RepositoryProvider.of<JobsRepository>(context),
        //         ),
        //       ),

        //     ],
        // child:
        AutoTabsScaffold(
      routes: const [HomeRouter(), ListingRouter(), MessagesRouter(), ProfileRouter()],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavBar(
          tabsRouter: tabsRouter,
        );
      },
    );
    //   ),
    // );
  }
}
