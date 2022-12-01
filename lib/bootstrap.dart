import 'dart:async';

import 'package:ascension_mobile_app/business_logic/app_bloc_observer.dart';
import 'package:ascension_mobile_app/logger.dart';
import 'package:ascension_mobile_app/services/app_config_service.dart';
import 'package:ascension_mobile_app/services/environment_config_service.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder, {Environment environment = Environment.production}) async {
  // logger.v("Verbose log");

  // logger.d("Debug log");

  // logger.i("Info log");

  // logger.w("Warning log");

  // try {
  //   throw UnimplementedError("Not implemented");
  // } catch (e) {
  //   logger.e("Error log", e, StackTrace.current);
  // }

  // logger.wtf("What a terrible failure log");

  FlutterError.onError = (details) {
    logger.e(details.summary, details.exceptionAsString(), details.stack);
  };
  await runZonedGuarded(
    () async {
      // ignore: deprecated_member_use
      await BlocOverrides.runZoned(
        () async {
          WidgetsFlutterBinding.ensureInitialized();
          EnvironmentConfigService.init(environment);
          await AppConfigService.instance.init();
          runApp(await builder());
        },
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) => logger.e('Exception', error, stackTrace),
  );
}
