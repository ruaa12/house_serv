import 'package:flutter/material.dart';
import '../widget/estate_data.dart';
import '../widget/estate_card.dart';

class FilteredEstateList extends StatefulWidget {
  static String id = 'searchScreen';

  @override
  _FilteredEstateListState createState() => _FilteredEstateListState();
}

class _FilteredEstateListState extends State<FilteredEstateList> {
  List<Estate> filteredEstates = List.from(estates); // القائمة المُفلترة
  String selectedType = 'All';
  double minPrice = 200;
  double maxPrice = 5000;
  double minArea = 100;
  double maxArea = 1000;
  int minRooms = 2;
  int maxRooms = 10;

  // تحديث الفلاتر
  void applyFilters() {
    setState(() {
      filteredEstates = estates.where((estate) {
        if (estate.price == null ||
            estate.area == null ||
            estate.rooms == null) {
          return false;
        }
        bool matchesType = selectedType == 'All' || estate.type == selectedType;
        bool matchesPrice =
            estate.price >= minPrice && estate.price <= maxPrice;
        bool matchesArea = estate.area >= minArea && estate.area <= maxArea;
        bool matchesRooms =
            estate.rooms >= minRooms && estate.rooms <= maxRooms;
        return matchesType && matchesPrice && matchesArea && matchesRooms;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filtered Estates')),
      body: Column(
        children: [
          // الفلاتر
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                DropdownButton<String>(
                  value: selectedType,
                  items: ['All', 'Apartment', 'Villa', 'Studio']
                      .map((String type) {
                    return DropdownMenuItem<String>(
                      value: type,
                      child: Text(type),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedType = value!;
                    });
                    applyFilters();
                  },
                  hint: Text("Select Type"),
                ),
                RangeSlider(
                  values: RangeValues(minPrice, maxPrice),
                  min: 200,
                  max: 5000,
                  divisions: 10,
                  labels: RangeLabels("\$${minPrice.toStringAsFixed(0)}",
                      "\$${maxPrice.toStringAsFixed(0)}"),
                  onChanged: (values) {
                    setState(() {
                      minPrice = values.start;
                      maxPrice = values.end;
                    });
                    applyFilters();
                  },
                ),
                RangeSlider(
                  values: RangeValues(minArea, maxArea),
                  min: 100,
                  max: 1000,
                  divisions: 10,
                  labels: RangeLabels("${minArea.toStringAsFixed(0)} m²",
                      "${maxArea.toStringAsFixed(0)} m²"),
                  onChanged: (values) {
                    setState(() {
                      minArea = values.start;
                      maxArea = values.end;
                    });
                    applyFilters();
                  },
                ),
                RangeSlider(
                  values: RangeValues(minRooms.toDouble(), maxRooms.toDouble()),
                  min: 2,
                  max: 10,
                  divisions: 10,
                  labels: RangeLabels("$minRooms rooms", "$maxRooms rooms"),
                  onChanged: (values) {
                    setState(() {
                      minRooms = values.start.toInt();
                      maxRooms = values.end.toInt();
                    });
                    applyFilters();
                  },
                ),
              ],
            ),
          ),
          // عرض العقارات بعد الفلترة
          Expanded(
            child: ListView.builder(
              itemCount: filteredEstates.length,
              itemBuilder: (context, index) {
                // return EstateCard(estate: filteredEstates[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
