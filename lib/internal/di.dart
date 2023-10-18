
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void initDI(String env) => getIt.init(environment: env);

abstract class Env {
  static const dev = 'dev';
  static const prod = 'prod';
}
