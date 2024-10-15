
import 'package:get_it/get_it.dart';
import '../../features/auth_view/data/repositry/auth_repo_impl.dart';
import '../../features/auth_view/presentaion/manger/auth_cubit.dart';
import '../error/sign_in_error_handler.dart';
import '../error/sign_up_error_handeler.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<SignUpErrorHandler>(() => SignUpErrorHandler());
  getIt.registerLazySingleton<SignInErrorHandler>(() => SignInErrorHandler());

  getIt.registerLazySingleton<AuthRepoImpl>(
        () => AuthRepoImpl(
      getIt<SignUpErrorHandler>(),
      getIt<SignInErrorHandler>(),
    ),
  );

  getIt.registerFactory<AuthCubit>(
        () => AuthCubit(getIt<AuthRepoImpl>()),
  );
}