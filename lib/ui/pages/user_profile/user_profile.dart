// The MIT License (MIT)

// Copyright (c) 2023-2024 Ame Studio and shceo

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import 'package:crypto_trader/domain/providers/image_picker_provider.dart';
import 'package:crypto_trader/ui/routes/app_routes.dart';
import 'package:crypto_trader/ui/theme/crypto_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:provider/provider.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

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
          'Профиль',
          style: TextStyle(fontSize: 25, color: CryptoColors.notwhite),
        ),
        centerTitle: true,
      ),
      body: UserProfileBody(),
    );
  }
}

class UserProfileBody extends StatelessWidget {
  const UserProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ImageNotifier imageNotifier = ImageNotifier();

    return SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            onTap: () async {
              Provider.of<ImageNotifier>(context, listen: false).getImage();
            },
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Consumer<ImageNotifier>(
                    builder: (context, imageNotifier, child) {
                      return Container(
                        width: 200.0,
                        height: 200.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: imageNotifier.image == null
                                ? const AssetImage('assets/images/фото.png')
                                : FileImage(imageNotifier.image!)
                                    as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  right: 120.0,
                  bottom: 15.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: CryptoColors.notwhite,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.edit, size: 33, color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              cursorColor: Colors.blue,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: CryptoColors.grey.withOpacity(0.5),
                hintText: 'Введите имя',
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              cursorColor: Colors.blue,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: CryptoColors.grey.withOpacity(0.5),
                hintText: 'Введите фамилию',
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.blue,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: CryptoColors.grey.withOpacity(0.5),
                hintText: 'Введите электронную почту',
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IntlPhoneField(
              decoration: InputDecoration(
                labelText: 'Введите номер телефона',
                labelStyle: TextStyle(color: CryptoColors.notwhite),
                contentPadding: EdgeInsets.only(left: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: CryptoColors.grey.withOpacity(0.5),
              ),
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.blue,
              keyboardType: TextInputType.number,
              initialCountryCode: 'RU',
              onChanged: (phone) {
                print(phone.completeNumber);
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {
                print('Кнопка "Отправить код" нажата');
              },
              child: Text(
                'Отправить код',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
