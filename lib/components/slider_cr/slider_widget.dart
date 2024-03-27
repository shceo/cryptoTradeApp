import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:crypto_trader/blocs/crypto_bloc/crypto_bloc_bloc.dart';
import 'package:crypto_trader/domain/models/crytpo_coin.dart';
import 'package:crypto_trader/ui/theme/crypto_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderCst extends StatelessWidget {
  const SliderCst({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoBlocBloc, CryptoBlocState>(
      builder: (context, state) {
        if (state is CryptoBlocIsLoaded) {
          List<CryptoCoin> cryptoList = state.coinsList;

          return CarouselSlider.builder(
            itemCount: cryptoList.length,
            itemBuilder: (context, index, pageViewIndex) {
              CryptoCoin crypto = cryptoList[index];
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                  color: CryptoColors.grey.withOpacity(0.5),
                ),
                width: MediaQuery.of(context).size.width * 0.7,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CachedNetworkImage(
                        imageUrl: crypto.image,
                        width: 50,
                        height: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            crypto.name, // Название криптовалюты
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            '\$${crypto.price.toStringAsFixed(2)}', // Цена криптовалюты
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            options: CarouselOptions(
              aspectRatio: 4.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 7),
              scrollDirection: Axis.horizontal,
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
