import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:home_serviece/feature/home/presentation/screen/cart_screen.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';
import 'package:home_serviece/feature/home/presentation/widget/custom_text_field1.dart';
import 'package:home_serviece/feature/auth/presentation/widget/button.dart';
import 'package:home_serviece/feature/home/presentation/widget/customlsttile.dart';

class CheckoutScreen extends StatelessWidget {
  final List<String> cartItems = [
    'House 1 - Price: \$150000',
    'House 2 - Price: \$230000',
    'House 3 - Price: \$320000',
  ];

  final int totalPrice = 150000 + 230000 + 320000;

  CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Out'.tr()),
        backgroundColor: color1,
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(),
                    ));
              },
              icon: Icon(Icons.arrow_back),
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
                'Your Order:'.tr(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return CustomListTile(
                    title: cartItems[index],
                    leading: Icon(Icons.home, color: color1),
                    trailing: null,
                    onTap: () {},
                  );
                },
              ),
              Divider(),
              Text(
                'Total Price: \$$totalPrice'.tr(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              CustomTextField(
                validator: (p0) {
                  return null;
                },
                label: 'Name'.tr(),
                labelText: 'Name'.tr(),
                keyboardType: TextInputType.name,
                controller: TextEditingController(),
              ),
              SizedBox(height: 10),
              CustomTextField(
                validator: (p0) {
                  return null;
                },
                label: 'Address'.tr(),
                labelText: 'Address'.tr(),
                keyboardType: TextInputType.name,
                controller: TextEditingController(),
              ),
              SizedBox(height: 10),
              CustomTextField(
                validator: (p0) {
                  return null;
                },
                label: 'Phone'.tr(),
                labelText: 'Phone'.tr(),
                keyboardType: TextInputType.phone,
                controller: TextEditingController(),
              ),
              SizedBox(height: 30),
              Center(
                child: Button(
                  name: 'Confirm Order'.tr(),
                  ontap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Thank You!'.tr()),
                        content: Text(
                            'Your order has been placed successfully.'.tr()),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('OK'.tr()),
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
