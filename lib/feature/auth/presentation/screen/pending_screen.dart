import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PendingScreen extends StatefulWidget {
  const PendingScreen({super.key});

  @override
  State<PendingScreen> createState() => _PendingScreenState();
}

class _PendingScreenState extends State<PendingScreen> {

  @override
  void initState() {
    super.initState();
    saveValue();
  }

  saveValue() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isInPending', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(51), spreadRadius: 1, offset: const Offset(0, 1), blurRadius: 8),
            ],
            color: Colors.white,
          ),
          margin: EdgeInsetsDirectional.symmetric(horizontal: 20),
          padding: EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 15),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              'يتم الان مراجعة طلبك من قبل المسؤولين الرجاء الانتظار \n سيتم اخبارك بالنتائج',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
    );
  }
}
