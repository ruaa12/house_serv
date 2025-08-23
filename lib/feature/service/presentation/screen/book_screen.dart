import 'package:flutter/material.dart';
import 'package:home_serviece/feature/auth/presentation/widget/button.dart';
import 'package:home_serviece/feature/home/presentation/widget/custom_text_field1.dart';
import 'package:home_serviece/feature/wallet/presentation/screen/wallet_screen.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookScreen> {
  TimeOfDay? selectedTime;
  final addressController = TextEditingController();
  final notesController = TextEditingController();

  Future<void> _pickTime() async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) {
      setState(() {
        selectedTime = time;
      });
    }
  }

  String get formattedTime {
    if (selectedTime == null) return 'Select Time';
    return selectedTime!.format(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Service')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Time Picker Button
            Button(
              name: formattedTime,
              ontap: _pickTime,
            ),
            const SizedBox(height: 20),

            // Address Field
            CustomTextField(
              controller: addressController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the address';
                }
                return null;
              },
              label: 'Home Address',
              labelText: 'Address',
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 20),

            // Notes Field
            CustomTextField(
              controller: notesController,
              validator: (value) => null,
              label: 'Additional Notes',
              labelText: 'Notes',
              keyboardType: TextInputType.multiline,
            ),
            const SizedBox(height: 30),

            // Confirm Button
            Button(
              name: 'Confirm Booking',
              ontap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => WalletScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
