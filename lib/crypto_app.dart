// The MIT License (MIT)

// Copyright (c) 2023-2024 Ame Studio and shceo

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import 'package:crypto_trader/blocs/authorization_bloc/authentication_bloc.dart';
import 'package:crypto_trader/blocs/crypto_bloc/crypto_bloc_bloc.dart';
import 'package:crypto_trader/blocs/crypto_history_bloc/bloc/crypto_history_bloc_bloc.dart';
import 'package:crypto_trader/blocs/splash_bloc/splash_screen_bloc.dart';
import 'package:crypto_trader/ui/routes/app_navigator.dart';
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
