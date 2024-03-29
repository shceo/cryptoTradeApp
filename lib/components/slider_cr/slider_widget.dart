import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:crypto_trader/blocs/crypto_bloc/crypto_bloc_bloc.dart';
import 'package:crypto_trader/components/crypto_line.dart';
import 'package:crypto_trader/domain/models/crytpo_coin.dart';
import 'package:crypto_trader/ui/theme/crypto_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderCst extends StatelessWidget {
  const SliderCst({Key? key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 4,
      itemBuilder: (context, index, pageViewIndex) {
        return BlocBuilder<CryptoBlocBloc, CryptoBlocState>(
          builder: (context, state) {
            if (state is CryptoBlocIsLoaded) {
              List<CryptoCoin> cryptoList = state.coinsList.sublist(0, 4);
              CryptoCoin crypto = cryptoList[index];
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                  color: CryptoColors.grey.withOpacity(0.5),
                ),
                width: MediaQuery.of(context).size.width * 0.7,
                height: 100,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: CryptoLineBackground(crypto: crypto),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CachedNetworkImage(
                            imageUrl: crypto.image,
                            width: 50,
                            height: 50,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  crypto.name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 19.5,
                                    color: CryptoColors.notwhite,
                                  ),
                                ),
                                Text(
                                  '${crypto.symbol}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: CryptoColors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            '\$${crypto.price.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 16,
                              color: crypto.change >= 0
                                  ? CryptoColors.graphGreen
                                  : CryptoColors.graphRed,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            return SizedBox();
          },
        );
      },
      options: CarouselOptions(
        aspectRatio: 4.0,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 5),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class CryptoLineBackground extends StatelessWidget {
  const CryptoLineBackground({Key? key, required this.crypto})
      : super(key: key);

  final CryptoCoin crypto;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6, // уменьшаем ширину
      height: 50, // уменьшаем высоту
      child: CryptoLine(name: crypto.name, touch: false),
    );
  }
}
