import 'package:crypto_trader/domain/providers/settingsmodels_provider.dart';
import 'package:crypto_trader/ui/routes/app_routes.dart';
import 'package:crypto_trader/ui/theme/crypto_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CryptoColors.notblack,
      appBar: AppBar(
        title: Text(
          'Настройки',
          style: TextStyle(color: CryptoColors.trueWhite),
        ),
        toolbarHeight: 40,
        leading: IconButton(
            onPressed: () {
              context.go(AppRoutes.home);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: CryptoColors.trueWhite,
            )),
        backgroundColor: CryptoColors.notblack,
      ),
      body: SettingsPageBody(),
    );
  }
}

class SettingsPageBody extends StatelessWidget {
  const SettingsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final myWidth = MediaQuery.of(context).size.width;
    final myHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: myWidth,
          height: myHeight * 0.8,
          decoration: BoxDecoration(
            color: CryptoColors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Icon(
                            Icons.notifications_none_rounded,
                            color: CryptoColors.notwhite,
                          ),
                        ),
                        Text(
                          'Уведомлении',
                          style:
                              TextStyle(fontSize: 15, color: CryptoColors.notwhite),
                        ),
                      ],
                    ),
                    Consumer<LanguageModel>(
                      builder: (context, settingsModel, child) {
                        return Switch(
                          value: settingsModel.isSwitched,
                          onChanged: (value) {
                            settingsModel.toggleSwitch(value);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Icon(
                            Icons.language,
                            color: CryptoColors.notwhite,
                          ),
                        ),
                        Text(
                          'Языки',
                          style:
                              TextStyle(fontSize: 15, color: CryptoColors.notwhite),
                        ),
                      ],
                    ),
                    Consumer<LanguageModel>(
                      builder: (context, settingsModel, child) {
                        return TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: CryptoColors.notwhite,
                                  title: Text('Выберите язык', style: TextStyle(color: CryptoColors.trueBlack),),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      ListTile(
                                        title: Text('English'),
                                        onTap: () {
                                          settingsModel.setLanguage('English');
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      ListTile(
                                        title: Text('Русский'),
                                        onTap: () {
                                          settingsModel.setLanguage('Русский');
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      ListTile(
                                        title: Text('O\'zbek'),
                                        onTap: () {
                                          settingsModel.setLanguage('O\'zbek');
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      ListTile(
                                        title: Text('Français'),
                                        onTap: () {
                                          settingsModel.setLanguage('Français');
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Text(
                            settingsModel.language,
                            style: TextStyle(
                              fontSize: 15,
                              color: CryptoColors.blue,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Icon(
                            Icons.brightness_6,
                            color: CryptoColors.notwhite,
                          ),
                        ),
                        Text(
                          'Тема',
                          style:
                              TextStyle(fontSize: 15, color: CryptoColors.notwhite),
                        ),
                      ],
                    ),
                    Consumer<ThemeModel>(
                      builder: (context, settingsModel, child) {
                        return TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: CryptoColors.notwhite,
                                  title: Text('Выберите тему', style: TextStyle(color: CryptoColors.trueBlack),),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      ListTile(
                                        title: Text('Темная тема'),
                                        onTap: () {
                                          settingsModel.setTheme('Темная тема');
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      ListTile(
                                        title: Text('Светлая тема'),
                                        onTap: () {
                                          settingsModel.setTheme('Светлая тема');
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      ListTile(
                                        title: Text('Тема системы'),
                                        onTap: () {
                                          settingsModel.setTheme('Тема системы');
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Text(
                            settingsModel.theme,
                            style: TextStyle(
                              fontSize: 15,
                              color: CryptoColors.blue,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
