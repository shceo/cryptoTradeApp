import 'dart:math';
import 'package:crypto_trader/src/ui/pages/add_card_page/card_text_utils.dart';
import 'package:crypto_trader/src/ui/routes/app_navigator.dart';
import 'package:crypto_trader/src/ui/routes/app_routes.dart';
import 'package:crypto_trader/src/ui/theme/colors_for_cards.dart';
import 'package:crypto_trader/src/ui/theme/crypto_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

// import 'package:image/image.dart' as Image;

class AddCardPage extends StatefulWidget {
  const AddCardPage({super.key});

  @override
  State<AddCardPage> createState() => _AddCardPage();
}

class _AddCardPage extends State<AddCardPage> with TickerProviderStateMixin {
  late final AnimationController _controller;
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  int selectedIndex = 0;
  int selectedCompany = 0;

  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _numberController.dispose();
    _nameController.dispose();
    _monthController.dispose();
    _yearController.dispose();
    _cvvController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CryptoColors.notblack,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 50,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),

                AnimatedBuilder(
                    animation: _controller,
                    builder: (BuildContext context, Widget? child) {
                      return Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY((_controller.value < 0.5)
                              ? pi * _controller.value
                              : (pi * (1 + _controller.value))),
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: Container(
                            height: 210,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: gradientList[selectedIndex])),
                            child: (_controller.value < 0.5)
                                ? frontCard()
                                : backCard(),
                          ),
                        ),
                      );
                    }),
                const SizedBox(
                  height: 10,
                ),
//
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCompany = 0;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        height: 40,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: selectedCompany == 0
                                    ? gradientList[selectedIndex][0]
                                    : Colors.grey)),
                        child: Image.asset("assets/images/logo1.png"),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCompany = 1;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        height: 40,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: selectedCompany == 1
                                    ? gradientList[selectedIndex][0]
                                    : Colors.grey)),
                        child: Image.asset("assets/images/logo2.png"),
                      ),
                    ),
                  ],
                ),

//
// Field(_nameController, 'Card Holder Name', true),
                Field(_nameController, 'Имя владельца карты', true),
                Field(
                  _numberController,
                  'Номер карты',
                  false,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Field(
                      _monthController,
                      'MM',
                      false,
                    )),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: Field(
                      _yearController,
                      'YY',
                      false,
                    )),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: Field(
                      _cvvController,
                      'CVV',
                      false,
                    )),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),

                SizedBox(
                  height: 20,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: gradientList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Stack(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                margin: const EdgeInsets.only(right: 25),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                        colors: gradientList[index])),
                              ),
                              selectedIndex == index
                                  ? const Icon(
                                      Icons.done,
                                      color: Colors.white,
                                      size: 19,
                                    )
                                  : const SizedBox()
                            ],
                          ),
                        );
                      }),
                ),
                const Spacer(),
              Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Expanded(
      child: GestureDetector(
        onTap: () {
          //
          //
          //
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: gradientList[selectedIndex],
            ),
          ),
          alignment: Alignment.center,
          child: TextUtil(
            text: "Сохранить",
          ),
        ),
      ),
    ),
    SizedBox(width: 10),
    Expanded(
      child: GestureDetector(
        onTap: () {
          context.goNamed(AppRoutes.home);
          // AppNavigator.router.goNamed(AppRoutes.home);
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: gradientList[selectedIndex],
            ),
          ),
          alignment: Alignment.center,
          child: TextUtil(
            text: "Назад",
          ),
        ),
      ),
    ),
  ],
),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget frontCard() {
    return Stack(
      children: [
        Image.asset(
          "assets/images/world.png",
          color: gradientList[selectedIndex][0],
        ),
        Container(
          padding:
              const EdgeInsets.only(right: 15, top: 10, bottom: 10, left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtil(
                text: "Credit Card",
                size: 20,
              ),
              const Spacer(),
              Container(
                height: 50,
                width: 60,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/chip.png"),
                  fit: BoxFit.fill,
                )),
              ),
              const Spacer(),
              TextUtil(
                text: _numberController.text,
                size: 20,
              ),
              const Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextUtil(
                                  text: "Valid",
                                  size: 10,
                                  weight: true,
                                ),
                                TextUtil(
                                  text:
                                      "${_monthController.text}/${_yearController.text}",
                                  size: 14,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextUtil(
                          text: _nameController.text,
                          size: 15,
                          weight: true,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: 90,
                    child: Image.asset(
                      selectedCompany == 0
                          ? "assets/images/logo1.png"
                          : "assets/images/logo2.png",
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget backCard() {
    return Stack(
      children: [
        Image.asset("assets/images/world.png",
            color: gradientList[selectedIndex][0]),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.black,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              width: double.infinity,
              color: Colors.grey.shade300,
              alignment: Alignment.centerRight,
              child: TextUtil(
                text: _cvvController.text,
                color: Colors.black,
                weight: true,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextUtil(
                text:
                    "A credit card is a thin rectangular piece of plastic or metal issued by a bank or financial services company that allows cardholders to borrow funds with which to pay for goods and services with merchants that accept cards for payment.",
                size: 9,
              ),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }

  Widget Field(
      TextEditingController controller, String hinttext, bool isNumberType) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      margin: const EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(2, 2),
                blurRadius: 2),
            BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(-2, -2),
                blurRadius: 2)
          ]),
      child: TextFormField(
        keyboardType:
            isNumberType ? TextInputType.emailAddress : TextInputType.number,
        controller: controller,
        maxLines: 1,
        onTap: () {
          if (hinttext == "CVV") {
            _controller.forward();
          } else {
            _controller.reverse();
          }
        },
        onChanged: (value) {
          setState(() {});
        },
        decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.grey.shade400),
            hintText: hinttext,
            border: InputBorder.none),
        inputFormatters: (hinttext == "Имя владельца карты")
            ? [LengthLimitingTextInputFormatter(20)]
            : (hinttext == "Номер карты")
                ? [LengthLimitingTextInputFormatter(16)]
                : (hinttext == "CVV" || hinttext == "MM" || hinttext == "YY")
                    ? [
                        LengthLimitingTextInputFormatter(
                            hinttext == "CVV" ? 3 : 2),
                      ]
                    : null,
      ),
    );
  }
}
