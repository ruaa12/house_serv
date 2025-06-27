import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_serviece/core/unified_api/status.dart';
import 'package:home_serviece/feature/address/bloc/bloc/bloc/address_bloc.dart';

import 'package:home_serviece/feature/address/data/data_source/address_datasource.dart';
import 'package:home_serviece/feature/address/data/models/address.dart';
import 'package:home_serviece/feature/auth/presentation/widget/button.dart';
import 'package:home_serviece/feature/home/presentation/screen/profile.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddressBloc(dataSource: AddressDataSource()),
      child: const _AddressView(),
    );
  }
}

class _AddressView extends StatelessWidget {
  const _AddressView();

  @override
  Widget build(BuildContext context) {
    final cityController = TextEditingController();
    final regionController = TextEditingController();
    final streetController = TextEditingController();
    final buildingController = TextEditingController();

    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        title: Text('Address'),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const ProfileScreen()),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: BlocConsumer<AddressBloc, AddressState>(
        listener: (context, state) {
          if (state.status == ApiStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Address created successfully')),
            );
          } else if (state.status == ApiStatus.failed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.failure?.message ?? 'Failed')),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                if (state.address != null) ...[
                  const Text(
                    'Current Address:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'City: ${state.address!.city ?? ''},',
                  ),
                  Text(
                    'Region: ${state.address!.region ?? ''}',
                  ),
                  Text(
                    'Street: ${state.address!.street ?? ''}',
                  ),
                  Text(
                    'Building: ${state.address!.building ?? ''}',
                  ),
                  const Divider(height: 32),
                ] else ...[
                  const Text('No address available'),
                  const Divider(height: 32),
                ],
                TextField(
                  controller: cityController,
                  decoration: const InputDecoration(
                      labelText: 'City',
                      labelStyle: TextStyle(color: Colors.black)),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: regionController,
                  decoration: const InputDecoration(
                      labelText: 'Region',
                      labelStyle: TextStyle(color: Colors.black)),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: streetController,
                  decoration: const InputDecoration(
                      labelText: 'Street',
                      labelStyle: TextStyle(color: Colors.black)),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: buildingController,
                  decoration: const InputDecoration(
                      labelText: 'Building',
                      labelStyle: TextStyle(color: Colors.black)),
                ),
                const SizedBox(height: 50),
                Button(
                  ontap: () {
                    final address = AddressData(
                      city: cityController.text,
                      region: regionController.text,
                      street: streetController.text,
                      building: buildingController.text,
                      addressableId: 1, // عدل حسب المطلوب
                      addressableType: "User", // عدل حسب المطلوب
                    );

                    context
                        .read<AddressBloc>()
                        .add(CreateAddressEvent(addressData: address));
                  },
                  name: 'Create Address',
                ),
                if (state.status == ApiStatus.loading)
                  const Center(child: CircularProgressIndicator()),
              ],
            ),
          );
        },
      ),
    );
  }
}
