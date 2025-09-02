// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:home_serviece/feature/auth/presentation/screen/login_screen.dart';
import 'package:home_serviece/feature/auth/presentation/widget/button.dart';
import 'package:home_serviece/feature/auth/presentation/widget/custom_text_field.dart';
import 'package:home_serviece/feature/home/presentation/screen/home_screen.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';

import '../../bloc/bloc/auth_bloc.dart';

// ignore: must_be_immutable
class SignupWorker extends StatefulWidget {
  static String id = 'signupWorker';

  SignupWorker({super.key});

  @override
  State<SignupWorker> createState() => _SignupWorkerState();
}

class _SignupWorkerState extends State<SignupWorker> {
  final formKey = GlobalKey<FormState>();

  List<SignupData> data() => [
        SignupData(
          field1: CustomTextField(
            validator: (value) {
              if (value!.length >= 3) {
                return null;
              } else {
                return 'Please Add A Valid Name';
              }
            },
            keybourdTybe: TextInputType.name,
            label: 'Full Name',
            hintText: ' Name',
            controller: fullnameController,
            onChanged: null,
            hint: '',
            labelText: '',
            keyboardType: TextInputType.name,
          ),
          field2: CustomTextField(
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
          field3: CustomTextField(
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
            keyboardType: TextInputType.number,
            labelText: '',
          ),
          field4: CustomTextField(
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
            controller: usernameController,
            onChanged: null,
            hint: '',
            keyboardType: TextInputType.name,
            labelText: '',
          ),
          field5: CustomTextField(
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
            labelText: '',
            keyboardType: TextInputType.number,
          ),
        ),
        SignupData(
          field1: CustomTextField(
            validator: (value) {
              if (value!.length >= 5) {
                return null;
              } else {
                return 'Please Add A Valid Service';
              }
            },
            keybourdTybe: TextInputType.text,
            label: 'sevice',
            hintText: 'Enter type of service ',
            controller: serviceController,
            onChanged: null,
            hint: '',
            keyboardType: TextInputType.text,
            labelText: '',
          ),
          field2: CustomTextField(
            validator: (value) {
              if (value!.length >= 10) {
                return null;
              } else {
                return 'Please Add A Valid Adress';
              }
            },
            keybourdTybe: TextInputType.streetAddress,
            label: 'Adress',
            hintText: 'Syria_aleppo',
            controller: addressController,
            onChanged: null,
            hint: '',
            keyboardType: TextInputType.text,
            labelText: '',
          ),
          field3: CustomTextField(
            validator: (value) {
              if (value!.isNotEmpty) {
                return null;
              } else {
                return 'Please Add A Valid experience';
              }
            },
            keybourdTybe: TextInputType.number,
            label: 'Experience',
            hintText: 'Enter number yer of experience',
            controller: expController,
            onChanged: null,
            hint: '',
            keyboardType: TextInputType.number,
            labelText: '',
          ),
          field4: CustomTextField(
            validator: (value) {
              if (value!.length >= 10) {
                return null;
              } else {
                return 'Please Add A Valid salary';
              }
            },
            keybourdTybe: TextInputType.number,
            label: 'salary per hour',
            hintText: 'XXX',
            controller: salleryController,
            onChanged: null,
            hint: '',
            keyboardType: TextInputType.number,
            labelText: '',
          ),
        )
      ];

  PageController pageController = PageController(initialPage: 0);

  final fullnameController = TextEditingController();

  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  final passwordController = TextEditingController();

  final expController = TextEditingController();

  final salleryController = TextEditingController();

  final addressController = TextEditingController();

  final serviceController = TextEditingController();

  final usernameController = TextEditingController();

  File? cv;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      body: PageView.builder(
        allowImplicitScrolling: false,
        reverse: false,
        controller: pageController,
        itemCount: data().length,
        itemBuilder: (context, index) => SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 250,
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
                      height: 20,
                    ),
                    const Text(
                      'Enter your information to sign up ',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          data()[index].field1,
                          const SizedBox(
                            height: 20,
                          ),
                          data()[index].field2,
                          const SizedBox(
                            height: 20,
                          ),
                          data()[index].field3,
                          const SizedBox(
                            height: 20,
                          ),
                          data()[index].field4,
                          data()[index].field5 == null
                              ? SizedBox.shrink()
                              : const SizedBox(
                                  height: 20,
                                ),
                          data()[index].field5 ?? SizedBox.shrink(),
                          const SizedBox(
                            height: 20,
                          ),
                          index == data().length - 1 ? InkWell(
                            onTap: () async {
                              await FilePicker.platform.pickFiles(
                                type: FileType.custom,            // Only allow custom types
                                allowedExtensions: ['pdf', 'docx', 'doc'], // Restrict to PDF and DOCX
                                allowMultiple: false,
                              ).then((val){
                                String? path = val!.files.single.path;
                                cv = File(path!);
                                setState(() {

                                });
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: Colors.black),
                              ),
                              padding: EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 10),
                              child: Text(
                                cv == null ? 'Upload your CV' : cv!.path,
                              ),
                            ),
                          ) : SizedBox.shrink(),
                          const SizedBox(
                            height: 70,
                          ),

                        ],
                      ),
                    ),
                    index == data().length - 1
                        ? BlocConsumer<AuthBloc, AuthState>(
                            listener: (context, State) {
                              if (State is JoinLoading) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                );
                              }
                              if (State is JoinSuccess) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                  ),
                                );
                              }
                              if (State is JoinFailed) {
                                print('erros');
                              }
                            },
                            builder: (BuildContext context, AuthState state) {
                              return Button(
                                  ontap: () {
                                    if (formKey.currentState!.validate()) {
                                      context.read<AuthBloc>().add(
                                            JoinRequestEvent(
                                              cv!,
                                              name: fullnameController.text,
                                              address: addressController.text,
                                              service: serviceController.text,
                                            ),
                                          );
                                    }
                                  },
                                  name: 'Sign up');
                            },
                          )
                        : BlocConsumer<AuthBloc, AuthState>(
                            listener: (context, State) {
                              if (State is AuthLoading) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                );
                              }
                              if (State is RegisterSuccess) {
                                pageController.nextPage(duration: const Duration(seconds: 2), curve: Curves.ease);
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
                                              username: usernameController.text,
                                            ),
                                          );
                                    }
                                  },
                                  name: 'Sign up');
                            },
                          ),
                    const SizedBox(
                      height: 40,
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
      ),
    );
  }
}

class SignupData {
  final CustomTextField field1;
  final CustomTextField field2;
  final CustomTextField field3;
  final CustomTextField field4;
  final CustomTextField? field5;

  SignupData({
    required this.field1,
    required this.field2,
    required this.field3,
    required this.field4,
    this.field5,
  });
}
