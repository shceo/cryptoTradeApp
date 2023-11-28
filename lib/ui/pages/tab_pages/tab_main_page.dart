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
        toolbarHeight: 65,
        backgroundColor: CryptoColors.notblack,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: GestureDetector(
              onTap: () {
                
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
    );
  }
}
