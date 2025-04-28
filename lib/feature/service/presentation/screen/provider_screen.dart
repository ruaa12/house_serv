// providers_screen.dart
import 'package:flutter/material.dart';
import 'package:home_serviece/feature/home/presentation/widget/customlsttile.dart';
import 'package:home_serviece/feature/service/presentation/screen/filtered_provider_screen.dart';
import '../widget/providers_data.dart';
import '../widget/services_data.dart';

import 'provider_details_screen.dart';

class ProvidersScreen extends StatefulWidget {
  const ProvidersScreen({Key? key}) : super(key: key);

  @override
  State<ProvidersScreen> createState() => _ProvidersScreenState();
}

class _ProvidersScreenState extends State<ProvidersScreen> {
  DateTime selectedDate = DateTime.now();
  int? selectedServiceId;
  int? selectedExperience;
  double? selectedMaxPrice;

  void _openFilterScreen() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FilteredProviderScreen(
          selectedDate: selectedDate,
          selectedServiceId: selectedServiceId,
          selectedExperience: selectedExperience,
          selectedMaxPrice: selectedMaxPrice,
        ),
      ),
    );
    if (result != null) {
      setState(() {
        selectedDate = result['selectedDate'] ?? selectedDate;
        selectedServiceId = result['selectedServiceId'];
        selectedExperience = result['selectedExperience'];
        selectedMaxPrice = result['selectedMaxPrice'];
      });
    }
  }

  List<Map<String, dynamic>> _getFilteredProvidersByService(int serviceId) {
    return providers.where((p) {
      // تأكد من نوع الخدمة
      if (p['serviceId'] != serviceId) return false;

      // فلترة حسب التاريخ
      final start = p['availableStart'] as DateTime;
      final end = p['availableEnd'] as DateTime;
      final isInRange = selectedDate.isAtSameMomentAs(start) ||
          selectedDate.isAtSameMomentAs(end) ||
          (selectedDate.isAfter(start) && selectedDate.isBefore(end));
      if (!isInRange) return false;

      // فلترة الخبرة والسعر
      final hasExp =
          selectedExperience == null || p['experience'] >= selectedExperience!;
      final hasPrice =
          selectedMaxPrice == null || p['hourlyRate'] <= selectedMaxPrice!;
      return hasExp && hasPrice;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    // إذا ضغط المستخدم على خدمة بعينها، عرضها فقط، وإلا جميع الخدمات
    final displayServices = selectedServiceId == null
        ? services
        : services.where((s) => s['id'] == selectedServiceId).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Providers'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: const Icon(Icons.filter_alt), onPressed: _openFilterScreen),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final picked = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime.now(),
            lastDate: DateTime(2100),
          );
          if (picked != null) setState(() => selectedDate = picked);
        },
        icon: const Icon(Icons.calendar_today),
        label: Text(selectedDate.toLocal().toString().split(' ')[0]),
        backgroundColor: const Color(0xff52859e),
      ),
      body: ListView(
        children: displayServices.map((svc) {
          final svcId = svc['id'] as int;
          final svcName = svc['name'] as String;
          final list = _getFilteredProvidersByService(svcId);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => setState(() => selectedServiceId = svcId),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(svcName,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ),
              if (list.isEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('لا يوجد مزودين متاحين',
                      style: TextStyle(color: Colors.grey)),
                ),
              ...list.map((provider) => Card(
                    margin:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    child: CustomListTile(
                      title: provider['name'],
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(provider['image'],
                            width: 50, height: 50, fit: BoxFit.cover),
                      ),
                      trailing: Text('\$${provider['hourlyRate']}/hr'),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                ProviderDetailsScreen(provider: provider)),
                      ),
                    ),
                  ))
            ],
          );
        }).toList(),
      ),
    );
  }
}
