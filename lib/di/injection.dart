import 'package:get_it/get_it.dart';

import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

Future<void> configureDependencies() async {
  await getIt.init();
}
