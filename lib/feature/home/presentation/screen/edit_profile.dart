import 'package:home_serviece/feature/home/presentation/widget/custom_text_field1.dart';
import 'package:home_serviece/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';
import 'package:flutter/material.dart';
import 'package:home_serviece/feature/auth/presentation/widget/button.dart';
import 'package:home_serviece/feature/home/presentation/screen/profile.dart';

import 'package:file_picker/file_picker.dart';
import 'dart:io';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});
  static String id = 'homepage'.tr();

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final formKey = GlobalKey<FormState>();
  File? _image;

  Future<void> _pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image, // السماح باختيار الصور فقط
      );
      if (result != null) {
        setState(() {
          _image = File(result.files.single.path!);
        });
      } else {
        _showAlert(LocaleKeys.editProfile_no_file_selected
            .tr()); // إذا لم يتم اختيار ملف
      }
    } catch (e) {
      _showAlert(LocaleKeys.editProfile_An_error_occured
          .tr()
          .tr()); // عرض خطأ للمستخدم
    }
  }

  void _showAlert(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Notice'.tr()),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'.tr()),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        title: Text(
          LocaleKeys.editProfile_Edit_prof.tr(),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: _pickFile, // استدعاء التقاط الملف عند الضغط
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: _image != null ? FileImage(_image!) : null,
                    backgroundColor: Colors.grey[200],
                    maxRadius: 65,
                  ),
                  const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                LocaleKeys.editProfile_User_name.tr(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextField(
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value!.length >= 8) {
                  return null;
                } else {
                  return LocaleKeys.editProfile_valid_user_name.tr();
                }
              },
              label: LocaleKeys.editProfile_Enter_name.tr(),
              labelText: 'Enter name'.tr(),
              controller: TextEditingController(),
            ),
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Email'.tr(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextField(
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.contains('@gmail.com')) {
                  return null;
                } else {
                  return LocaleKeys.editProfile_Valid_E_mail.tr();
                }
              },
              label: LocaleKeys.editProfile_Email.tr(),
              labelText: 'Email'.tr(),
              controller: TextEditingController(),
            ),
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                LocaleKeys.editProfile_Country.tr(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextField(
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value!.length >= 8) {
                  return null;
                } else {
                  return 'Please Add A Valid user country'.tr();
                }
              },
              label: LocaleKeys.editProfile_Country.tr(),
              labelText: 'Country'.tr(),
              controller: TextEditingController(),
            ),
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                LocaleKeys.editProfile_Phone_num.tr(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextField(
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.length == 10) {
                  return null;
                } else {
                  return LocaleKeys.editProfile_Valid_phone.tr();
                }
              },
              label: LocaleKeys.editProfile_Phone_num.tr(),
              labelText: 'Phone number'.tr(),
              controller: TextEditingController(),
            ),
            const SizedBox(
              height: 20,
            ),
            Button(
              ontap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
              name: LocaleKeys.editProfile_save.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
