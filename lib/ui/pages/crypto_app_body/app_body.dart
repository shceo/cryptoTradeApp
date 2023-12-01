import 'package:flutter/material.dart';

class CryptoAppBody extends StatelessWidget {
  const CryptoAppBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FloatingActionButton.extended(onPressed: (){}, label: Text('data')),
    );
  }
}