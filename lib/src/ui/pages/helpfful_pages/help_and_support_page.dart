import 'package:crypto_trader/src/ui/theme/crypto_colors.dart';
import 'package:flutter/material.dart';

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CryptoColors.notblack,
      appBar: AppBar(
        backgroundColor: CryptoColors.notblack,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded)),
      ),
    );
  }
}
