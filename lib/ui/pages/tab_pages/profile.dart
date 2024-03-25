import 'package:crypto_trader/providers/image_picker_provider.dart';
import 'package:crypto_trader/ui/routes/app_routes.dart';
import 'package:crypto_trader/ui/theme/crypto_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

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
    final myWidth = MediaQuery.of(context).size.width;
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<ImageNotifier>(
                    builder: (context, imageNotifier, child) {
                      return CircleAvatar(
                        radius: 44,
                        backgroundImage: imageNotifier.image != null
                            ? FileImage(imageNotifier.image!)
                            : null,
                        backgroundColor: CryptoColors.grey,
                      );
                    },
                  ),
                  SizedBox(height: 12),
                  Text(
                    'имя/фамилия',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    'электронная почта',
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
              Container(
                width: myWidth * 0.91,
                height: 120,
                decoration: BoxDecoration(
                  color: CryptoColors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          context.go(AppRoutes.userProfile);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.person_outline_rounded,
                                color: CryptoColors.notwhite,
                                size: 30,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 12.0),
                                child: Text(
                                  'Профиль',
                                  style: TextStyle(
                                      color: CryptoColors.notwhite,
                                      fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      InkWell(
                        onTap: () {
                          context.go(AppRoutes.settingsP);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.settings,
                                size: 30,
                                color: CryptoColors.notwhite,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 12.0),
                                child: Text(
                                  'Настройки',
                                  style: TextStyle(
                                      color: CryptoColors.notwhite,
                                      fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      InkWell(
                        onTap: () {
                          context.go(AppRoutes.identifyPerson);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.sensor_occupied_sharp,
                                color: CryptoColors.notwhite,
                                size: 30,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 12.0),
                                child: Text(
                                  'Идентификация личности',
                                  style: TextStyle(
                                      color: CryptoColors.notwhite,
                                      fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: myWidth * 0.91,
                height: 120,
                decoration: BoxDecoration(
                  color: CryptoColors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          context.go(AppRoutes.aiSoon);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.graphic_eq_sharp,
                                color: CryptoColors.notwhite,
                                size: 30,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 12.0),
                                child: Text(
                                  'CTB AI',
                                  style: TextStyle(
                                      color: CryptoColors.notwhite,
                                      fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      InkWell(
                        onTap: () {
                          context.go(AppRoutes.securityPage);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.security_rounded,
                                size: 30,
                                color: CryptoColors.notwhite,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 12.0),
                                child: Text(
                                  'Безопасность',
                                  style: TextStyle(
                                      color: CryptoColors.notwhite,
                                      fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      InkWell(
                        onTap: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => HelpAndSupport(),
                          //   ),
                          // );
                          context.go(AppRoutes.helpandSupport);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.help_rounded,
                                color: CryptoColors.notwhite,
                                size: 30,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 12.0),
                                child: Text(
                                  'Помощь & Поддержка',
                                  style: TextStyle(
                                      color: CryptoColors.notwhite,
                                      fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                width: myWidth * 0.91,
                height: 120,
                decoration: BoxDecoration(
                  color: CryptoColors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          print('Обратная связь нажата');
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.support_agent_rounded,
                                size: 30,
                                color: CryptoColors.notwhite,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 12.0),
                                child: Text(
                                  'Обратная связь',
                                  style: TextStyle(
                                      color: CryptoColors.notwhite,
                                      fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      InkWell(
                        onTap: () {
                          context.go(AppRoutes.privacyPolicy);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.description_rounded,
                                color: CryptoColors.notwhite,
                                size: 30,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 12.0),
                                child: Text(
                                  'Публичная оферта',
                                  style: TextStyle(
                                      color: CryptoColors.notwhite,
                                      fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      InkWell(
                        onTap: () {
                          FirebaseAuth.instance.signOut();
                          // context.go(AppRoutes.mainRegisterPage);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.exit_to_app,
                                color: CryptoColors.notwhite,
                                size: 30,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 12.0),
                                child: Text(
                                  'Выйти с аккаунта',
                                  style: TextStyle(
                                      color: CryptoColors.notwhite,
                                      fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Future<String> _loadImage() async {
  final box = await Hive.openBox('images');
  final imagePath = box.get('imagePath') as String;
  return imagePath;
}
