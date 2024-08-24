import 'package:account_mangment_responsive/core/cubits/language_cubit/language_cubit.dart';
import 'package:account_mangment_responsive/core/utils/constant.dart';
import 'package:account_mangment_responsive/generated/l10n.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/routing/app_router.dart';
import 'features/home_view/data/reposetry/home_repo_impl.dart';
import 'features/home_view/presentation/manger/home_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: defaultColor,
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeCubit(HomeRepoImpl()),
          ),
          BlocProvider(
            create: (context) => LanguageCubit(),
          ),
        ],
        child: BlocBuilder<LanguageCubit, ChangeLanguageState>(
          builder: (context, state) {
            return MaterialApp.router(
              routerConfig: AppRouter.router,
              locale: state.locale,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              builder: DevicePreview.appBuilder,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
            );
          },
        ),
      ),
    );
  }
}