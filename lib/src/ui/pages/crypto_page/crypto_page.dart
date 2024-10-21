import 'package:crypto_trader/src/data/blocs/crypto_bloc/crypto_bloc_bloc.dart';
import 'package:crypto_trader/src/data/blocs/crypto_history_bloc/bloc/crypto_history_bloc_bloc.dart';
import 'package:crypto_trader/src/components/crypto_line.dart';
import 'package:crypto_trader/src/data/models/crytpo_coin.dart';
import 'package:crypto_trader/src/data/providers/favoritelist_provider.dart';
import 'package:crypto_trader/src/ui/routes/app_routes.dart';
import 'package:crypto_trader/src/ui/theme/crypto_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CryptoPage extends StatelessWidget {
  const CryptoPage({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return BlocListener<CryptoBlocBloc, CryptoBlocState>(
      listener: (context, state) {},
      child: BlocBuilder<CryptoBlocBloc, CryptoBlocState>(
        builder: (context, state) {
          if (state is CryptoBlocIsLoaded) {
            final _cryptoBlocList = state.coinsList;
            final isFavorite = favoritesProvider.favorites.contains(CryptoCoin);

            return Scaffold(
              backgroundColor: CryptoColors.notblack,
              appBar: AppBar(
                backgroundColor: CryptoColors.notblack,
                leading: IconButton(
                  onPressed: () {
                    context.go(AppRoutes.home);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: CryptoColors.notwhite,
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Image.network(_cryptoBlocList[index].image),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${_cryptoBlocList[index].name}',
                      style: TextStyle(
                        fontSize: 16,
                        color: CryptoColors.notwhite,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${_cryptoBlocList[index].symbol}',
                      style: TextStyle(
                        fontSize: 10,
                        color: CryptoColors.grey,
                      ),
                    ),
                    const SizedBox(width: 12),
                    SizedBox(
                      width: 16,
                      height: 16,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          final cryptoCoin = _cryptoBlocList[index];
                          if (isFavorite) {
                            favoritesProvider.removeFromFavorites(cryptoCoin);
                          } else {
                            favoritesProvider.addToFavorites(cryptoCoin);
                          }
                        },
                        icon: Icon(
                          isFavorite ? Icons.star : Icons.star_border_outlined,
                          size: 16,
                          color: isFavorite
                              ? CryptoColors.graphRed
                              : CryptoColors.notwhite,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              body: CryptoPageBody(
                index: index,
              ),
              persistentFooterAlignment: AlignmentDirectional.center,
              persistentFooterButtons: [
                SizedBox(
                  width: 164,
                  height: 48,
                  child: FloatingActionButton(
                    onPressed: () {},
                    child: const Text('Купить'),
                  ),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  width: 164,
                  height: 48,
                  child: FloatingActionButton(
                    onPressed: () {},
                    child: const Text('Продать'),
                  ),
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class CryptoPageBody extends StatelessWidget {
  const CryptoPageBody({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final List<String> period = ['1 H', '24 H', '1 W', '1 M', '6 M'];
    final List<String> interval = ['m5', 'h2', 'h6', 'h12', 'd1'];

    return BlocListener<CryptoBlocBloc, CryptoBlocState>(
      listener: (context, state) {},
      child: BlocBuilder<CryptoBlocBloc, CryptoBlocState>(
        builder: (context, state) {
          if (state is CryptoBlocIsLoaded) {
            final String name = state.coinsList[index].name.toLowerCase();

            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${state.coinsList[index].price.toStringAsFixed(2)} \$',
                              style: TextStyle(
                                fontSize: 24,
                                color: CryptoColors.grey,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              '${state.coinsList[index].change.toStringAsFixed(2)} %',
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: CryptoLine(name: name),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 40,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, i) {
                              return FloatingActionButton(
                                heroTag: '${name}_$i',
                                // Unique heroTag
                                onPressed: () {
                                  context.read<CryptoHistoryBlocBloc>().add(
                                        CryptoHistoryBlocIntervalEvent(
                                          name:
                                              '${state.coinsList[index].name.toLowerCase()}',
                                          interval: interval[i],
                                        ),
                                      );
                                },
                                child: Text(period[i]),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 10),
                            itemCount: period.length,
                          ),
                        ),
                        const SizedBox(height: 21),
                        ListTile(
                          leading: Image.network(state.coinsList[index].image),
                          title: Text(
                            state.coinsList[index].name,
                            style: TextStyle(color: CryptoColors.notwhite),
                          ),
                          subtitle: const Text('00.00 BTC'),
                          trailing: const Text('00.00'),
                        ),
                        const SizedBox(height: 8),
                        ListTile(
                          title: const Text('Транзакции'),
                          trailing: const Icon(Icons.arrow_forward),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
