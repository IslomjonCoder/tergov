import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    developer.log(
      'Event: $event',
      name: 'bloc', // Log name is set to "bloc"
      level: 800, // INFO level
    );
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    developer.log(
      'Transition: $transition',
      name: 'bloc', // Log name is set to "bloc"
      level: 800, // INFO level
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    developer.log(
      'Error: $error',
      name: 'bloc', // Log name is set to "bloc"
      level: 1000, // SEVERE level
      error: error,
      stackTrace: stackTrace,
    );
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    developer.log(
      'State Change: $change',
      name: 'bloc', // Log name is set to "bloc"
      level: 800, // INFO level
    );
  }
}