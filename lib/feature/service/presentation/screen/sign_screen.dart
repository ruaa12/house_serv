import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({super.key});

  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
  );

  bool isSigned = false;

  void _confirmSignature() async {
    final signature = await _controller.toPngBytes();
    if (signature != null) {
      setState(() {
        isSigned = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Contract signed successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Contract')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Expanded(
              child: SingleChildScrollView(
                child: Text(
                  '''
House Purchase Agreement

This agreement is made between the buyer and the seller.

1. The buyer agrees to purchase the house located at the agreed address.
2. The seller confirms that the house is legally owned and free of any legal issues.
3. The total purchase price is to be paid in full upon signing.
4. Both parties agree that this contract is binding.

By signing below, the buyer confirms agreement to all terms above.
                  ''',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                color: Colors.grey[200],
              ),
              child: Signature(
                controller: _controller,
                backgroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => _controller.clear(),
                  child: const Text('Clear'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _confirmSignature,
                  child: const Text('Confirm Signature'),
                ),
              ],
            ),
            if (isSigned)
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Contract signed successfully!',
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
