import 'package:crypto_trader/ui/pages/crypto_app_body/app_body.dart';
import 'package:crypto_trader/components/tab_models/tab_bar_widget.dart';
import 'package:crypto_trader/ui/pages/tab_pages/cr_balance_page.dart';
import 'package:crypto_trader/ui/pages/tab_pages/transfer_page.dart';
import 'package:crypto_trader/ui/pages/tab_pages/market_page.dart';
import 'package:crypto_trader/ui/pages/tab_pages/profile.dart';
import 'package:crypto_trader/ui/pages/tab_pages/tab_main_page.dart';
import 'package:crypto_trader/ui/theme/crypto_colors.dart';
import 'package:flutter/material.dart';

class CryptoHomePage extends StatelessWidget {
  const CryptoHomePage({super.key});

  // главная страница + нижний таб бар

  static List<Widget> screens = [
    const MainPage(),
    const CrBalancePage(),
    const Transfer(),
    const MarketPage(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CryptoColors.notblack,
      body: const CryptoAppBody(),
      bottomNavigationBar: TabBarWidget(screens: screens),
    );
  }
}
