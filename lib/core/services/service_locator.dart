import 'package:carotv/feature/auth/data/datasource/auth_data_source.dart';
import 'package:carotv/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:carotv/feature/auth/domain/repository/auth_repository.dart';
import 'package:carotv/feature/auth/domain/usecases/login_usecase.dart';
import 'package:carotv/feature/auth/presentation/controllers/login_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    //Data Source
    sl.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl());

    //Repository
    sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

    //Use Cases
    sl.registerLazySingleton(() => LoginUseCase(sl()));

    //Bloc
    sl.registerFactory(() => LoginBloc(sl()));
  }
}
