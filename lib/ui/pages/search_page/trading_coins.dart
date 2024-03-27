import 'package:crypto_trader/blocs/crypto_bloc/crypto_bloc_bloc.dart';
import 'package:crypto_trader/ui/routes/app_routes.dart';
import 'package:crypto_trader/ui/theme/crypto_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:cached_network_image/cached_network_image.dart';

class TradingCoins extends StatelessWidget {
  const TradingCoins({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CryptoBlocBloc>().add(CryptoLoadList());
    return BlocListener<CryptoBlocBloc, CryptoBlocState>(
      listener: (context, state) {},
      child: BlocBuilder<CryptoBlocBloc, CryptoBlocState>(
        builder: (context, state) {
          if (state is CryptoBlocIsLoaded) {
            final _cryptoCoinsList = state.coinsList;
            return ListView.separated(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return ListTile(
                  onTap: () {
                    context.go('${AppRoutes.cryptoPage}/${i}');
                  },
                  leading: CachedNetworkImage(
                    imageUrl: _cryptoCoinsList[i].image,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  title: Text(
                    _cryptoCoinsList[i].name,
                    style: TextStyle(color: CryptoColors.trueWhite),
                  ),
                  subtitle: Text(_cryptoCoinsList[i].symbol),
                  trailing: SizedBox(
                    width: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${_cryptoCoinsList[i].price.toStringAsFixed(3)} \$',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 16,
                            color: CryptoColors.trueWhite,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${_cryptoCoinsList[i].change.toStringAsFixed(2)} %',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 10,
                            color: _cryptoCoinsList[i].change > 0
                                ? CryptoColors.graphGreen
                                : CryptoColors.graphRed,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 8,
              ),
              itemCount: _cryptoCoinsList.length,
            );
          } else if (state is CryptoBlocLoadingFailure) {
            return Center(
              child: Column(
                children: [
                  const Text(
                    'Что-то пошло не так',
                    style: TextStyle(fontSize: 28, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 100,
                    height: 30,
                    child: IconButton(
                      icon: const Icon(
                        Icons.refresh,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        context.read<CryptoBlocBloc>().add(CryptoLoadList());
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
