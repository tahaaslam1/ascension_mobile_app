import 'dart:developer';
import 'package:ascension_mobile_app/logger.dart';
import 'package:bloc/bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    logger.i('${bloc.runtimeType} created');
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logger.i('${bloc.runtimeType} state changed: $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    logger.i('${bloc.runtimeType} closed');
    super.onClose(bloc);
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    logger.i('${bloc.runtimeType} recieved event: $event');
    super.onEvent(bloc, event);
  }
}
