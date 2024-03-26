import 'package:crypto_trader/components/tabs/tab_indecator.dart';
import 'package:crypto_trader/ui/theme/crypto_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/providers/tab_bar_model.dart';

class CustomTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TabBarModel>(
      builder: (context, model, child) {
        return Padding(
          padding:const  EdgeInsets.only(top: 24),
          child: TabBar(
            onTap: (index) {
              model.currentIndex = index;
            },
            indicator: CircleTabIndicator(color: CryptoColors.blue, radius: 3),
            dividerColor: Colors.transparent,
            unselectedLabelColor: CryptoColors.grey,
            labelColor: CryptoColors.blue,
            tabs: const [
              Tab(text: 'All',),
              Tab(text: 'Gainer'),
              Tab(text: 'Loser'),
              Tab(text: 'Favorite'),
            ],
          ),
        );
      },
    );
  }
}
