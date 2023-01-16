// ignore_for_file: constant_identifier_names

enum Env { DEVELOPMENT, STAGING, PRODUCTION }

class FlavorConfig {
  final Env? env;
  final String? name;
  final EnvValues? values;

  static FlavorConfig? _instance;

  factory FlavorConfig.init({required Env? env, required EnvValues? values}) {
    _instance ??= FlavorConfig._internal(
      env: env,
      name: env.toString().split(".")[env.toString().split(".").length - 1],
      values: values,
    );
    return _instance!;
  }

  FlavorConfig._internal({this.env, this.name, this.values});

  static FlavorConfig get instance {
    return _instance!;
  }

  static bool isProduction() => _instance!.env == Env.PRODUCTION;
  static bool isDevelopment() => _instance!.env == Env.DEVELOPMENT;
  static bool isStaging() => _instance!.env == Env.STAGING;
}

class EnvValues {
  final String? baseApi;
  final String? authToken;
  final String? appName;
  final int? delay;
  final bool? debug;
  final bool? printResponse;
  final String? apiVersion;
  final String? urlGithub;

  EnvValues({
    this.authToken,
    required this.baseApi,
    required this.appName,
    required this.delay,
    required this.debug,
    required this.printResponse,
    required this.apiVersion,
    required this.urlGithub,
  });
}