/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_serviece/core/unified_api/status.dart';
import 'package:home_serviece/feature/estate/presentation/widget/estate_data.dart';
import 'package:home_serviece/feature/wallet/bloc/wallet_bloc.dart';
import 'package:home_serviece/feature/wallet/presentation/screen/wallet_screen.dart';

class WalletConfirmScreen extends StatelessWidget {
  final Estate estateId;
  final String price; // استلمناه كسعر من الطلب

  const WalletConfirmScreen({
    super.key,
    required this.estateId,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("تأكيد الدفع")),
      body: BlocBuilder<WalletBloc, WalletState>(
        builder: (context, state) {
          if (state.balanceStatus == ApiStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          final currentBalance = state.balance ?? 0.0;
          final priceAsDouble = double.tryParse(price) ?? 0.0;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("سعر العقار: $price ل.س",
                      style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 10),
                  Text("رصيدك الحالي: $currentBalance ل.س",
                      style: TextStyle(fontSize: 18)),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // نطلق الحدث لعملية الدفع
                      context.read<WalletBloc>().add(
                            MakeTransactionEvent(priceAsDouble),
                          );
                      if (currentBalance >= priceAsDouble) {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => WalletScreen()));
                      } else {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text("الرصيد غير كافٍ"),
                            content: const Text(
                                "رصيدك لا يكفي لإتمام العملية، يرجى تعبئة المحفظة."),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("موافق"),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: const Text("تأكيد الدفع"),
                  ),
                ]),
          );
        },
      ),
    );
  }
}
*/
