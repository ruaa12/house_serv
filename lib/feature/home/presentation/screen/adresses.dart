import 'package:flutter/material.dart';
import 'package:home_serviece/feature/home/presentation/screen/profile.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';
import 'package:home_serviece/feature/home/presentation/widget/custom_text_field1.dart';
import 'package:home_serviece/feature/auth/presentation/widget/button.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address'),
        backgroundColor: color1,
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ));
              },
              icon: const Icon(Icons.arrow_back),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Enter Your Address',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                validator: (value) {
                  return null;
                },
                label: 'Name',
                labelText: 'Name',
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                validator: (value) {
                  return null;
                },
                label: 'Address',
                labelText: 'Address',
                keyboardType: TextInputType.streetAddress,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                validator: (value) {
                  return null;
                },
                label: 'City',
                labelText: 'City',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                validator: (value) {
                  return null;
                },
                label: 'Postal Code',
                labelText: 'Postal Code',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                validator: (value) {
                  return null;
                },
                label: 'Phone',
                labelText: 'Phone',
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 30),
              Center(
                child: Button(
                  name: 'Save Address',
                  ontap: () {
                    // ضع الوظيفة هنا للحفظ أو التنقل
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Success'),
                        content: const Text(
                            'Your address has been saved successfully!'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
