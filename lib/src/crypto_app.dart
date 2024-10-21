import 'package:crypto_trader/src/data/blocs/authorization_bloc/authentication_bloc.dart';
import 'package:crypto_trader/src/data/blocs/crypto_bloc/crypto_bloc_bloc.dart';
import 'package:crypto_trader/src/data/blocs/crypto_history_bloc/bloc/crypto_history_bloc_bloc.dart';
import 'package:crypto_trader/src/data/blocs/splash_bloc/splash_screen_bloc.dart';
import 'package:crypto_trader/src/ui/routes/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

class CryptoApp extends StatelessWidget {
  const CryptoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
           providers: [
        BlocProvider(
          create: (context) => SplashBloc()..add(AppStarted()),
        ),
        BlocProvider(create: (context) => CryptoBlocBloc()),
        BlocProvider(create: (context) => CryptoHistoryBlocBloc()),
        BlocProvider(
          create: (context) => AuthenticationBloc()..add(RegisterEvent()),
        )
      ],
      child: MaterialApp.router(
        locale: Locale('ru'),  /// [Localization] русский
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        routerConfig: AppNavigator.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
      ),
    );
  }
}
