import 'package:crypto_trader/providers/currencyvswindow.dart';
import 'package:crypto_trader/ui/theme/crypto_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  DetailPage({required this.imagePath, required this.text});

  final String imagePath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CryptoColors.notblack,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: CryptoColors.notblack,
        leading: IconButton(
            color: CryptoColors.trueWhite,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded)),
        title: Text(
          'Перевод через ${text}',
          style: TextStyle(fontSize: 20, color: CryptoColors.trueWhite),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: CryptoColors.trueWhite),
                    decoration: InputDecoration(
                      labelText: 'Введите сумму перевода',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                GestureDetector(
                  onTap: () {
                    showCurrencyPicker(context);
                  },
                  child: Consumer<CurrencyModel>(
                    builder: (context, currencyModel, child) {
                      return Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                currencyModel
                                    .selectedCurrency,
                                style: TextStyle(
                                  fontSize: 24.0,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'Валюта',
                                style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(width: 15.0),
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Введите номер ${text}',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(text),
            Expanded(child: Container()),
            ElevatedButton(
              onPressed: () {
                //
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 105, vertical: 20),
                child: Text('Перевести'),
              ),
              style: ElevatedButton.styleFrom(
                shadowColor: CryptoColors.trueWhite,
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  void showCurrencyPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Выберите валюту'),
          content: SingleChildScrollView(
            child: ListBody(
              children: currencies.map((currency) {
                return GestureDetector(
                  child: Text(currency),
                  onTap: () {
                    Provider.of<CurrencyModel>(context, listen: false)
                        .setSelectedCurrency(currency);
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}

List<String> currencies = ['USD', 'EUR', 'RUB', 'JPY', 'GBP', 'CNY'];
