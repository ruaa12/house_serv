import 'package:flutter/material.dart';
import 'package:home_serviece/feature/estate/presentation/widget/estate_data.dart';

class CartProvider extends ChangeNotifier {
  final List<Estate> _items = [];

  List<Estate> get items => _items;

  void addItem(Estate estate) {
    // منع إضافة أكثر من منزل واحد
    if (_items.any((item) => item.type.toLowerCase().contains("house"))) {
      if (estate.type.toLowerCase().contains("house")) return;
    }
    _items.add(estate);
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}
