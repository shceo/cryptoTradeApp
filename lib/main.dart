import 'dart:async';

import 'package:crypto_trader/src/crypto_app.dart';
import 'package:crypto_trader/src/data/providers/add_card_provider.dart';
import 'package:crypto_trader/src/data/providers/aisoon_provider.dart';
import 'package:crypto_trader/src/data/providers/currencyvswindow.dart';
import 'package:crypto_trader/src/data/providers/favoritelist_provider.dart';
import 'package:crypto_trader/src/data/providers/image_picker_provider.dart';
import 'package:crypto_trader/src/data/providers/settingsmodels_provider.dart';
import 'package:crypto_trader/src/data/providers/tab_bar_model.dart';
import 'package:crypto_trader/src/data/providers/userbalance_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'src/firebase_options.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: '.env');

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();

// инициализация внешних виджетов

  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.initFlutter(appDocumentDirectory.path);

  /// установка ориентации
  /*SystemChrome.setPreferredOrientations( 
  [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]); */

  runApp(
    /// [AppProviders]
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
        ChangeNotifierProvider(create: (context) => UserAccount()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
      ],
      child: const CryptoApp(),
    ),
  );
}
