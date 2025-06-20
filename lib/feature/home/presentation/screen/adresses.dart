import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:home_serviece/feature/address/bloc/bloc/address_bloc.dart';
import 'package:home_serviece/feature/address/bloc/bloc/address_event.dart';
import 'package:home_serviece/feature/address/bloc/bloc/address_state.dart';
import 'package:home_serviece/feature/address/data/models/address.dart';
import 'package:home_serviece/generated/locale_keys.g.dart';
import 'package:home_serviece/feature/home/presentation/screen/profile.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';
import 'package:home_serviece/feature/home/presentation/widget/custom_text_field1.dart';
import 'package:home_serviece/feature/auth/presentation/widget/button.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final cityController = TextEditingController();
  final regionController = TextEditingController();
  final streetController = TextEditingController();
  final buildingController = TextEditingController();

  @override
  void dispose() {
    cityController.dispose();
    regionController.dispose();
    streetController.dispose();
    buildingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.general_address.tr()),
        backgroundColor: color1,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: BlocListener<AddressBloc, AddressState>(
        listener: (context, state) {
          if (state.status == ApiStatus.success) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(LocaleKeys.adresses_success.tr()),
                content: Text(LocaleKeys
                    .adresses_Your_address_has_been_saved_successfully
                    .tr()),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileScreen()),
                      );
                    },
                    child: Text(LocaleKeys.adresses_ok.tr()),
                  ),
                ],
              ),
            );
          } else if (state.status == ApiStatus.failed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('address faild')),
            );
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.general_Enter_your_address.tr(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  validator: (value) => null,
                  label: LocaleKeys.adresses_city.tr(),
                  labelText: 'City'.tr(),
                  keyboardType: TextInputType.text,
                  controller: cityController,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  validator: (value) => null,
                  label: LocaleKeys.adresses_address.tr(),
                  labelText: 'Region'.tr(),
                  keyboardType: TextInputType.text,
                  controller: regionController,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  validator: (value) => null,
                  label: 'street',
                  labelText: 'Street'.tr(),
                  keyboardType: TextInputType.text,
                  controller: streetController,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  validator: (value) => null,
                  label: 'building',
                  labelText: 'Building'.tr(),
                  keyboardType: TextInputType.text,
                  controller: buildingController,
                ),
                const SizedBox(height: 30),
                Center(
                  child: BlocBuilder<AddressBloc, AddressState>(
                    builder: (context, state) {
                      return Button(
                        name: state.status == ApiStatus.loading
                            ? '...'.tr()
                            : LocaleKeys.adresses_save_address.tr(),
                        ontap: state.status == ApiStatus.loading
                            ? null
                            : () {
                                context.read<AddressBloc>().add(
                                      CreateAddressEvent(
                                        city: cityController.text,
                                        region: regionController.text,
                                        street: streetController.text,
                                        building: buildingController.text,
                                      ),
                                    );
                              },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
