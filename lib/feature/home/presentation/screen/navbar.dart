import 'package:flutter/material.dart';

import 'package:home_serviece/feature/home/presentation/screen/cart_screen.dart';
import 'package:home_serviece/feature/home/presentation/screen/home_screen.dart';
import 'package:home_serviece/feature/home/presentation/screen/profile.dart';
import 'package:home_serviece/feature/home/presentation/screen/search_screen.dart';

import '../widget/const.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int currentpage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          setState(() {
            currentpage = value;
          });
        },
        indicatorColor: color2,
        selectedIndex: currentpage,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.search),
            icon: Icon(Icons.search_off_outlined),
            label: 'Search',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.shopping_cart),
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
      ),
      body: <Widget>[
        const HomeScreen(),
        SearchScreen(),
        CartScreen(),
        const ProfileScreen()
      ][currentpage],
    );
  }
}
