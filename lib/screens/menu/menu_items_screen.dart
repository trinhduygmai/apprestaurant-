import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/app_provider.dart';

class MenuItemsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryId = ModalRoute.of(context)!.settings.arguments as String;
    final foodItems = Provider.of<AppProvider>(context).foodItems.where((item) => item.categoryId == categoryId).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('KFC', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Stack(
            children: [
              IconButton(onPressed: () => Navigator.of(context).pushNamed('/cart'), icon: Icon(Icons.shopping_cart, color: Colors.grey)),
              Positioned(
                 right: 8, top: 8,
                 child: CircleAvatar(radius: 8, backgroundColor: Colors.grey, child: Text('0', style: TextStyle(fontSize: 10, color: Colors.white))),
              )
            ],
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.logout, color: Colors.grey)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Icon(Icons.restaurant, size: 80, color: Colors.grey[300]),
                  SizedBox(height: 16),
                  Align(alignment: Alignment.centerLeft, child: Text("KFC", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.red))),
                  Align(alignment: Alignment.centerLeft, child: Text("Block 12", style: TextStyle(color: Colors.grey))),
                ],
              ),
            ),
            Divider(),
            Text("Menu", style: TextStyle(fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold)),
            Divider(),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: foodItems.length,
              itemBuilder: (ctx, i) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.restaurant_menu, size: 50, color: Color(0xFF3F51B5)),
                            SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(foodItems[i].name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red)),
                                Text(foodItems[i].description, style: TextStyle(color: Colors.orange)),
                              ],
                            ),
                            Spacer(),
                            Text('₹ ${foodItems[i].price.toInt()}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green)),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Provider.of<AppProvider>(context, listen: false).addItem(foodItems[i].id, foodItems[i].name, foodItems[i].price);
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Added to cart!'), duration: Duration(seconds: 1)));
                            },
                            child: Text('ADD TO CART', style: TextStyle(color: Colors.blue)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
