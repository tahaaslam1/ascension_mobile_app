import 'package:ascension_mobile_app/bootstrap.dart';
import 'package:ascension_mobile_app/presentation/app.dart';
import 'package:ascension_mobile_app/services/environment_config_service.dart';

void main() async { 
    bootstrap(() => App(), environment: Environment.production);
}
