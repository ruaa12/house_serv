import 'package:home_serviece/feature/service/presentation/screen/sign_screen.dart';
import 'package:home_serviece/generated/locale_keys.g.dart';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:home_serviece/feature/auth/presentation/widget/button.dart';
import 'package:home_serviece/feature/auth/presentation/widget/custom_text_field.dart';
import 'package:home_serviece/feature/home/presentation/screen/navbar.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';
import 'package:home_serviece/feature/wallet/transaction.dart';
import 'package:intl/intl.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  String? selectedMethod;
  File? _selectedImage;

  List<Map<String, dynamic>> transactions = [];

  final List<String> paymentMethods = [
    "Bank Transfer",
    "Credit Card",
    "PayPal",
    "Cash"
  ];

  void _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        _selectedImage = File(result.files.single.path!);
      });
    }
  }

  void _submitData() {
    if (amountController.text.isNotEmpty &&
        selectedMethod != null &&
        _selectedImage != null) {
      transactions.add({
        'title': selectedMethod!,
        'date': DateFormat('dd MMM yyyy').format(DateTime.now()),
        'amount': '- \$${amountController.text}',
        'image': _selectedImage,
      });

      setState(() {
        amountController.clear();
        noteController.clear();
        selectedMethod = null;
        _selectedImage = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: Text(
          'Wallet'.tr(),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Navbar(),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Upload Receipt",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: amountController,
                hint: "Amount",
                validator: (String) {},
                label: 'Amount',
                hintText: 'Amount',
                keybourdTybe: TextInputType.number,
                onChanged: (String value) {},
                keyboardType: TextInputType.number,
                labelText: '',
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: selectedMethod,
                items: paymentMethods
                    .map((method) => DropdownMenuItem(
                          value: method,
                          child: Text(method),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedMethod = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Select Payment Method",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: _selectedImage == null
                      ? const Center(
                          child: Icon(
                            Icons.camera_alt,
                            size: 50,
                            color: Colors.grey,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            _selectedImage!,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Button(
                  name: "Submit",
                  ontap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignScreen()));
                  },
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            TransactionScreen(transactions: transactions),
                      ),
                    );
                  },
                  icon: const Icon(Icons.history),
                  label: const Text(
                    "View All Transactions",
                    style: TextStyle(color: color1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
