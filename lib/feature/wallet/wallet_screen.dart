import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:home_serviece/feature/auth/presentation/widget/button.dart';

import 'package:home_serviece/feature/home/presentation/screen/navbar.dart';
import 'dart:io';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';
import 'package:home_serviece/feature/home/presentation/widget/custom_text_field1.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  File? _selectedImage; // لتخزين الصورة المختارة

  // وظيفة اختيار الصورة باستخدام File Picker
  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result != null && result.files.single.path != null) {
      setState(() {
        _selectedImage = File(result.files.single.path!); // تخزين الصورة
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color6,
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text(
          'Wallet',
        ),
        leading:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Navbar(),
                    ));
              },
              icon: const Icon(Icons.arrow_back))
        ]),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Drop-down لوسائل الإيداع
                Text(
                  "Select Deposit Method",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 30),
                DropdownButton<String>(
                  items: [
                    DropdownMenuItem(
                        value: "Bank Transfer", child: Text("Bank Transfer")),
                    DropdownMenuItem(
                        value: "Credit Card", child: Text("Credit Card")),
                    DropdownMenuItem(value: "Cash", child: Text("Cash")),
                  ],
                  onChanged: (value) {
                    // معالجة الاختيار
                  },
                  hint: Text("Choose Method"),
                ),
                SizedBox(height: 30),

                // CustomTextField الخاص بك لإدخال مبلغ الإيداع
                Text("Deposit Amount",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                CustomTextField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter an amount.";
                    }
                    return null;
                  },
                  label: "Enter Amount",
                  labelText: "Amount",
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 30),

                // اختيار الصورة باستخدام File Picker
                Text("Upload Receipt",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: _selectedImage == null
                        ? Center(
                            child: Icon(
                              Icons.camera_alt,
                              size: 50,
                              color: Colors.grey[700],
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              _selectedImage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
                SizedBox(height: 30),

                // زر الإرسال باستخدام Button الخاص بك
                Center(
                  child: Button(
                    name: "Submit",
                    ontap: () {
                      // معالجة عملية الإرسال
                    },
                  ),
                ),
              ],
            ),
          ])),
    );
  }
}
