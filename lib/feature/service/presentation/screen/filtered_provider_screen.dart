// filtered_provider_screen.dart
import 'package:flutter/material.dart';
import '../widget/services_data.dart';

class FilteredProviderScreen extends StatefulWidget {
  final DateTime selectedDate;
  final int? selectedServiceId;
  final int? selectedExperience;
  final double? selectedMaxPrice;

  const FilteredProviderScreen({
    Key? key,
    required this.selectedDate,
    this.selectedServiceId,
    this.selectedExperience,
    this.selectedMaxPrice,
  }) : super(key: key);

  @override
  State<FilteredProviderScreen> createState() => _FilteredProviderScreenState();
}

class _FilteredProviderScreenState extends State<FilteredProviderScreen> {
  late DateTime selectedDate;
  int? selectedServiceId;
  int? selectedExperience;
  double selectedMaxPrice = 0;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.selectedDate;
    selectedServiceId = widget.selectedServiceId;
    selectedExperience = widget.selectedExperience;
    selectedMaxPrice = widget.selectedMaxPrice ?? 0;
  }

  Widget _buildOutlinedButton(String label, bool isSel, VoidCallback onTap) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: isSel ? Colors.blue : Colors.grey),
        backgroundColor: isSel ? Colors.blue.shade50 : null,
      ),
      onPressed: onTap,
      child: Text(label),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filter')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Service', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: services.map((s) {
              final id = s['id'] as int;
              return _buildOutlinedButton(
                s['name'] as String,
                selectedServiceId == id,
                () => setState(() => selectedServiceId = id),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          const Text('Experience (years)',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [1, 3, 5, 10].map((e) {
              return _buildOutlinedButton(
                '$e+',
                selectedExperience == e,
                () => setState(() => selectedExperience = e),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          const Text('Date', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Row(children: [
            Text(selectedDate.toLocal().toString().split(' ')[0],
                style: const TextStyle(fontSize: 16)),
            const SizedBox(width: 12),
            ElevatedButton.icon(
              onPressed: () async {
                final pick = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (pick != null) setState(() => selectedDate = pick);
              },
              icon: const Icon(Icons.calendar_today, size: 16),
              label: const Text('Change'),
            ),
          ]),
          const SizedBox(height: 20),
          const Text('Max Rate', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Center(
            child: Text('\$${selectedMaxPrice.round()}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          ),
          Slider(
            min: 0,
            max: 200,
            divisions: 20,
            value: selectedMaxPrice,
            onChanged: (v) => setState(() => selectedMaxPrice = v),
          ),
          const Spacer(),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'selectedDate': selectedDate,
                  'selectedServiceId': selectedServiceId,
                  'selectedExperience': selectedExperience,
                  'selectedMaxPrice': selectedMaxPrice,
                });
              },
              child: const Text('Apply Filters'),
            ),
          ),
        ]),
      ),
    );
  }
}
