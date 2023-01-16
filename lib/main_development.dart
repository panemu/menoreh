import 'package:data/data.dart';

import 'bootstrap.dart';
import 'presentation/_presentation.dart';

void main() async {
  bootstrap(
    flavor: FlavorConfig.init(
      env: Env.DEVELOPMENT,
      values: EnvValues(
        appName: 'Menoreh Dev',
        apiVersion: '1.0.0',
        baseApi: 'https://country.panemu.com/country/api2/',
        debug: true,
        delay: 0,
        printResponse: false,
        urlGithub: '',
      ),
    ),
    () => const App(),
  );
}
