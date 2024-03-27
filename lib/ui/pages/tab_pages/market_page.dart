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

import 'package:crypto_trader/components/tabs/custom_tab_bar.dart';
import 'package:crypto_trader/domain/api/api.dart';
import 'package:crypto_trader/domain/models/crytpo_coin.dart';
import 'package:crypto_trader/domain/providers/favoritelist_provider.dart';
import 'package:crypto_trader/ui/routes/app_routes.dart';
import 'package:crypto_trader/ui/theme/crypto_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MarketPage extends StatelessWidget {
  const MarketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: CryptoColors.notblack,
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: CryptoColors.notblack,
          title: FutureBuilder<double>(
            future: calculateMarketChange(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text('Загрузка...');
              } else if (snapshot.hasError) {
                return Text(
                  'Ошибка загрузки',
                  style: TextStyle(color: CryptoColors.notwhite),
                );
              } else {
                final marketChange = snapshot.data!;
                final marketTrendText =
                    marketChange < 0 ? 'Рынок упал на ' : 'Рынок поднялся на ';
                final marketChangePercentage =
                    marketChange.abs().toStringAsFixed(2) + '%';
                return RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: marketTrendText,
                        style: TextStyle(
                            fontSize: 18, color: CryptoColors.trueWhite),
                      ),
                      TextSpan(
                        text: marketChangePercentage,
                        style: TextStyle(
                          fontSize: 18,
                          color: marketChange < 0 ? Colors.red : Colors.green,
                        ),
                      ),
                      TextSpan(
                        text: '\nотчет за последние 24 часа',
                        style:
                            TextStyle(fontSize: 10, color: CryptoColors.grey),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                context.go(AppRoutes.search);
              },
              icon: Icon(
                Icons.search_rounded,
                size: 30,
                color: CryptoColors.trueWhite,
              ),
            ),
          ],
        ),
        body: const MarketPageBody(),
      ),
    );
  }
}

@override
Size get preferredSize => const Size.fromHeight(100);

class MarketPageBody extends StatelessWidget {
  const MarketPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: CryptoColors.notblack,
      child: DefaultTabController(
        length: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'Криптовалюты',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: CryptoColors.trueWhite,
                    fontStyle: FontStyle.normal),
              ),
            ),
            CustomTabBar(),
            Expanded(
              child: TabBarView(
                children: [
                  FutureBuilder<List<CryptoCoin>>(
                    future: CryptoCoinRepository().getCryptoCoinList(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Ошибка: ${snapshot.error}'));
                      } else if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final coin = snapshot.data![index];
                            return ListTile(
                                title: Text(
                                  coin.symbol,
                                  style:
                                      TextStyle(color: CryptoColors.notwhite),
                                ),
                                subtitle: Text(
                                  '${coin.name}',
                                  style: TextStyle(color: CryptoColors.grey),
                                ),
                                leading: CachedNetworkImage(
                                  imageUrl: coin.image,
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                                trailing: RichText(
                                  textAlign: TextAlign.end,
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            '${coin.change > 0 ? 'Вырос на' : 'Упал на'}: ',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: CryptoColors.notwhite,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            '${coin.change.toStringAsFixed(2)} %',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: coin.change > 0
                                              ? CryptoColors.graphGreen
                                              : CryptoColors.graphRed,
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                          },
                        );
                      } else {
                        return Center(child: Text('Нет данных'));
                      }
                    },
                  ),
                  FutureBuilder<List<CryptoCoin>>(
                    future: CryptoCoinRepository().getCryptoCoinList(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Ошибка: ${snapshot.error}'));
                      } else if (snapshot.hasData) {
                        final growingCoins = snapshot.data!
                            .where((coin) => coin.change > 0)
                            .toList();
                        return ListView.builder(
                          itemCount: growingCoins.length,
                          itemBuilder: (context, index) {
                            final coin = growingCoins[index];
                            return ListTile(
                                title: Text(
                                  coin.symbol,
                                  style:
                                      TextStyle(color: CryptoColors.notwhite),
                                ),
                                subtitle: Text(
                                  '${coin.name}',
                                  style: TextStyle(color: CryptoColors.grey),
                                ),
                                leading: CachedNetworkImage(
                                  imageUrl: coin.image,
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                                trailing: RichText(
                                  textAlign: TextAlign.end,
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            '${coin.change > 0 ? 'Вырос на' : ''} ',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: CryptoColors.notwhite,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            '${coin.change.toStringAsFixed(2)} %',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: coin.change > 0
                                              ? CryptoColors.graphGreen
                                              : CryptoColors.graphRed,
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                          },
                        );
                      } else {
                        return Center(child: Text('Нет данных'));
                      }
                    },
                  ),
                  FutureBuilder<List<CryptoCoin>>(
                    future: CryptoCoinRepository().getCryptoCoinList(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Ошибка: ${snapshot.error}'));
                      } else if (snapshot.hasData) {
                        final growingCoins = snapshot.data!
                            .where((coin) => coin.change < 0)
                            .toList();
                        return ListView.builder(
                          itemCount: growingCoins.length,
                          itemBuilder: (context, index) {
                            final coin = growingCoins[index];
                            return ListTile(
                                title: Text(
                                  coin.symbol,
                                  style:
                                      TextStyle(color: CryptoColors.notwhite),
                                ),
                                subtitle: Text(
                                  '${coin.name}',
                                  style: TextStyle(color: CryptoColors.grey),
                                ),
                                leading: CachedNetworkImage(
                                  imageUrl: coin.image,
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                                trailing: RichText(
                                  textAlign: TextAlign.end,
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            '${coin.change < 0 ? 'Упал на' : ''} ',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: CryptoColors.notwhite,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            '${coin.change.toStringAsFixed(2)} %',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: coin.change > 0
                                              ? CryptoColors.graphGreen
                                              : CryptoColors.graphRed,
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                          },
                        );
                      } else {
                        return Center(child: Text('Нет данных'));
                      }
                    },
                  ),
                  Consumer<FavoritesProvider>(
                    builder: (context, favoritesProvider, child) {
                      final isFavoriteEmpty =
                          favoritesProvider.favorites.isEmpty;

                      return isFavoriteEmpty
                          ? Container(
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/favoriteim.png',
                                    ),
                                    Text(
                                      'Специальное окно для ваших любимых криптовалют!',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: CryptoColors.trueWhite,
                                      ),
                                    ),
                                    Text(
                                      'Добавьте ваши любимые криптовалюты и проверяйте с легкостью!',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: CryptoColors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Column(
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                    itemCount:
                                        favoritesProvider.favorites.length,
                                    itemBuilder: (context, index) {
                                      final favoriteCoin =
                                          favoritesProvider.favorites[index];
                                      return ListTile(
                                        title: Text(
                                          favoriteCoin.symbol,
                                          style: TextStyle(
                                              color: CryptoColors.notwhite),
                                        ),
                                        subtitle: Text(
                                          favoriteCoin.name,
                                          style: TextStyle(
                                              color: CryptoColors.grey),
                                        ),
                                        leading: CachedNetworkImage(
                                          imageUrl: favoriteCoin.image,
                                          placeholder: (context, url) =>
                                              CircularProgressIndicator(),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                        onTap: () {
                                          favoritesProvider.removeFromFavorites(
                                              favoriteCoin);
                                        },
                                      );
                                    },
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    favoritesProvider.clearFavorites();
                                  },
                                  child: Text('Очистить избранное'),
                                ),
                              ],
                            );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
