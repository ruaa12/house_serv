import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class ContractFormScreen extends StatefulWidget {
  @override
  _ContractFormScreenState createState() => _ContractFormScreenState();
}

class _ContractFormScreenState extends State<ContractFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
  );

  String fullName = '';
  String idNumber = '';
  String address = '';

  void submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (_signatureController.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('يرجى توقيع العقد')),
        );
        return;
      }

      Uint8List? signatureBytes = await _signatureController.toPngBytes();
      if (signatureBytes == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('حدث خطأ في التقاط التوقيع')),
        );
        return;
      }

      String signatureBase64 = base64Encode(signatureBytes);

      // هنا تبعت البيانات مع التوقيع لAPI
      print('الاسم: $fullName');
      print('رقم الهوية: $idNumber');
      print('العنوان: $address');
      print('التوقيع (base64): $signatureBase64');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('تم حفظ العقد بنجاح')),
      );

      // لو حابب تمسح التوقيع بعد الحفظ:
      _signatureController.clear();
    }
  }

  @override
  void dispose() {
    _signatureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تعبئة بيانات العقد والتوقيع'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'الاسم الكامل'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'الرجاء إدخال الاسم' : null,
                onSaved: (value) => fullName = value!.trim(),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'رقم الهوية'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'الرجاء إدخال رقم الهوية' : null,
                onSaved: (value) => idNumber = value!.trim(),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'العنوان'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'الرجاء إدخال العنوان' : null,
                onSaved: (value) => address = value!.trim(),
              ),
              SizedBox(height: 20),
              Text('التوقيع:', style: TextStyle(fontSize: 16)),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: Signature(
                  controller: _signatureController,
                  backgroundColor: Colors.white,
                ),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      _signatureController.clear();
                    },
                    child: Text('مسح التوقيع'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: submitForm,
                child: Text('حفظ العقد'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}