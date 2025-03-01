
import 'package:home_serviece/feature/home/presentation/widget/const.dart';
import 'package:flutter/material.dart';
import 'package:home_serviece/feature/auth/presentation/widget/button.dart';
import 'package:home_serviece/feature/home/presentation/screen/profile.dart';
import 'package:home_serviece/feature/home/presentation/widget/custom_text_field1.dart';



class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  final formKey = GlobalKey<FormState>();
  static String id = 'homepage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
        ),
        leading: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Icon(Icons.arrow_back)],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView(children: [
          Column(children: [
            const SizedBox(
              height: 30,
            ),
            const CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/images/profile-circle-icon-2048x2048-cqe5466q.png'),
              maxRadius: 65,
            ),
            const SizedBox(
              height: 40,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'User name',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextField(
              validator: (value) {
                if (value!.length >= 8) {
                  return null;
                } else {
                  return 'Please Add A Valid user name';
                }
              },
              label: 'enter name',
              labelText: 'enter name',
            ),
            const SizedBox(
              height: 30,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Email',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextField(
              validator: (value) {
                if (value!.contains('@gmail.com')) {
                  return null;
                } else {
                  return 'Please Add A Valid E-mail';
                }
              },
              label: 'Email',
              labelText: 'Email',
            ),
            const SizedBox(
              height: 30,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'country',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextField(
              validator: (value) {
                if (value!.length >= 8) {
                  return null;
                } else {
                  return 'Please Add A Valid user country';
                }
              },
              label: 'Country',
              labelText: 'Country',
            ),
            const SizedBox(
              height: 30,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'phone number',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextField(
              validator: (value) {
                if (value!.length == 10) {
                  return null;
                } else {
                  return 'Please Add A Valid user name';
                }
              },
              label: 'phone number',
              labelText: 'phone number',
            ),
            const SizedBox(
              height: 20,
            ),
            Button(
                ontap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()));
                },
                name: 'Save'),
          ])
        ]),
      ),
    );
  }
}
