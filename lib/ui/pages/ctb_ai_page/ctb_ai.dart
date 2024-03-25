import 'package:crypto_trader/providers/aisoon_provider.dart';
import 'package:crypto_trader/ui/routes/app_routes.dart';
import 'package:crypto_trader/ui/theme/crypto_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CtbAi extends StatelessWidget {
  const CtbAi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CryptoColors.notblack,
      body: AiBody(),
    );
  }
}

class AiBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CryptoColors.notblack,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Мы работаем над этим',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 30,
            ),
            Consumer<thremonthtoget>(
              builder: (context, timerInfo, child) {
                Duration remainingTime =
                    Duration(seconds: timerInfo.remainingTime);
                String formattedTime = formatDuration(remainingTime);
                List<String> timeParts = formattedTime.split(':');
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text('Дней', style: TextStyle(color: Colors.white)),
                            Text('${timeParts[0]} :',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white)),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text('Часов',
                                style: TextStyle(color: Colors.white)),
                            Text('${timeParts[1]} :',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white)),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text('Минут',
                                style: TextStyle(color: Colors.white)),
                            Text('${timeParts[2]} :',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white)),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text('Секунд',
                                style: TextStyle(color: Colors.white)),
                            Text(timeParts[3],
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.go(AppRoutes.home);
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 105, vertical: 20),
                        child: Text('Вернуться домой'),
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
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

String formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitHours = twoDigits(duration.inHours.remainder(24));
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "${twoDigits(duration.inDays)} : $twoDigitHours : $twoDigitMinutes : $twoDigitSeconds";
}
