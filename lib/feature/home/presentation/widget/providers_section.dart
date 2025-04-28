// lib/feature/home/presentation/widget/providers_section.dart
import 'package:flutter/material.dart';

import 'package:home_serviece/feature/home/presentation/widget/const.dart';
import 'package:home_serviece/feature/service/presentation/screen/provider_details_screen.dart';
import 'package:home_serviece/feature/service/presentation/widget/providers_data.dart';

class ProvidersSection extends StatelessWidget {
  const ProvidersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: providers.length,
            itemBuilder: (context, index) {
              final provider = providers[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            ProviderDetailsScreen(provider: provider)),
                  );
                },
                child: Container(
                  color: color2,
                  width: 160,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12)),
                          child: Image.asset(provider['image'],
                              errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.image_not_supported,
                                size: 50, color: Colors.grey);
                          },
                              height: 120,
                              width: double.infinity,
                              fit: BoxFit.contain),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(provider['name'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 4),
                              Text('Rate: \$${provider['hourlyRate']}/hr'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
