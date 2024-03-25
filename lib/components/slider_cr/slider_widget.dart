import 'package:carousel_slider/carousel_slider.dart';
import 'package:crypto_trader/blocs/crypto_bloc/crypto_bloc_bloc.dart';
import 'package:crypto_trader/ui/theme/crypto_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderCst extends StatelessWidget {
  const SliderCst({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoBlocBloc, CryptoBlocState>(
      builder: (context, state) {
        // List mainlist = ['bitcoin', 'tether', 'ethereum'];
        if (state is CryptoBlocIsLoaded) {
          return CarouselSlider.builder(
            itemCount: 3,
            itemBuilder: (context, itemIndex, pageViewIndex) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                  color: CryptoColors.grey.withOpacity(0.5),
                ),
                width: MediaQuery.of(context).size.width * 0.7,
                height: 45,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      // SizedBox(
                      //   width: MediaQuery.of(context).size.width * 0.4,
                      //   height: 100,
                      // ),
                     

                      //   // CryptoLine(
                      //   //   name:mainlist[itemIndex],
                      //   //   touch: false,
                      //   // ),
                      // ),
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
