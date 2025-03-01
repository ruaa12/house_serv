import 'package:flutter/material.dart';
import 'package:home_serviece/feature/auth/presentation/widget/button.dart';
import 'package:home_serviece/feature/home/presentation/screen/profile.dart';
import 'package:home_serviece/feature/home/presentation/widget/custom_text_field1.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';



class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        title: const Text(
          'help & support',
        ),
        leading:const  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Icon(Icons.arrow_back)],
        ),
      ),
      body: Padding(
        padding:const  EdgeInsets.symmetric(horizontal: 25),
        child: ListView(children: [
          Column(
            children: [
              Image.asset('images/image 158.png'),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Hello, how can we assist you?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                margin:const  EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Title',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    CustomTextField(
                        validator: (value) {
                          if (value!.length >= 8) {
                            return null;
                          } else {
                            return 'Please Add A Valid user name';
                          }
                        },
                        label: 'Enter the title of your issue',
                        labelText: 'Enter the title of your issue'),
                    const SizedBox(
                      height: 30,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Write in bellow box',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    CustomTextField(
                      validator: (value) {
                        if (value!.length >= 8) {
                          return null;
                        } else {
                          return 'Please Add A Valid user name';
                        }
                      },
                      label: 'Write here...',
                      labelText: 'Write here...',
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Button(
                        ontap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileScreen(),
                              ));
                        },
                        name: 'Send'),
                  ],
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}

