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

import 'package:crypto_trader/src/components/slider_cr/slider_widget.dart';
import 'package:crypto_trader/src/ui/pages/search_page/trading_coins.dart';
import 'package:crypto_trader/src/ui/routes/app_routes.dart';
import 'package:crypto_trader/src/ui/theme/crypto_colors.dart';
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

        SliderCst(),
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
