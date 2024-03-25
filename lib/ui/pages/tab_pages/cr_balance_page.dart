import 'package:crypto_trader/ui/routes/app_routes.dart';
import 'package:crypto_trader/ui/theme/crypto_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
                      text: '0 \$',
                      style: TextStyle(
                        color: CryptoColors.trueWhite,
                        fontSize: 28,
                      ),
                    ),
                    const TextSpan(
                      text: '\t +0 %',
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
                      text: '0 \$',
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
            child: FloatingActionButton(onPressed: () {
              context.go(AppRoutes.addCard);
            },
            backgroundColor: CryptoColors.blue,
            focusColor: CryptoColors.blue,
            child: Text('Добавить банковскую карту', style: TextStyle(color: CryptoColors.notwhite, fontSize: 18, fontFamily: 'Montserrat'),),
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
