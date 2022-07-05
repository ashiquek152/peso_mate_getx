import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:peso_mate_getx/app/data/db_helper/db_helper.dart';
import 'package:peso_mate_getx/app/data/widgets/colors.dart';
import 'package:peso_mate_getx/app/data/widgets/text_widget.dart';
import 'package:peso_mate_getx/app/data/widgets/textfield_border.dart';

import '../controllers/screen_login_controller.dart';

class ScreenLoginView extends GetView<ScreenLoginController> {
   ScreenLoginView({Key? key}) : super(key: key);

  final logincontroller = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: scfldWhite,
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: height,
            child: Column(
              children: [
                const Expanded(child: SizedBox()),
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(),
                      const Text(
                        'What should we call you ?',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: scaffoldbgnew,
                            fontFamily: fontComforataa),
                      ),
                      component1(
                          Icons.account_circle_outlined, 'Enter your name...',context),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(bottom: width * .07),
                          height: width * .7,
                          width: width * .7,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Colors.transparent,
                                Color(0xff09090A),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: GestureDetector(
                           onTap: () {
                              if (formkey.currentState!.validate()) {
                                HapticFeedback.lightImpact();
                                usernameStore(logincontroller.text);
                              }
                            },
                          child: 
                          Container(
                            height: width * .2,
                            width: width * .2,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: Colors.amber,
                              shape: BoxShape.circle,
                            ),
                            child: const Text(
                              'Let\'s start',
                              style: TextStyle(
                                color: scfldWhite,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                     
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> usernameStore(String name) async {
    // final SharedPreferences pref = await SharedPreferences.getInstance();
    // pref.setString('username', name);
    getBox.write("username",name);
    Get.offAllNamed("/home");
  }

  Widget component1(IconData icon, String hintText,context) {
    double width = MediaQuery.of(context).size.width;
    return Form(
      key: formkey,
      child: Container(
        height: width / 6,
        width: width / 1.22,
        alignment: Alignment.center,
        child: Center(
          child: TextFormField(
            style: const TextStyle(color: scaffoldbgnew),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a name ';
              } else {
                return null;
              }
            },
            controller: logincontroller,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                fillColor: white,
                filled: true,
                errorStyle:  TextStyle(fontSize: 13, color: amber),
                hintText: 'Enter your name...',
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: scaffoldbgnew.withOpacity(.5),
                ),
                enabledBorder: textFieldBorderStyle(color: scfldWhite),
                focusedBorder: textFieldBorderStyle(color: scfldWhite),
                errorBorder: textFieldBorderStyle(color: scfldWhite),
                focusedErrorBorder: textFieldBorderStyle(color: scfldWhite),
                prefixIcon: Icon(icon)),
            maxLength: 12,
          ),
        ),
      ),
    );
  }
  }


class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
