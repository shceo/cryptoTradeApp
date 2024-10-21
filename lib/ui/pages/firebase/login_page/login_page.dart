import 'package:crypto_trader/domain/blocs/authorization_bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, required this.state});
final AuthState state;

  @override
  Widget build(BuildContext context) {
   final size = MediaQuery.of(context).size;
    return Material(
      child: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
        color: Colors.white,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Авторизация',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50,
                ),
                // поле для имени
                const SizedBox(
                  height: 20,
                ),
                // поле для почты
                 TextField(
                    controller: state.user.emailController,
                  decoration:const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Введите свою почту (email)'),
                ),
                const SizedBox(
                  height: 20,
                ),
                // пароль
                 TextField(
                    controller: state.user.passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Введите пароль'),
                ),
                const SizedBox(
                  height: 20,
                ),
                // проверка пароля
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    state.signInUser();
                  },
                  child: const Text('Авторизация'),
                ),
                const SizedBox(
                  height: 30,
                ),
      
                TextButton(
                  onPressed: () {
                    context.read<AuthenticationBloc>().add(RegisterEvent());
                  },
                  child: const Text('Нет аккаунта? Зарегистрируйтесь'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}