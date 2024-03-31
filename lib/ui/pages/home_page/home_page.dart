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

import 'package:crypto_trader/ui/pages/crypto_app_body/app_body.dart';
import 'package:crypto_trader/components/navbar_models/nav_bar_widget.dart';
import 'package:crypto_trader/ui/pages/tab_pages/cr_balance_page.dart';
import 'package:crypto_trader/ui/pages/tab_pages/transfer_page.dart';
import 'package:crypto_trader/ui/pages/tab_pages/market_page.dart';
import 'package:crypto_trader/ui/pages/tab_pages/profile.dart';
import 'package:crypto_trader/ui/pages/tab_pages/tab_main_page.dart';
import 'package:crypto_trader/ui/theme/crypto_colors.dart';
import 'package:flutter/material.dart';

class CryptoHomePage extends StatelessWidget {
  const CryptoHomePage({super.key});

  // главная страница + нижний таб бар

  static List<Widget> screens = [
    const MainPage(),
    const CrBalancePage(),
    const Transfer(),
    const MarketPage(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CryptoColors.notblack,
      body: const CryptoAppBody(),
      bottomNavigationBar: TabBarWidget(screens: screens),
    );
  }
}
