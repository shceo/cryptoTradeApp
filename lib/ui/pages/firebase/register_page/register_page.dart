import 'package:crypto_trader/domain/blocs/authorization_bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key, required this.state});
  final RegistrationState state;

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
                  'Регистрация',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50,
                ),
                // поле для имени
                TextField(
                  controller: state.user.nameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Введите свое Имя'),
                ),
                const SizedBox(
                  height: 20,
                ),
                //поле для фамилии
                TextField(
                  controller: state.user.lastNameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Введите свою фамилию'),
                ),
                const SizedBox(
                  height: 20,
                ),
                // поле для почты
                TextField(
                  controller: state.user.emailController,
                  decoration: const InputDecoration(
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
                TextField(
                  controller: state.user.confrimPasswordsController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Введите пароль повторно'),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    state.signUpUser();
                  },
                  child: const Text('Регистрация'),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextButton(
                  onPressed: () {
                    context.read<AuthenticationBloc>().add(AuthEvent());
                  },
                  child: const Text('Есть Аккаунт? Авторизуйтесь'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
