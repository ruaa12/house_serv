import 'package:home_serviece/feature/home/presentation/widget/const.dart';
import 'package:flutter/material.dart';
import 'package:home_serviece/feature/auth/presentation/widget/button.dart';
import 'package:home_serviece/feature/home/presentation/screen/profile.dart';
import 'package:home_serviece/feature/home/presentation/widget/custom_text_field1.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});
  static String id = 'homepage';

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
        _showAlert('No file selected.'); // إذا لم يتم اختيار ملف
      }
    } catch (e) {
      _showAlert(
          'An error occurred while picking the file: $e'); // عرض خطأ للمستخدم
    }
  }

  void _showAlert(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Notice'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
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
        title: const Text(
          'Edit Profile',
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
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value!.length >= 8) {
                  return null;
                } else {
                  return 'Please Add A Valid user name';
                }
              },
              label: 'Enter name',
              labelText: 'Enter name',
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
              keyboardType: TextInputType.emailAddress,
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
                'Country',
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
                'Phone number',
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
                  return 'Please Add A Valid phone number';
                }
              },
              label: 'Phone number',
              labelText: 'Phone number',
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
              name: 'Save',
            ),
          ],
        ),
      ),
    );
  }
}
