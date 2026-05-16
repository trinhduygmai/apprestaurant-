import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFFFEBEE),
        title: Text("Payment Complete", style: TextStyle(color: Colors.red, fontSize: 16)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Payment Successful", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
            SizedBox(height: 24),
            Icon(Icons.check_circle, size: 100, color: Colors.green),
            SizedBox(height: 24),
            Text("Your payment has been approved!", style: TextStyle(color: Colors.green)),
            SizedBox(height: 48),
            Text("₹ 1147.08", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blue[900])),
            SizedBox(height: 60),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                   Navigator.of(context).pushNamedAndRemoveUntil('/cuisine', (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFC62828),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: Text('Back to Home', style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
