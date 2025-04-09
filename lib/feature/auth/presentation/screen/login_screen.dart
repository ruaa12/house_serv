import 'package:flutter/material.dart';
import 'package:home_serviece/feature/auth/presentation/widget/button.dart';
import 'package:home_serviece/feature/auth/presentation/widget/custom_text_field.dart';
import 'package:home_serviece/feature/home/presentation/screen/home_screen.dart';
import 'package:home_serviece/feature/auth/presentation/screen/iam_looking_for.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';


class LoginScreen extends StatelessWidget {
  static String id = 'loginpage';
  LoginScreen({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 200),
            Container(
              padding: EdgeInsets.all(25),
              decoration: const BoxDecoration(
                  color: color4,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Enter your email and password to login',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Form(
                    key: formKey,
                    child: Column(children: [
                      CustomTextField(
                        validator: (value) {
                          if (value!.contains('@gmail.com')) {
                            return null;
                          } else {
                            return 'Please Add A Valid E-mail';
                          }
                        },
                        keybourdTybe: TextInputType.emailAddress,
                        label: 'Email',
                        hintText: 'user@gmail.com',
                        controller: TextEditingController(),
                        onChanged: null,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomTextField(
                        validator: (value) {
                          if (value!.length >= 8) {
                            return null;
                          } else {
                            return 'Please Add A Valid Password';
                          }
                        },
                        keybourdTybe: TextInputType.visiblePassword,
                        label: 'pasword',
                        hintText: 'xxxxxxxx',
                        controller: TextEditingController(),
                        onChanged: null,
                      ),
                    ]),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                              fontSize: 17,
                              color: color3,
                            ),
                          )),
                    ],
                  ),
                  Button(
                      ontap: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ));
                        } else {}
                      },
                      name: 'log in'),
                  const SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'New User?',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const IamLookingFor(),
                                ));
                          },
                          child: const Text(
                            'Sign up now',
                            style: TextStyle(fontSize: 16, color: color3),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
