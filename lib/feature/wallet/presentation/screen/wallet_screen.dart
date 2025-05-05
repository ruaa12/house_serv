import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final TextEditingController _amountController = TextEditingController();
  String _type = 'deposit';

  // عينة بيانات مؤقتة للمعاملات
  List<Map<String, dynamic>> pendingTransactions = [
    {"id": 1, "amount": "5000", "type": "deposit", "status": "pending"},
    {"id": 2, "amount": "2000", "type": "withdraw", "status": "pending"},
  ];

  double balance = 10000;

  void _makeTransaction() {
    final amount = double.tryParse(_amountController.text);
    if (amount == null) return;

    setState(() {
      pendingTransactions.add({
        "id": pendingTransactions.length + 1,
        "amount": amount.toString(),
        "type": _type,
        "status": "pending"
      });
      _amountController.clear();
    });
  }

  void _approveTransaction(int id) {
    setState(() {
      final tx = pendingTransactions.firstWhere((e) => e["id"] == id);
      tx["status"] = "approved";
      if (tx["type"] == "deposit") {
        balance += double.parse(tx["amount"]);
      } else {
        balance -= double.parse(tx["amount"]);
      }
    });
  }

  void _rejectTransaction(int id) {
    setState(() {
      final tx = pendingTransactions.firstWhere((e) => e["id"] == id);
      tx["status"] = "rejected";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المحفظة')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // الرصيد
            Card(
              child: ListTile(
                title: const Text("الرصيد الحالي"),
                subtitle: Text("$balance ل.س"),
              ),
            ),
            const SizedBox(height: 20),

            // تنفيذ معاملة
            const Text("تنفيذ معاملة",
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "المبلغ"),
            ),
            DropdownButton<String>(
              value: _type,
              items: const [
                DropdownMenuItem(value: 'deposit', child: Text('إيداع')),
                DropdownMenuItem(value: 'withdraw', child: Text('سحب')),
              ],
              onChanged: (val) {
                setState(() {
                  _type = val!;
                });
              },
            ),
            ElevatedButton(
              onPressed: _makeTransaction,
              child: const Text("تنفيذ المعاملة"),
            ),

            const SizedBox(height: 30),

            // قائمة المعاملات
            const Text("المعاملات المعلقة",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ...pendingTransactions.map((tx) {
              return Card(
                color: tx["status"] == "approved"
                    ? Colors.green[100]
                    : tx["status"] == "rejected"
                        ? Colors.red[100]
                        : null,
                child: ListTile(
                  title: Text("المبلغ: ${tx["amount"]}"),
                  subtitle:
                      Text("النوع: ${tx["type"]} - الحالة: ${tx["status"]}"),
                  trailing: tx["status"] == "pending"
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon:
                                  const Icon(Icons.check, color: Colors.green),
                              onPressed: () => _approveTransaction(tx["id"]),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close, color: Colors.red),
                              onPressed: () => _rejectTransaction(tx["id"]),
                            ),
                          ],
                        )
                      : null,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
