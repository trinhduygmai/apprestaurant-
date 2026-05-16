import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/app_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<AppProvider>(context);
    final items = cart.cartItems.values.toList();

    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text('Cart', style: TextStyle(color: Colors.red)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: items.length,
              itemBuilder: (ctx, i) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Expanded(child: Text(items[i].name, style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold))),
                        Row(
                          children: [
                            IconButton(onPressed: () => cart.removeOneItem(items[i].id), icon: Icon(Icons.remove, size: 16)),
                            Text('${items[i].quantity}', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                            IconButton(onPressed: () => cart.addItem(items[i].id, items[i].name, items[i].price), icon: Icon(Icons.add, size: 16, color: Colors.green)),
                          ],
                        ),
                        SizedBox(width: 8),
                        Text('₹${(items[i].price * items[i].quantity).toInt()}', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Bill Receipt", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(height: 12),
                _buildBillRow("Items Total", "₹${cart.totalAmount.toInt()}"),
                _buildBillRow("Offer Discount", "- ₹18", color: Colors.black),
                _buildBillRow("Taxes (8%)", "₹${(cart.totalAmount * 0.08).toStringAsFixed(2)}"),
                _buildBillRow("Delivery Charges", "₹30"),
                Divider(height: 24),
                _buildBillRow("Total Pay", "₹${(cart.totalAmount - 18 + (cart.totalAmount * 0.08) + 30).toStringAsFixed(2)}", isTotal: true),
                SizedBox(height: 20),
                Row(
                  children: [
                     Container(
                       padding: EdgeInsets.all(12),
                       decoration: BoxDecoration(color: Colors.red[100], borderRadius: BorderRadius.circular(5)),
                       child: Text('₹${(cart.totalAmount - 18 + (cart.totalAmount * 0.08) + 30).toStringAsFixed(2)}', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                     ),
                     SizedBox(width: 12),
                     Expanded(
                        child: ElevatedButton(
                          onPressed: () => Navigator.of(context).pushNamed('/success'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[700],
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            padding: EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: Text('Proceed To Pay', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                     )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBillRow(String label, String value, {bool isTotal = false, Color color = Colors.grey}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: isTotal ? FontWeight.bold : FontWeight.normal, color: isTotal ? Colors.black : Colors.grey[700])),
          Text(value, style: TextStyle(fontWeight: isTotal ? FontWeight.bold : FontWeight.normal, color: isTotal ? Colors.black : Colors.grey[700])),
        ],
      ),
    );
  }
}
