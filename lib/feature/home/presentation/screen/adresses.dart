import 'package:home_serviece/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

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
        title: Text(LocaleKeys.general_address.tr()),
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
              Text(
                LocaleKeys.general_Enter_your_address.tr(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                validator: (value) {
                  return null;
                },
                label: LocaleKeys.adresses_Name.tr(),
                labelText: 'Name'.tr(),
                keyboardType: TextInputType.name,
                controller: TextEditingController(),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                validator: (value) {
                  return null;
                },
                label: LocaleKeys.adresses_address.tr(),
                labelText: 'Address'.tr(),
                keyboardType: TextInputType.streetAddress,
                controller: TextEditingController(),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                validator: (value) {
                  return null;
                },
                label: LocaleKeys.adresses_city.tr(),
                labelText: 'City'.tr(),
                keyboardType: TextInputType.text,
                controller: TextEditingController(),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                validator: (value) {
                  return null;
                },
                label: LocaleKeys.adresses_phone.tr(),
                labelText: 'Phone',
                keyboardType: TextInputType.phone,
                controller: TextEditingController(),
              ),
              const SizedBox(height: 30),
              Center(
                child: Button(
                  name: LocaleKeys.adresses_save_address.tr(),
                  ontap: () {
                    // ضع الوظيفة هنا للحفظ أو التنقل
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(LocaleKeys.adresses_success.tr()),
                        content: Text(LocaleKeys
                            .adresses_Your_address_has_been_saved_successfully
                            .tr()),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(LocaleKeys.adresses_ok.tr().tr()),
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
