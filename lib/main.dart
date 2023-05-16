import 'package:ascension_mobile_app/bootstrap.dart';
import 'package:ascension_mobile_app/presentation/app.dart';
import 'package:ascension_mobile_app/services/environment_config_service.dart';
import 'package:ascension_mobile_app/services/http/http_injector.dart';

void main() async {
  bootstrap(() => const HttpInjector(child: App()), environment: Environment.production);
}
