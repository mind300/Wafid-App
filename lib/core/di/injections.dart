
import 'package:get_it/get_it.dart';

import '../network/api_services/api_servises.dart';

final GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<ApiService>(() => ApiService());

  //getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<ApiService>()));

}
