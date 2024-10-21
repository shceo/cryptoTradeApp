import 'package:crypto_trader/src/components/tab_model.dart';
import 'package:crypto_trader/src/ui/theme/crypto_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    super.key,
    required this.screens,
  });

  final List<Widget> screens;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      // backgroundColor: CryptoColors.notblack,
      tabBar: CupertinoTabBar(
        backgroundColor: CryptoColors.notblack,
        height: 70,
        items: const [
          BottomNavigationBarItem(
            icon: NavigationTabItem(
              icon: Icons.home_filled,
              active: false,
              text: 'Главная',
            ),
            activeIcon: NavigationTabItem(
              icon: Icons.home_filled,
              active: true,
              text: 'Главная',
            ),
          ),
          BottomNavigationBarItem(
            icon: NavigationTabItem(
              icon: Icons.account_balance_wallet,
              active: false,
              text: 'Баланс',
            ),
            activeIcon: NavigationTabItem(
              icon: Icons.account_balance_wallet,
              active: true,
              text: 'Баланс',
            ),
          ),
          BottomNavigationBarItem(
            icon: NavigationTabItem(
              icon: Icons.sync_alt,
              active: false,
              text: 'Перевести',
            ),
            activeIcon: NavigationTabItem(
              icon: Icons.sync_alt,
              active: true,
              text: 'Перевести',
            ),
          ),
          BottomNavigationBarItem(
            icon: NavigationTabItem(
              icon: Icons.signal_cellular_alt_rounded,
              active: false,
              text: 'Биржа',
            ),
            activeIcon: NavigationTabItem(
              icon: Icons.signal_cellular_alt_rounded,
              active: true,
              text: 'Биржа',
            ),
          ),
          BottomNavigationBarItem(
            icon: NavigationTabItem(
              icon: Icons.person_outline,
              active: false,
              text: 'Профиль',
            ),
            activeIcon: NavigationTabItem(
              icon: Icons.person_outline,
              active: true,
              text: 'Профиль',
            ),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return screens[index];
          },
        );
      },
    );
  }
}
