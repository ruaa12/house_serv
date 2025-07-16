import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_serviece/core/unified_api/status.dart';
import 'package:home_serviece/feature/home/presentation/screen/navbar.dart';
import 'package:home_serviece/feature/wallet/bloc/wallet_bloc.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final TextEditingController _amountController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallet'),
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Navbar(),
                    ));
              },
              icon: Icon(Icons.arrow_back),
            )
          ],
        ),
      ),
      body: BlocConsumer<WalletBloc, WalletState>(
        listener: (context, state) {
          if (state.transactionStatus == ApiStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('✅ تم إرسال المبلغ بنجاح')),
            );
            _amountController.clear();
          } else if (state.transactionStatus == ApiStatus.failed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.transactionErrorMessage ?? '❌ حدث خطأ أثناء العملية',
                ),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Current Balance',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                if (state.balanceStatus == ApiStatus.loading)
                  const CircularProgressIndicator()
                else if (state.balanceStatus == ApiStatus.failed)
                  Column(
                    children: [
                      Text(
                        state.errorMessage ?? 'حدث خطأ أثناء تحميل الرصيد',
                        style: const TextStyle(color: Colors.red),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          context.read<WalletBloc>().add(GetBalanceEvent());
                        },
                        child: const Text('إعادة المحاولة'),
                      ),
                    ],
                  )
                else
                  Text(
                    '${state.balance?.toStringAsFixed(2) ?? '0.00'} ل.س',
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                const SizedBox(height: 40),
                TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'أدخل المبلغ',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    suffixIcon: const Icon(Icons.attach_money),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: state.transactionStatus == ApiStatus.loading
                        ? null
                        : () {
                            final amount =
                                double.tryParse(_amountController.text);
                            if (amount == null || amount <= 0) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('الرجاء إدخال مبلغ صالح')),
                              );
                              return;
                            }
                            context
                                .read<WalletBloc>()
                                .add(MakeTransactionEvent(amount));
                          },
                    icon: state.transactionStatus == ApiStatus.loading
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Icon(Icons.send),
                    label: const Text('إرسال المبلغ'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      context.read<WalletBloc>().add(GetBalanceEvent());
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text('تحديث الرصيد'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 14),
                      backgroundColor: Colors.grey[800],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
