import 'package:home_serviece/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:home_serviece/feature/home/presentation/screen/profile.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';

// ignore: camel_case_types
class My_Order_Screen extends StatelessWidget {
  const My_Order_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
          title: Text(
            LocaleKeys.myOrderScreen_My_order.tr(),
          ),
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(),
                        ));
                  },
                  icon: Icon(Icons.arrow_back))
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            OrderCard(
              image: 'assets/images/Gallery - Small-1.png',
              name: 'Luxury Villa',
              price: '\$500,000',
              date: '2025-03-15',
            ),
            OrderCard(
              image: 'assets/images/Gallery - Small-1.png',
              name: 'Modern Apartment',
              price: '\$300,000',
              date: '2025-02-20',
            ),
            OrderCard(
              image: 'assets/images/Gallery - Small-1.png',
              name: 'Cozy Cottage',
              price: '\$150,000',
              date: '2025-01-10',
            ),
          ],
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final String date;

  const OrderCard({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  LocaleKeys.myOrderScreen_price.tr(),
                  style: TextStyle(color: Colors.grey[600]),
                ),
                Text(
                  LocaleKeys.myOrderScreen_Data.tr(),
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
