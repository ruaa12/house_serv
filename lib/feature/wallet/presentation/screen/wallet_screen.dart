import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:home_serviece/feature/wallet/bloc/wallet_bloc.dart';
import 'package:home_serviece/core/unified_api/status.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  String _transactionType = 'deposit'; // بدل Set<String>
  final TextEditingController _amountController = TextEditingController();
  double _localBalance = 0;

  @override
  void initState() {
    super.initState();
    _loadLocalBalance();
    BlocProvider.of<WalletBloc>(context).add(GetBalanceEvent());
  }

  Future<void> _loadLocalBalance() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _localBalance = prefs.getDouble('wallet_balance') ?? 0;
    });
  }

  Future<void> _updateLocalBalance(double newBalance) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('wallet_balance', newBalance);
    setState(() {
      _localBalance = newBalance;
    });
  }

  void _makeTransaction() {
    final amount = double.tryParse(_amountController.text);
    if (amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('الرجاء إدخال مبلغ صحيح')),
      );
      return;
    }

    if (_transactionType == 'withdraw' && amount > _localBalance) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('الرصيد غير كافٍ للسحب')),
      );
      return;
    }

    BlocProvider.of<WalletBloc>(context).add(
      MakeTransactionEvent(
        amount: amount,
        type: _transactionType,
      ),
    );

    _amountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المحفظة')),
      body: BlocListener<WalletBloc, WalletState>(
        listener: (context, state) {
          if (state.balanceStatus == ApiStatus.success &&
              state.balance != null) {
            _updateLocalBalance(state.balance!);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              BlocBuilder<WalletBloc, WalletState>(
                builder: (context, state) {
                  final balance = state.balance ?? _localBalance;
                  return Column(
                    children: [
                      Text(
                        'الرصيد الحالي: ${balance.toStringAsFixed(0)} ل.س',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton.icon(
                        onPressed: () {
                          print("doneeeee");
                          context.read<WalletBloc>().add(GetBalanceEvent());
                        },
                        icon: const Icon(Icons.refresh),
                        label: const Text('تحديث الرصيد'),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 24),

              // اختيار نوع العملية
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: const Text('إيداع'),
                      value: 'deposit',
                      groupValue: _transactionType,
                      onChanged: (value) {
                        setState(() {
                          _transactionType = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: const Text('سحب'),
                      value: 'withdraw',
                      groupValue: _transactionType,
                      onChanged: (value) {
                        setState(() {
                          _transactionType = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'أدخل المبلغ',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // زر تنفيذ العملية
              ElevatedButton(
                onPressed: _makeTransaction,
                child: const Text('تنفيذ العملية'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
