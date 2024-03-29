import 'package:ascension_mobile_app/business_logic/blocs/auth/auth_bloc.dart';
import 'package:ascension_mobile_app/data/repositories/auth_repository/auth_repository.dart';
import 'package:ascension_mobile_app/data/repositories/auth_repository/node_auth_repository.dart';
import 'package:ascension_mobile_app/data/repositories/user_repository/node_user_repository.dart';
import 'package:ascension_mobile_app/data/repositories/user_repository/user_repository.dart';
import 'package:ascension_mobile_app/routes/router.gr.dart';
import 'package:ascension_mobile_app/services/http/http_services.dart';
import 'package:ascension_mobile_app/styles.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

// import 'package:ascension_mobile_app/styles.dart';
// import 'package:flutter/material.dart';

// import 'screens/playground_screen/playground_screen.dart';

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MainApp();
//   }
// }

// class MainApp extends StatefulWidget {
//   const MainApp({super.key});

//   @override
//   State<MainApp> createState() => _MainAppState();
// }

// class _MainAppState extends State<MainApp> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: Styles.mainTheme,
//       title: 'Ascension',
//       debugShowCheckedModeBanner: false,
//       home: const PlaygroundScreen(), //TODO : chagne after auth flow is implemented...
//     );
//   }
// }

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // final _authRepository = NodeAuthRepository(httpClient: context.read<HttpService>());
  // final _userRepository = NodeUserRepository();
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => NodeAuthRepository(httpClient: context.read<HttpService>()),
        ),
        RepositoryProvider<UserRepository>(
          create: (context) => NodeUserRepository(httpService: context.read<HttpService>()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(authenticationRepository: context.read<AuthRepository>(), userRepository: context.read<UserRepository>()),
          ),
        ],
        child: const MainApp(),
      ),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthenticationState>(
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: Styles.mainTheme,
          routerDelegate: AutoRouterDelegate.declarative(
            _appRouter,
            routes: (_) => [
              // if the user is logged in, they may proceed to the Main App
              if (state.status == AuthenticationStatus.authenticated)
                const AuthWrapperRoute()
              // if they are not logged in, bring them to the Login page
              else if (state.status == AuthenticationStatus.unauthenticated)
                const UnAuthWrapperRoute()
              else
                const SplashRoute(),
            ],
          ),
          routeInformationParser: _appRouter.defaultRouteParser(includePrefixMatches: true),
          localizationsDelegates: const [FormBuilderLocalizations.delegate],
        );
      },
    );
  }
}
