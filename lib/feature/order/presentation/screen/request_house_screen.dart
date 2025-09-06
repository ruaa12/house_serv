import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_serviece/core/unified_api/status.dart';

import 'package:home_serviece/feature/estate/presentation/widget/estate_data.dart';
import 'package:home_serviece/feature/order/bloc/bloc/order_bloc.dart';
import 'package:home_serviece/feature/wallet/presentation/screen/wallet_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';

class CreateHouseOrderContent extends StatefulWidget {
  final int houseId;
  final Estate estate;

  const CreateHouseOrderContent({
    super.key,
    required this.houseId,
    required this.estate,
  });

  @override
  State<CreateHouseOrderContent> createState() => _CreateHouseOrderContentState();
}

class _CreateHouseOrderContentState extends State<CreateHouseOrderContent> {
  final _formKey = GlobalKey<FormState>();
  final _notesController = TextEditingController();

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.cyan,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("طلب العقار")),
      body: BlocConsumer<OrderBloc, OrderState>(
        listener: (context, state) {
          if (state.createHouseOrderStatus == ApiStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('✅ تم إنشاء الطلب بنجاح')),
            );
          } else if (state.createHouseOrderStatus == ApiStatus.failed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.createHouseOrderFailure?.message ?? '❌ فشل إنشاء الطلب',
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- عرض بيانات البيت ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.estate.type ?? '',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                      Text(
                        '\$${widget.estate.price}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          widget.estate.name ?? '',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // --- حقل الملاحظات ---
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

                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.black)),
                    padding: EdgeInsetsDirectional.symmetric(vertical: 10),
                    child: Signature(
                      controller: _controller,
                      width: 300,
                      height: 300,
                      backgroundColor: Colors.white,
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  state.createHouseOrderStatus == ApiStatus.loading
                      ? const Center(child: CircularProgressIndicator())
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
                                final image = await _controller.toPngBytes();
                                final tempDir = await getExternalStorageDirectory();
                                final tempPath = '${tempDir!.path}/signature_${DateTime.now().millisecondsSinceEpoch}.png';

                                final File file = File(tempPath);
                                await file.writeAsBytes(image!.toList());
                                print(file.path);
                                print(widget.houseId);
                                File imageFile = await File(tempPath).create();

                                context.read<OrderBloc>().add(CreateHouseOrderEvent(
                                      image: imageFile,
                                      houseId: widget.houseId,
                                  context: context,
                                    ));
                              }
                            },
                            label: const Text("إرسال الطلب"),
                          ),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
