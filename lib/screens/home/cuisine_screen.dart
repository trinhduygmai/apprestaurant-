import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/app_provider.dart';

class CuisineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<AppProvider>(context).categories;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Restaurant App', style: TextStyle(color: Color(0xFFC62828))),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () => Navigator.of(context).pushNamed('/cart'),
          ),
          IconButton(
            icon: Icon(Icons.logout, color: Colors.black),
            onPressed: () => Navigator.of(context).pushReplacementNamed('/'),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Guest User"),
              accountEmail: Text("guest@example.com"),
              currentAccountPicture: CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.person)),
              decoration: BoxDecoration(color: Color(0xFFC62828)),
            ),
            ListTile(leading: Icon(Icons.home), title: Text("Home"), onTap: () {}),
            ListTile(leading: Icon(Icons.shopping_cart), title: Text("Cart"), onTap: () {}),
            ListTile(leading: Icon(Icons.settings), title: Text("Settings"), onTap: () {}),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Cuisine', style: TextStyle(fontSize: 20, color: Color(0xFFC62828), fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              itemCount: categories.length,
              itemBuilder: (ctx, i) => InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/menu_items', arguments: categories[i].id);
                },
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        categories[i].imageUrl,
                        height: 80,
                        errorBuilder: (ctx, error, stackTrace) => Icon(Icons.fastfood, size: 80, color: Colors.grey),
                      ),
                      SizedBox(height: 8),
                      Text(categories[i].name, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red[800])),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
