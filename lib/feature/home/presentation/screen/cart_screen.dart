import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:home_serviece/feature/home/presentation/screen/check_out_screen.dart';
import 'package:home_serviece/feature/home/presentation/screen/navbar.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';
import 'package:home_serviece/feature/auth/presentation/widget/button.dart';
import 'package:home_serviece/feature/home/presentation/widget/customlsttile.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<String> cartItems = [
    'House 1 - Price: \$150000 - Date: 2025-03-19',
    'House 2 - Price: \$230000 - Date: 2025-03-18',
    'House 3 - Price: \$320000 - Date: 2025-03-17',
  ];
  List<String> cartImages = [
    'assets/images/photo_2025-02-09_15-46-25.jpg',
    'assets/images/photo_2025-02-09_15-46-25.jpg',
    'assets/images/photo_2025-02-09_15-46-25.jpg',
  ];
  List<int> cartPrices = [150000, 230000, 320000]; // قائمة الأسعار

  // دالة تتحقق إذا كان قد تم إضافة منزل مسبقاً
  bool hasHouse() {
    return cartItems.any((item) => item.toLowerCase().contains("house"));
  }

  // إضافة عنصر جديد (منزل أو خدمة)
  void addItem(String newItem, String imagePath, int price) {
    // إذا كان العنصر منزل، تحقق إذا تم إضافة منزل مسبقاً
    if (newItem.toLowerCase().contains("house") && hasHouse()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You can only add one house!')),
      );
      return;
    }

    setState(() {
      cartItems.add(newItem);
      cartImages.add(imagePath);
      cartPrices.add(price);
    });
  }

  void _removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
      cartImages.removeAt(index);
      cartPrices.removeAt(index);
    });
  }

  int _getTotalPrice() {
    return cartPrices.fold(0, (total, price) => total + price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Houses Cart'.tr()),
        backgroundColor: color1,
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Navbar()),
                );
              },
              icon: Icon(Icons.arrow_back),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: cartItems.isEmpty
                ? Center(
                    child: Text(
                      'Your cart is empty!'.tr(),
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: CustomListTile(
                          title: cartItems[index],
                          leading: Image.asset(
                            cartImages[index],
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: color1),
                            onPressed: () => _removeItem(index),
                          ),
                          onTap: () {},
                        ),
                      );
                    },
                  ),
          ),
          SizedBox(height: 28),
          if (cartItems.isNotEmpty)
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Text(
                'Total Price: \$${_getTotalPrice()}'.tr(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          Button(
            ontap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => CheckoutScreen()));
            },
            name: 'Check out'.tr(),
          ),
        ],
      ),
    );
  }
}
