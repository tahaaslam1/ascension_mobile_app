enum Environment {production }

class EnvironmentConfigService {
  static late Environment currentEnivironment;
  EnvironmentConfigService.init(Environment environment) {
    currentEnivironment = environment;
  }
}
