import 'package:flutter/material.dart';

import 'package:home_serviece/feature/home/presentation/widget/customlsttile.dart';
import 'package:home_serviece/feature/service/presentation/screen/provider_details_screen.dart';

import '../widget/providers_data.dart';

class ServiceProvidersScreen extends StatelessWidget {
  final Map<String, dynamic> service;

  ServiceProvidersScreen({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filteredProviders = providers
        .where((provider) => provider['serviceId'] == service['id'])
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('${service['name']} Providers'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: filteredProviders.length,
        itemBuilder: (context, index) {
          final provider = filteredProviders[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProviderDetailsScreen(provider: provider),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(10),
              child: CustomListTile(
                trailing: Text('Rate: \$${provider['hourlyRate']}/hour'),
                title: provider['name'],
                leading: Image.asset(provider['image']),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProviderDetailsScreen(provider: provider),
                    ),
                  );
                },
              ),

              // ListTile(
              //   leading: Image.asset(provider['image'], width: 50, height: 50),
              //   title: Text(provider['name']),
              //   subtitle: Text('Location: ${provider['location']}'),
              //   trailing: Text('Rate: \$${provider['hourlyRate']}/hour'),
              // ),
            ),
          );
        },
      ),
    );
  }
}
