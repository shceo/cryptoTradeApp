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

import 'package:crypto_trader/domain/providers/userbalance_provider.dart';
import 'package:crypto_trader/ui/routes/app_routes.dart';
import 'package:crypto_trader/ui/theme/crypto_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CrBalancePage extends StatelessWidget {
  const CrBalancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CryptoColors.notblack,
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: CryptoColors.notblack,
      ),
      body: const CrBalanceBody(),
    );
  }
}

class CrBalanceBody extends StatelessWidget {
  const CrBalanceBody({super.key});

  @override
  Widget build(BuildContext context) {
    final userAccount = Provider.of<UserAccount>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    

    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
        width: screenWidth - 32,
        height: 196,
        margin: const EdgeInsets.only(top: 12, left: 16, right: 16),
        decoration: BoxDecoration(
          color: CryptoColors.blue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 20),
              child: Text(
                'Баланс',
                style: TextStyle(color: CryptoColors.trueWhite),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 20),
              child: Text(
                'Рыночная стоимость',
                style: TextStyle(color: CryptoColors.trueWhite),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 20),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${userAccount.balance} \$',
                      style: TextStyle(
                        color: CryptoColors.trueWhite,
                        fontSize: 28,
                      ),
                    ),
                    TextSpan(
                      text:
                          '\t ${userAccount.percentChange.toStringAsFixed(2)}%',
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.68),
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Сумма инвестиции\n',
                      style: TextStyle(
                        color: CryptoColors.trueWhite,
                        fontSize: 10,
                      ),
                    ),
                    TextSpan(
                      text: '${userAccount.investments} \$',
                      style: TextStyle(
                          color: CryptoColors.trueWhite, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 15,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: screenWidth - 32,
            height: 196,
            margin: const EdgeInsets.only(top: 12, left: 16, right: 16),
            decoration: BoxDecoration(
              color: CryptoColors.blue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: FloatingActionButton(
              onPressed: () {
                context.go(AppRoutes.addCard);
              },
              backgroundColor: CryptoColors.blue,
              focusColor: CryptoColors.blue,
              child: Text(
                'Добавить банковскую карту',
                style: TextStyle(
                    color: CryptoColors.notwhite,
                    fontSize: 18,
                    fontFamily: 'Montserrat'),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            margin: const EdgeInsets.only(left: 16),
            alignment: Alignment.topLeft,
            child: Text(
              'Твои Криптовалюты:',
              style: TextStyle(color: CryptoColors.trueWhite, fontSize: 20),
            ),
          ),
        ],
      ),
    ]);
  }
}
