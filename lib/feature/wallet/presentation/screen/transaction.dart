/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_serviece/core/unified_api/status.dart';
import 'package:home_serviece/feature/order/bloc/bloc/order_bloc.dart';
import 'package:home_serviece/feature/wallet/bloc/wallet_bloc.dart';

class WalletCheckPage extends StatelessWidget {
  final int houseId;
  final String notes;
  final double price;

  const WalletCheckPage({
    super.key,
    required this.houseId,
    required this.notes,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletBloc, WalletState>(
      builder: (context, state) {
        if (state.balanceStatus == ApiStatus.loading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final balance = state.balance ?? 0.0;

        if (balance < price) {
          return Scaffold(
            appBar: AppBar(title: const Text("المحفظة")),
            body: Center(
              child: Text(
                "رصيدك غير كافٍ لإتمام الشراء.\nرصيدك الحالي: \$${balance.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(title: const Text("تأكيد الشراء")),
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                // تنفيذ الطلب
                context.read<OrderBloc>().add(
                      CreateHouseOrderEvent(houseId: houseId, notes: notes),
                    );

                // خصم المبلغ
                context.read<WalletBloc>().add(
                      MakeTransactionEvent(price),
                    );

                Navigator.popUntil(context,
                    ModalRoute.withName('/')); // العودة للصفحة الرئيسية
              },
              child: const Text("تأكيد ودفع"),
            ),
          ),
        );
      },
    );
  }
}*/
