import 'package:crypto_trader/components/slider_cr/slider_widget.dart';
import 'package:crypto_trader/ui/pages/search_page/trading_coins.dart';
import 'package:crypto_trader/ui/routes/app_routes.dart';
import 'package:crypto_trader/ui/theme/crypto_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CryptoColors.notblack,
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: CryptoColors.notblack,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: GestureDetector(
              onTap: () {
                context.go(AppRoutes.notificationPage);
              },
              child: SvgPicture.asset(
                'assets/icons/bell.svg',
                height: 32,
                width: 32,
              ),
            ),
          ),
        ],
      ),
      body: const MainPageBody(),
    );
  }
}

class MainPageBody extends StatelessWidget {
  const MainPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.only(left: 16, right: 16),
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20, top: 24),
          height: 140,
          width: double.infinity,
          decoration: BoxDecoration(
              color: CryptoColors.blue,
              image: const DecorationImage(
                  image: AssetImage('assets/images/main_banner.png'),
                  alignment: Alignment.bottomRight),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Снова привет,',
                style: TextStyle(fontSize: 12, color: CryptoColors.trueWhite),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Инвистируйте уже сегодня',
                style: TextStyle(fontSize: 18, color: CryptoColors.trueWhite),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 92,
                height: 31,
                child: FloatingActionButton(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Начать',
                    style: TextStyle(fontSize: 12, color: CryptoColors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),

        // crypto slider

        // FutureBuilder<List<CryptoCoin>>(
        //   future: CryptoCoinRepository().getCryptoCoinList(),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.done) {
        //       if (snapshot.hasError) {
        //         return Text('Ошибка: ${snapshot.error}');
        //       }

        //       final cryptolist = snapshot.data!;
        //       return SliderCst(cryptoData: cryptolist);
        //     } else {
        //       return CircularProgressIndicator();
        //     }
        //   },
        // ),

        SliderCst(
        ),
// корусель в главном экране

        const SizedBox(
          height: 32,
        ),
        Text('Популярные Криптовалюты',
            style: TextStyle(fontSize: 20, color: CryptoColors.trueWhite)),
        const SizedBox(
          height: 16,
        ),
        const TradingCoins()
      ],
    );
  }
}
