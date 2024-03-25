import 'package:crypto_trader/ui/routes/app_routes.dart';
import 'package:crypto_trader/ui/theme/crypto_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IdentifyPerson extends StatelessWidget {
  const IdentifyPerson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CryptoColors.notblack,
      appBar: AppBar(
        backgroundColor: CryptoColors.notblack,
        leading: IconButton(
            onPressed: () {
              context.go(AppRoutes.home);
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: CryptoColors.notwhite,
            )),
      ),
      body: IdentifyPersonBody(),
    );
  }
}

class IdentifyPersonBody extends StatelessWidget {
  const IdentifyPersonBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                'Давайте подтвердим вашу личность',
                style: TextStyle(
                    fontFamily: 'ubuntu',
                    fontSize: 35,
                    color: CryptoColors.notwhite),
              ),
            ),
            Container(
              child: Text(
                'Это нужно что бы на нашем платформе было как можно меньше незаконных переводов, все ваши данные хранятся в зашифрованным виде и не передается третим лицам.\nперед тем как продолжить прочтите нашу политику обработку персональных данных',
                style: TextStyle(
                    fontFamily: 'ubuntu',
                    fontSize: 18,
                    color: CryptoColors.grey),
              ),
            ),
          ],
        ),
        //  SizedBox(height: 20,),
        SizedBox(
          
          child: Center(
            
            child: Container(
              child: Image.asset(
                'assets/images/idcard.png',
                width: 300,
                height: 250,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 105, vertical: 20),
              child: Text('Пройти верификацию'),
            ),
            style: ElevatedButton.styleFrom(
              shadowColor: CryptoColors.trueWhite,
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
