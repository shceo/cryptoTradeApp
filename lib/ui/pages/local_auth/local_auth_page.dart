import 'package:crypto_trader/ui/theme/crypto_colors.dart';
import 'package:flutter/material.dart';

class LocalAuthPage extends StatelessWidget {
  const LocalAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: CryptoColors.notblack,
        appBar: AppBar(
          toolbarHeight: 50,
          actions: [
          TextButton(onPressed: (){}, child: Text('Забыл пароль', style: TextStyle(color: CryptoColors.grey),))  
          ],
        ),
        
      ),
    );
  }
}
