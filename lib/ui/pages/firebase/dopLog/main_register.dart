import 'package:crypto_trader/ui/pages/firebase/dopLog/auth_page/auth_page.dart';
import 'package:crypto_trader/ui/pages/home_page/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainRegisterPage extends StatelessWidget {
  const MainRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const AuthPage();
          }
           else {
            return const CryptoHomePage();
          }
        });
  }
}
