import 'package:crypto_trader/ui/theme/crypto_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CryptoColors.notblack,
        appBar: AppBar(
          backgroundColor: CryptoColors.notblack,
          toolbarHeight: 40,
          actions: [
            SvgPicture.asset(
              'assets/icons/bell.svg',
            ),
          ],
        ));
  }
}
