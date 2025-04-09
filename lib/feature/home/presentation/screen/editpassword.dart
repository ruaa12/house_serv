import 'package:home_serviece/feature/home/presentation/widget/const.dart';
import 'package:flutter/material.dart';
import 'package:home_serviece/feature/auth/presentation/widget/button.dart';
import 'package:home_serviece/feature/home/presentation/screen/profile.dart';
import 'package:home_serviece/feature/home/presentation/widget/custom_text_field1.dart';

class EditpasswordScreen extends StatelessWidget {
  const EditpasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        title: const Text(
          'Edit Password',
        ),
        leading:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(),
                    ));
              },
              icon: const Icon(Icons.arrow_back))
        ]),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView(children: [
          Column(children: [
            const SizedBox(
              height: 30,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Current password',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextField(
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.length >= 8) {
                  return null;
                } else {
                  return 'Please Add A Valid password';
                }
              },
              label: 'enter password',
              labelText: 'enter password',
            ),
            const SizedBox(
              height: 30,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'New password',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextField(
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.length >= 8) {
                  return null;
                } else {
                  return 'Please Add A Valid password';
                }
              },
              label: 'New password',
              labelText: 'New password',
            ),
            const SizedBox(
              height: 30,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Confirm password ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextField(
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.length >= 8) {
                  return null;
                } else {
                  return 'Please Add A Valid password';
                }
              },
              label: 'password ',
              labelText: 'password',
            ),
            const SizedBox(
              height: 30,
            ),
            Button(
                ontap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()));
                },
                name: 'Update password'),
          ])
        ]),
      ),
    );
  }
}
