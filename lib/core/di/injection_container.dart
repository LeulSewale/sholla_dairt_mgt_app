import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/datasources/local/local_data_source.dart';
import '../../data/datasources/remote/remote_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/repositories/dashboard_repository_impl.dart';
import '../../data/repositories/products_repository_impl.dart';
import '../../data/repositories/communication_repository_impl.dart';
import '../../data/repositories/deposit_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../../domain/repositories/products_repository.dart';
import '../../domain/repositories/communication_repository.dart';
import '../../domain/repositories/deposit_repository.dart';
import '../../domain/usecases/auth/login_usecase.dart';
import '../../domain/usecases/dashboard/get_dashboard_data_usecase.dart';
import '../../domain/usecases/products/get_products_usecase.dart';
import '../../domain/usecases/communication/get_messages_usecase.dart';
import '../../domain/usecases/deposit/create_deposit_usecase.dart';
import '../../domain/usecases/deposit/get_deposit_history_usecase.dart';
import '../../presentation/bloc/auth/auth_bloc.dart';
import '../../presentation/bloc/dashboard/dashboard_bloc.dart';
import '../../presentation/bloc/products/products_bloc.dart';
import '../../presentation/bloc/communication/communication_bloc.dart';
import '../../presentation/bloc/deposit/deposit_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());

  // Data sources
  sl.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(sl()),
  );

  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl(), sl()),
  );
  sl.registerLazySingleton<DashboardRepository>(
    () => DashboardRepositoryImpl(sl(), sl()),
  );
  sl.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(sl(), sl()),
  );
  sl.registerLazySingleton<CommunicationRepository>(
    () => CommunicationRepositoryImpl(sl(), sl()),
  );
  sl.registerLazySingleton<DepositRepository>(
    () => DepositRepositoryImpl(sl(), sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => GetDashboardDataUseCase(sl()));
  sl.registerLazySingleton(() => GetProductsUseCase(sl()));
  sl.registerLazySingleton(() => GetMessagesUseCase(sl()));
  sl.registerLazySingleton(() => CreateDepositUseCase(sl()));
  sl.registerLazySingleton(() => GetDepositHistoryUseCase(sl()));

  // Blocs
  sl.registerFactory(() => AuthBloc(sl()));
  sl.registerFactory(() => DashboardBloc(sl()));
  sl.registerFactory(() => ProductsBloc(sl()));
  sl.registerFactory(() => CommunicationBloc(sl()));
  sl.registerFactory(() => DepositBloc(sl(), sl()));
}
