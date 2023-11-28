import 'package:crypto_trader/components/tab_bar_model.dart';
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
      tabBar: CupertinoTabBar(
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
              icon: Icons.account_balance_outlined,
              active: false,
              text: 'Баланс',
            ),
            activeIcon: NavigationTabItem(
              icon: Icons.account_balance_outlined,
              active: true,
              text: 'Баланс',
            ),
          ),
          BottomNavigationBarItem(
            icon: NavigationTabItem(
              icon: Icons.abc,
              active: false,
              text: '',
            ),
            activeIcon: NavigationTabItem(
              icon: Icons.abc,
              active: true,
              text: '',
            ),
          ),
          BottomNavigationBarItem(
            icon: NavigationTabItem(
              icon: Icons.abc,
              active: false,
              text: 'Подписки',
            ),
            activeIcon: NavigationTabItem(
              icon: Icons.ad_units,
              active: true,
              text: 'Подписки',
            ),
          ),
          BottomNavigationBarItem(
            icon: NavigationTabItem(
              icon: Icons.abc,
              active: false,
              text: 'Вы',
            ),
            activeIcon: NavigationTabItem(
              icon: Icons.ad_units,
              active: true,
              text: 'Вы',
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
