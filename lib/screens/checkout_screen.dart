import 'package:flutter/material.dart';
//تعريف الشاشه
class CheckoutScreen extends StatefulWidget {
  static const routeName = '/checkout';
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}
// حاله الشاشه
class _CheckoutScreenState extends State<CheckoutScreen> {
  String selectedMethod = 'Apple Pay';

  final methods = [
    'Master Card',
    'Apple Pay',
    'Vodafone Cash',
    'PayPal',
    'Fawry',
    'InstaPay',
  ];
// تصميم الشاشه
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //العنوان
            const Text('Delivery Address', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height:8),
            const ListTile(leading: Icon(Icons.location_on), title: Text('62 High Rd, Wood Green'), subtitle: Text('London N22 6DH')),
            const SizedBox(height:12),
            // اختيار طريقه الدفع
            const Text('Payment Method', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height:8),
            ...methods.map((m) => RadioListTile<String>(
              value: m,
              groupValue: selectedMethod,
              onChanged: (v) => setState(() { selectedMethod = v!; }),
              title: Text(m),
            )).toList(),
            //المجموع
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Total:', style: TextStyle(fontSize: 18)),
                Text('£187.50', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height:12),
            SizedBox(width: double.infinity, child:
                //زر الدفع
            ElevatedButton(onPressed: () { ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Payment method: ' + selectedMethod))); }, child: const Padding(padding: EdgeInsets.symmetric(vertical:14.0), child: Text('Pay Now')))),
          ],
        ),
      ),
    );
  }
}