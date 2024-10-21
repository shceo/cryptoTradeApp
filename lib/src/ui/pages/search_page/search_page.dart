import 'package:crypto_trader/src/data/blocs/crypto_bloc/crypto_bloc_bloc.dart';
import 'package:crypto_trader/src/ui/pages/search_page/trading_coins.dart';
import 'package:crypto_trader/src/ui/routes/app_routes.dart';
import 'package:crypto_trader/src/ui/theme/crypto_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CryptoColors.notblack,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.go(AppRoutes.home);
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded, color: CryptoColors.trueWhite,)),
        toolbarHeight: 100,
        backgroundColor: CryptoColors.notblack,
        title: TextField(
          onChanged: (value) {
            context.read<CryptoBlocBloc>().add(CryptoLoadSearch(search: value.toLowerCase()));
          },
          style: TextStyle(color: CryptoColors.trueWhite),
          decoration: const InputDecoration(
            labelText: "Поиск",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
        ),
      ),
      body: const SearchResults(),
    );
  }
}

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return TradingCoins();
  }
}
