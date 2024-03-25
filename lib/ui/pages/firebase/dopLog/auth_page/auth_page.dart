import 'package:crypto_trader/blocs/authorization_bloc/authentication_bloc.dart';
import 'package:crypto_trader/ui/pages/firebase/login_page/login_page.dart';
import 'package:crypto_trader/ui/pages/firebase/register_page/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AuthBody(),
    );
  }
}

class AuthBody extends StatelessWidget {
  const AuthBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is RegistrationState) {
          return RegisterPage(state: state);
        }
        if (state is AuthState) {
          return LoginPage(state: state);
        }
        return const SizedBox();
      },
    );
  }
}
