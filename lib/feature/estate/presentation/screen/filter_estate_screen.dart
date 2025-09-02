import 'package:flutter/material.dart';
import 'package:home_serviece/feature/estate/presentation/widget/filter_form_option.dart';
import '../widget/estate_card.dart';
import '../widget/estate_data.dart';
import '../widget/filter_form.dart';

class FilteredEstatesScreen extends StatefulWidget {
  const FilteredEstatesScreen({super.key});

  @override
  State<FilteredEstatesScreen> createState() => _FilteredEstatesScreenState();
}

class _FilteredEstatesScreenState extends State<FilteredEstatesScreen> {
  FilterOptions _filters = FilterOptions();
  List<Estate> _filteredEstates = estates;

  void _applyFilters(FilterOptions options) {
    setState(() {
      _filters = options;
      _filteredEstates = estates.where((estate) {
        final matchesType = options.selectedType == null || estate.type == options.selectedType;
        final matchesArea = options.minArea == null || estate.area >= options.minArea!;
        final matchesPrice = options.maxPrice == null || estate.price <= options.maxPrice!;
        final matchesLocation = options.selectedLocation == null || estate.location.toLowerCase().contains(options.selectedLocation!.toLowerCase());
        final matchesRooms = options.selectedRooms == null || estate.rooms == options.selectedRooms;
        return matchesType && matchesArea && matchesPrice && matchesLocation && matchesRooms;
      }).toList();
    });
  }

  void _openFilterSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => Padding(
        padding: const EdgeInsets.only(top: 40),
        child: FilterForm(
          filterOptions: _filters,
          onApplyFilters: _applyFilters,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtered Estates'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _openFilterSheet,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _filteredEstates.length,
        itemBuilder: (context, index) {
          // return EstateCard(estate: _filteredEstates[index]);
        },
      ),
    );
  }
}
