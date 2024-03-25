import 'package:crypto_trader/ui/routes/app_routes.dart';
import 'package:crypto_trader/ui/theme/crypto_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

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
              Icons.arrow_back_ios_new_rounded,
              color: CryptoColors.notwhite,
            )),
        title: Text(
          'Политика конфиденциальности',
          style: TextStyle(fontSize: 20, color: CryptoColors.notwhite),
        ),
        centerTitle: true,
      ),
      body: PrivacyPolicyBody(),
    );
  }
}

class PrivacyPolicyBody extends StatelessWidget {
  const PrivacyPolicyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style.copyWith(color: CryptoColors.notwhite),
              children: <TextSpan>[
                TextSpan(text: '1. Введение\n'),
                TextSpan(text: '1.1 Наше приложение (далее - "Мы") уважает вашу конфиденциальность и стремится защитить ваши персональные данные. В этой политике конфиденциальности объясняется, как мы собираем, используем и раскрываем ваши персональные данные.\n'),
              ],
            ),
          ),
          SizedBox(height: 20),
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style.copyWith(color: CryptoColors.notwhite),
              children: <TextSpan>[
                TextSpan(text: '2. Сбор данных\n'),
                TextSpan(text: '2.1 Мы собираем персональные данные, которые вы предоставляете нам при регистрации, а также информацию о ваших транзакциях и взаимодействии с нашим приложением.\n'),
              ],
            ),
          ),
          SizedBox(height: 20),
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style.copyWith(color: CryptoColors.notwhite),
              children: <TextSpan>[
                TextSpan(text: '3. Использование данных\n'),
                TextSpan(text: '3.1 Мы используем ваши данные для управления вашим аккаунтом, обработки ваших транзакций, предоставления вам услуг поддержки и улучшения нашего приложения.\n'),
              ],
            ),
          ),
          SizedBox(height: 20),
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style.copyWith(color: CryptoColors.notwhite),
              children: <TextSpan>[
                TextSpan(text: '4. Раскрытие данных\n'),
                TextSpan(text: '4.1 Мы не продаем, не обмениваем и не передаем ваши персональные данные третьим лицам. Мы можем раскрывать ваши данные третьим лицам, если это требуется по закону или для защиты наших прав.\n'),
              ],
            ),
          ),
          SizedBox(height: 20),
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style.copyWith(color: CryptoColors.notwhite),
              children: <TextSpan>[
                TextSpan(text: '5. Безопасность данных\n'),
                TextSpan(text: '5.1 Мы принимаем все необходимые меры для защиты ваших персональных данных от несанкционированного доступа, изменения, раскрытия или уничтожения.\n'),
              ],
            ),
          ),
          SizedBox(height: 20),
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style.copyWith(color: CryptoColors.notwhite),
              children: <TextSpan>[
                TextSpan(text: '6. Ваши права\n'),
                TextSpan(text: '6.1 Вы имеете право на доступ, исправление, удаление и ограничение обработки ваших персональных данных. Вы также имеете право подать жалобу в надзорный орган.\n'),
              ],
            ),
          ),
          SizedBox(height: 20),
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style.copyWith(color: CryptoColors.notwhite),
              children: <TextSpan>[
                TextSpan(text: '7. Изменения в политике конфиденциальности\n'),
                TextSpan(text: '7.1 Мы можем время от времени обновлять нашу политику конфиденциальности. Мы уведомим вас обо всех изменениях, разместив новую политику конфиденциальности на этой странице.\n'),
              ],
            ),
          ),
          SizedBox(height: 20),
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style.copyWith(color: CryptoColors.notwhite),
              children: <TextSpan>[
                TextSpan(text: '8. Контакты\n'),
                TextSpan(text: '8.1 Если у вас есть вопросы о нашей политике конфиденциальности, пожалуйста, свяжитесь с нами.\n'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
