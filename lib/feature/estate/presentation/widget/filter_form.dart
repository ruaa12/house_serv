import 'package:flutter/material.dart';
import 'package:home_serviece/feature/estate/presentation/widget/filter_form_option.dart';

class FilterForm extends StatefulWidget {
  final FilterOptions filterOptions;
  final Function(FilterOptions) onApplyFilters;

  const FilterForm(
      {super.key, required this.filterOptions, required this.onApplyFilters});

  @override
  State<FilterForm> createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  final _formKey = GlobalKey<FormState>();
  late FilterOptions _filterOptions;

  @override
  void initState() {
    super.initState();
    _filterOptions = widget.filterOptions;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: _filterOptions.selectedType,
              decoration: const InputDecoration(labelText: 'Property Type'),
              items: ['Apartment', 'Villa', 'Studio']
                  .map((type) =>
                      DropdownMenuItem(value: type, child: Text(type)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _filterOptions.selectedType = value;
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Min Area (sqm)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _filterOptions.minArea = double.tryParse(value);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Max Price (USD)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _filterOptions.maxPrice = double.tryParse(value);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Location'),
              onChanged: (value) {
                _filterOptions.selectedLocation = value;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Number of Rooms'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _filterOptions.selectedRooms = int.tryParse(value);
              },
            ),
            ElevatedButton(
              onPressed: () {
                widget.onApplyFilters(_filterOptions);
                Navigator.pop(context);
              },
              child: const Text('Apply Filters'),
            ),
          ],
        ),
      ),
    );
  }
}
