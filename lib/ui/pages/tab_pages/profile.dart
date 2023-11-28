import 'package:crypto_trader/ui/routes/app_routes.dart';
import 'package:crypto_trader/ui/theme/crypto_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CryptoColors.notblack,
      body: const ProfileBody(),
    );
  }
}

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 26,
          ),
          Center(
            child: Container(
              width: 360,
              height: 209,
              margin: const EdgeInsets.only(top: 12, right: 16, left: 16),
              decoration: BoxDecoration(
                color: CryptoColors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 44,
                    backgroundImage: NetworkImage(
                        'https://i.pinimg.com/564x/f4/18/59/f418595269b905129253b177fdc2596a.jpg'),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'имя/фамилия',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    'електронная почта',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Text(
                    '+1....   номер телефона',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(
            height: 32,
          ),

          // first butttttttton
          Column(
            children: [
              GestureDetector(
                onTap: () {
                   context.go(AppRoutes.settingsP);
                },
                child: Padding(
                  padding: EdgeInsets.only(bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.update_rounded,
                          size: 35, color: CryptoColors.blue),
                      const SizedBox(width: 16.73),
                      Text('Настройки',
                          style: TextStyle(
                              color: CryptoColors.trueWhite, fontSize: 18)),
                      Expanded(child: Container()),
                      Icon(Icons.arrow_forward_ios, color: CryptoColors.grey),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 24),
                child: Divider(color: Colors.grey),
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.only(bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.security_outlined,
                          size: 35, color: CryptoColors.blue),
                      const SizedBox(width: 16.73),
                      Text('Безопасность',
                          style: TextStyle(
                              color: CryptoColors.trueWhite, fontSize: 18)),
                      Expanded(child: Container()),
                      Icon(Icons.arrow_forward_ios, color: CryptoColors.grey),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 24),
                child: Divider(color: Colors.grey),
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.only(bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.update_rounded,
                          size: 25, color: CryptoColors.blue),
                      const SizedBox(width: 16.73),
                      Text(
                        'Текст 1',
                        style: TextStyle(
                            color: CryptoColors.trueWhite, fontSize: 18),
                      ),
                      Expanded(child: Container()),
                      Icon(Icons.arrow_forward_ios, color: CryptoColors.grey),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 24),
                child: Divider(color: Colors.grey),
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.only(bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.update_rounded,
                          size: 25, color: CryptoColors.blue),
                      const SizedBox(width: 16.73),
                      Text('Текст 1',
                          style: TextStyle(
                              color: CryptoColors.trueWhite, fontSize: 18)),
                      Expanded(child: Container()),
                      Icon(Icons.arrow_forward_ios, color: CryptoColors.grey),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 24),
                child: Divider(color: Colors.grey),
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.only(bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.update_rounded,
                          size: 35, color: CryptoColors.blue),
                      const SizedBox(width: 16.73),
                      Text('Политика конфиденциальности',
                          style: TextStyle(
                              color: CryptoColors.trueWhite, fontSize: 18)),
                      Expanded(child: Container()),
                      Icon(Icons.arrow_forward_ios, color: CryptoColors.grey),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 24),
                child: Divider(color: Colors.grey),
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.only(bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.update_rounded,
                          size: 35, color: CryptoColors.blue),
                      const SizedBox(width: 16.73),
                      Text('Поддержка',
                          style: TextStyle(
                              color: CryptoColors.trueWhite, fontSize: 18)),
                      Expanded(child: Container()),
                      Icon(Icons.arrow_forward_ios, color: CryptoColors.grey),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 24),
                child: Divider(color: Colors.grey),
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.only(bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.exit_to_app_rounded,
                          size: 35, color: CryptoColors.blue),
                      const SizedBox(width: 16.73),
                      Text('Выйти с аккаунта',
                          style: TextStyle(
                              color: CryptoColors.trueWhite, fontSize: 18)),
                      Expanded(child: Container()),
                      Icon(Icons.arrow_forward_ios, color: CryptoColors.grey),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 24),
                child: Divider(color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}
