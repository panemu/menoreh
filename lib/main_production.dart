import 'package:data/data.dart';

import 'bootstrap.dart';
import 'presentation/_presentation.dart';

void main() async {
  bootstrap(
    flavor: FlavorConfig.init(
      env: Env.PRODUCTION,
      values: EnvValues(
        appName: 'Menoreh Library',
        apiVersion: '1.0.0',
        baseApi: 'https://scs-demo.panemu.com/country/api2/',
        debug: false,
        delay: 0,
        printResponse: false,
        urlGithub: '',
      ),
    ),
    () => const App(),
  );
}
