import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_serviece/feature/auth/bloc/bloc/auth_bloc.dart';
import 'package:home_serviece/feature/auth/presentation/screen/login_screen.dart';
import 'package:home_serviece/feature/auth/presentation/widget/button.dart';
import 'package:home_serviece/feature/auth/presentation/widget/custom_text_field.dart';

import 'package:home_serviece/feature/home/presentation/screen/navbar.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';

class SignupUser extends StatelessWidget {
  static String id = 'signupUser';
  SignupUser({super.key});
  final formKey = GlobalKey<FormState>();
  final fullnameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final usercontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            Container(
              padding: const EdgeInsets.all(25),
              decoration: const BoxDecoration(
                  color: color4,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                  )),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Enter your information to sign up ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          validator: (value) {
                            if (value!.length >= 3) {
                              return null;
                            } else {
                              return 'Please Add A Valid Name';
                            }
                          },
                          keybourdTybe: TextInputType.name,
                          label: 'Full Name',
                          hintText: 'name',
                          controller: fullnameController,
                          onChanged: null,
                          hint: '',
                          keyboardType: TextInputType.name,
                          labelText: '',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          validator: (value) {
                            if (value!.length >= 3) {
                              return null;
                            } else {
                              return 'Please Add A Valid lastName';
                            }
                          },
                          keybourdTybe: TextInputType.name,
                          label: 'user Name',
                          hintText: 'Enter Your Last Name',
                          controller: usercontroller,
                          onChanged: null,
                          hint: '',
                          keyboardType: TextInputType.name,
                          labelText: '',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
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
                          controller: emailController,
                          onChanged: null,
                          hint: '',
                          keyboardType: TextInputType.emailAddress,
                          labelText: '',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          validator: (value) {
                            if (value!.length == 10) {
                              return null;
                            } else {
                              return 'Please Add A Valid Phone';
                            }
                          },
                          keybourdTybe: TextInputType.phone,
                          label: 'Phone',
                          hintText: '0911111111',
                          controller: phoneController,
                          onChanged: null,
                          hint: '',
                          labelText: '',
                          keyboardType: TextInputType.phone,
                        ),
                        const SizedBox(
                          height: 20,
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
                          controller: passwordController,
                          onChanged: null,
                          hint: '',
                          keyboardType: TextInputType.text,
                          labelText: '',
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                      ],
                    ),
                  ),
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, State) {
                      if (State is AuthLoading) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            });
                      }
                      if (State is RegisterSuccess) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Navbar()),
                        );
                      }
                      if (State is RegisterFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(State.error),
                        ));
                      }
                    },
                    builder: (BuildContext context, AuthState state) {
                      return Button(
                          ontap: () {
                            if (formKey.currentState!.validate()) {
                              print("signup button pressed");
                              context.read<AuthBloc>().add(
                                    SignupButtonPressedEvent(
                                      fullname: fullnameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      phone: phoneController.text,
                                      username: usercontroller.text,
                                    ),
                                  );
                            }
                          },
                          name: 'Sign up');
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'already have an account?',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ));
                          },
                          child: const Text(
                            'log in now',
                            style: TextStyle(fontSize: 16, color: color3),
                          )),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
