import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_serviece/core/unified_api/status.dart';
import 'package:home_serviece/feature/order/bloc/bloc/order_bloc.dart';
import 'package:home_serviece/feature/wallet/presentation/screen/wallet_screen.dart';

class CreateServiceOrderContent extends StatefulWidget {
  final int serviceId; // رقم الخدمة اللي بدك تطلبها
  const CreateServiceOrderContent({
    super.key,
    required this.serviceId,
  });

  @override
  State<CreateServiceOrderContent> createState() =>
      _CreateServiceOrderContentState();
}

class _CreateServiceOrderContentState extends State<CreateServiceOrderContent> {
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
      appBar: AppBar(
        title: const Text("طلب خدمة"),
      ),
      body: BlocConsumer<OrderBloc, OrderState>(
        listener: (context, state) {
          if (state.createServOrderStatus == ApiStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('✅ تم إنشاء طلب الخدمة بنجاح')),
            );
          } else if (state.createServOrderStatus == ApiStatus.failed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.createServOrderFailure?.message ??
                    '❌ فشل إنشاء طلب الخدمة'),
              ),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _notesController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelText: "ملاحظات",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "يرجى إدخال ملاحظات";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  state.createServOrderStatus == ApiStatus.loading
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
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                final confirmed = await showDialog<bool>(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text("تأكيد الطلب"),
                                    content: const Text(
                                        "هل أنت متأكد من أنك تريد إتمام هذا الطلب؟"),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(false),
                                        child: const Text("إلغاء"),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(true),
                                        child: const Text("تأكيد"),
                                      ),
                                    ],
                                  ),
                                );

                                if (confirmed == true) {
                                  context.read<OrderBloc>().add(
                                        CreateServOrderEvent(
                                          serviceId: widget.serviceId,
                                          notes: _notesController.text,
                                          serviceDate: '',
                                        ),
                                      );

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => WalletScreen(),
                                    ),
                                  );
                                }
                              }
                            },
                            label: const Text("إرسال"),
                          ),
                        )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
