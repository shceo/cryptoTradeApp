import 'package:crypto_trader/ui/pages/home_page/home_page.dart';
import 'package:crypto_trader/ui/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

class AppNavigator {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const CryptoHomePage(),
      ),
      
    ],
  );
}
