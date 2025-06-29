import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_serviece/core/unified_api/status.dart';
import 'package:home_serviece/feature/home/presentation/widget/const.dart';
import 'package:home_serviece/feature/order/bloc/bloc/order_bloc.dart';

class CreateHouseOrderScreen extends StatefulWidget {
  final int houseId;
  const CreateHouseOrderScreen({super.key, required this.houseId});

  @override
  State<CreateHouseOrderScreen> createState() => _CreateHouseOrderScreenState();
}

class _CreateHouseOrderScreenState extends State<CreateHouseOrderScreen> {
  final _formKey = GlobalKey<FormState>();
  final _notesController = TextEditingController();

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        title: const Text("Create House Order"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<OrderBloc, OrderState>(
          listener: (context, state) {
            if (state.createHouseOrderStatus == ApiStatus.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Order created successfully')),
              );
              Navigator.pop(context);
            } else if (state.createHouseOrderStatus == ApiStatus.failed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(
                        state.createHouseOrderFailure?.message ?? 'Failed')),
              );
            }
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _notesController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelText: "Notes",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter notes";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  state.createHouseOrderStatus == ApiStatus.loading
                      ? const CircularProgressIndicator()
                      : SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.send),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<OrderBloc>().add(
                                      CreateHouseOrderEvent(
                                        houseId: widget.houseId,
                                        notes: _notesController.text,
                                      ),
                                    );
                              }
                            },
                            label: const Text("Submit Order"),
                          ),
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
