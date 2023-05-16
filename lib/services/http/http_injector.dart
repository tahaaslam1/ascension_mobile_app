import 'package:ascension_mobile_app/services/http/http_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HttpInjector extends StatelessWidget {
  final Widget child;
  const HttpInjector({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<HttpService>(
      create: (context) => HttpService(),
      child: child,
    );
  }
}
