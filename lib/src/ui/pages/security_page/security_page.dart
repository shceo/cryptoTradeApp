import 'package:crypto_trader/src/ui/routes/app_routes.dart';
import 'package:crypto_trader/src/ui/theme/crypto_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: CryptoColors.notblack,
        appBar: AppBar(
          backgroundColor: CryptoColors.notblack,
          leading: IconButton(
              onPressed: () {
                context.go(AppRoutes.home);
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: CryptoColors.notwhite,
              )),
        ),
        body: SecPageBody(),
      ),
    );
  }
}

class SecPageBody extends StatelessWidget {
  const SecPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final myWidth = MediaQuery.of(context).size.width;
    final myHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Center(
          child: Container(
            width: myWidth * 0.92,
            height: 130,
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
                      context.go(AppRoutes.localAuthPage);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.pin,
                            color: CryptoColors.notwhite,
                            size: 30,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: Text(
                              'Пароль безопасности',
                              style: TextStyle(
                                  color: CryptoColors.notwhite, fontSize: 20),
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
                      // context.go(AppRoutes.settingsP);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.password_rounded,
                            size: 30,
                            color: CryptoColors.notwhite,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: Text(
                              'Двухфакторная аутентификация ',
                              style: TextStyle(
                                  color: CryptoColors.notwhite, fontSize: 20),
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
                      // context.go(AppRoutes.identifyPerson);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.folder_zip_outlined,
                            color: CryptoColors.notwhite,
                            size: 30,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: Text(
                              'Заморозка счета',
                              style: TextStyle(
                                  color: CryptoColors.notwhite, fontSize: 20),
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
        ),
      ],
    );
  }
}
