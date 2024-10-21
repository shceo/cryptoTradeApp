import 'package:crypto_trader/src/data/blocs/authorization_bloc/authentication_bloc.dart';
import 'package:crypto_trader/src/ui/pages/add_card_page/card_add_page.dart';
import 'package:crypto_trader/src/ui/pages/crypto_page/crypto_page.dart';
import 'package:crypto_trader/src/ui/pages/ctb_ai_page/ctb_ai.dart';
import 'package:crypto_trader/src/ui/pages/firebase/dopLog/main_register.dart';
import 'package:crypto_trader/src/ui/pages/firebase/login_page/login_page.dart';
import 'package:crypto_trader/src/ui/pages/firebase/register_page/register_page.dart';
import 'package:crypto_trader/src/ui/pages/helpfful_pages/help_and_support_page.dart';
import 'package:crypto_trader/src/ui/pages/home_page/home_page.dart';
import 'package:crypto_trader/src/ui/pages/identify_person_page/identify_person.dart';
import 'package:crypto_trader/src/ui/pages/local_auth/local_auth_page.dart';
import 'package:crypto_trader/src/ui/pages/notification_page/notification_page.dart';
import 'package:crypto_trader/src/ui/pages/privacy_policy/privacy_police_page.dart';
import 'package:crypto_trader/src/ui/pages/search_page/search_page.dart';
import 'package:crypto_trader/src/ui/pages/security_page/security_page.dart';
import 'package:crypto_trader/src/ui/pages/settings_page/settings_page.dart';
import 'package:crypto_trader/src/ui/pages/user_profile/user_profile.dart';
import 'package:crypto_trader/src/ui/routes/app_routes.dart';
import 'package:crypto_trader/src/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class AppNavigator {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const CryptoHomePage(),
      ),
      GoRoute(
        path: AppRoutes.settingsP,
        builder: (context, state) => const SettingsPage(),
      ),
      GoRoute(
        path: AppRoutes.securityPage,
        builder: (context, state) => const SecurityPage(),
      ),
      GoRoute(
        path: AppRoutes.notificationPage,
        builder: (context, state) => const NotificationPage(),
      ),
      GoRoute(
        path: AppRoutes.search,
        builder: (context, state) => const SearchPage(),
      ),
//      GoRoute(
//   path: '${AppRoutes.cryptoPage}/:index',
//   builder: (context, state) {
//     final indexStr = state.pathParameters['index'];
//     if (indexStr == null) {

//       return ErrorPage(error: 'Index is missing');
//     }
//     int index;
//     try {
//       index = int.parse(indexStr);
//     } catch (e) {

//       return Fluttertoast(error: 'Index is not a number');
//     }
//     return CryptoPage(index: index);
//   },
// ),

      GoRoute(
        path: '${AppRoutes.cryptoPage}/:index',
        builder: (context, state) {
          final indexStr = state.pathParameters['index'];
          if (indexStr == null || int.tryParse(indexStr) == null) {
            Fluttertoast.showToast(
              msg: 'Invalid index: $indexStr',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
            );

            return Text('Invalid index: $indexStr');
          }

          return CryptoPage(
            index: int.parse(indexStr),
          );
        },
      ),

      GoRoute(
        path: AppRoutes.privacyPolicy,
        builder: (context, state) => const PrivacyPolicy(),
      ),
      GoRoute(
        path: AppRoutes.userProfile,
        builder: (context, state) => const UserProfile(),
      ),
      GoRoute(
        path: AppRoutes.identifyPerson,
        builder: (context, state) => const IdentifyPerson(),
      ),
      GoRoute(
        path: AppRoutes.aiSoon,
        builder: (context, state) => const CtbAi(),
      ),
      GoRoute(
        path: AppRoutes.helpandSupport,
        builder: (context, state) => const HelpAndSupport(),
      ),
      GoRoute(
        path: AppRoutes.registerPage,
        builder: (context, state) {
          RegistrationState registrationStateInstance = RegistrationState();
          return RegisterPage(state: registrationStateInstance);
        },
      ),
      GoRoute(
        path: AppRoutes.loginPage,
        builder: (context, state) {
          AuthState authStateInstance = AuthState();
          return LoginPage(state: authStateInstance);
        },
      ),
      GoRoute(
        path: AppRoutes.mainRegisterPage,
        builder: (context, state) => const MainRegisterPage(),
      ),
      GoRoute(
        path: AppRoutes.addCard,
        builder: (context, state) => AddCardPage(),
      ),
      GoRoute(
        path: AppRoutes.localAuthPage,
        builder: (context, state) => PinCodeWidget(),
      ),

    ],
  );
}
