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


import 'package:crypto_trader/src/exports.dart';
import 'package:flutter/material.dart';

class Transfer extends StatelessWidget {
  const Transfer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CryptoColors.notblack,
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          'Переводы',
          style: TextStyle(color: CryptoColors.trueWhite, fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: CryptoColors.notblack,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Выберите систему перевода',
              style: TextStyle(color: CryptoColors.grey, fontSize: 18),
            ),
          ),
          Expanded(child: TransferBody()),
        ],
      ),
    );
  }
}

class TransferBody extends StatelessWidget {
  const TransferBody({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {'image': 'assets/images/main_banner.png', 'text': 'CTB wallet'},
      {'image': 'assets/images/qiwi.png', 'text': 'Qiwi'},
      {'image': 'assets/images/payeer.png', 'text': 'PAYEER'},
      {'image': 'assets/images/paypal.png', 'text': 'Pay Pal'},
      {'image': 'assets/images/visa.png', 'text': 'Visa Card'},
      {'image': 'assets/images/webMoney.png', 'text': 'Web Money'},
      {'image': 'assets/images/mir.png', 'text': 'Мир'},
      {'image': 'assets/images/bitcoin.png', 'text': 'Bitcoin'},
      {'image': 'assets/images/unionpay.png', 'text': 'Union Pay'},
      {'image': 'assets/images/uzcard.png', 'text': 'Uzcard'},
      {'image': 'assets/images/mastercard.png', 'text': 'Master Card'},
      {'image': 'assets/images/advcash.png', 'text': 'Advcash'},
      {'image': 'assets/images/sber.png', 'text': 'Сбербанк'},
      {'image': 'assets/images/humo.png', 'text': 'Humo'},
      {'image': 'assets/images/qiwi.png', 'text': 'QIWI'},
      // {'image': 'assets/images/payeer.png', 'text': 'PAYEER'},
      // {'image': 'assets/images/paypal.png', 'text': 'PAY PAL'},
      // {'image': 'assets/images/qiwi.png', 'text': 'QIWI'},
      // {'image': 'assets/images/payeer.png', 'text': 'PAYEER'},
    ];

    return GridView.builder(
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  imagePath: items[index]['image']!,
                  text: items[index]['text']!,
                ),
              ),
            );
          },
          child: buildContainer(items[index]['image']!, items[index]['text']!),
        );
      },
    );
  }

  Container buildContainer(String imagePath, String text) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: 150.0,
      height: 150.0,
      decoration: BoxDecoration(
        color: CryptoColors.mablack.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              imagePath,
              width: 55,
              height: 55,
            ),
          ),
          Center(
            child: Text(
              text,
              style: TextStyle(color: CryptoColors.notwhite, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
