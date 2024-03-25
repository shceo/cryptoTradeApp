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

import 'package:crypto_trader/crypto_app.dart';
import 'package:crypto_trader/providers/add_card_provider.dart';
import 'package:crypto_trader/providers/aisoon_provider.dart';
import 'package:crypto_trader/providers/currencyvswindow.dart';
import 'package:crypto_trader/providers/image_picker_provider.dart';
import 'package:crypto_trader/providers/settingsmodels_provider.dart';
import 'package:crypto_trader/providers/tab_bar_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:dotenv/dotenv.dart' as dotenv;


void main() async {
  //await dotenv.load(fileName: '.env');    
await dotenv.DotEnv();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();

// инициализация внешних виджетов

  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.initFlutter(appDocumentDirectory.path);

  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  //



  runApp(
    // провайдеры

    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ImageNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => TabBarModel(),
        ),
        ChangeNotifierProvider(create: (context) => NotificationModel()),
        ChangeNotifierProvider(create: (context) => LanguageModel()),
        ChangeNotifierProvider(create: (context) => ThemeModel()),
        ChangeNotifierProvider(create: (context) => thremonthtoget()),
        ChangeNotifierProvider(create: (context) => CardModel()),
        ChangeNotifierProvider(create: (context) => CurrencyModel()),
      ],
      child: const CryptoApp(),
    ),
  );
}
