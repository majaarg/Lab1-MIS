import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clothing App',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Map<String, String>> clothingItems = [
    {
      "name": "Dress",
      "image": "https://pngimg.com/image/56058",
      "description": "An everyday casual dress.",
      "price": "\$22"
    },
    {
      "name": "Pants",
      "image": "https://www.ebay.co.uk/itm/314999976433",
      "description": "Classic office pants.",
      "price": "\$46"
    },
    {
      "name": "Jacket",
      "image": "https://www.pinterest.com/pin/levis--508766089159790824/",
      "description": "Warm winter cozy jacket.",
      "price": "\$100"
    },
    {
       "name": "Pullover-Hoodie",
       "image": "https://www.getshirts.de/index.php?page=artikel&id=417525",
       "description": "Soft, comfortable hoodie",
       "price": "\$35"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('203003'),
      ),
      body: ListView.builder(
        itemCount: clothingItems.length,
        itemBuilder: (context, index) {
          final item = clothingItems[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.network(item['image']!),
              title: Text(item['name']!),
              subtitle: Text(item['price']!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CardDetails(item: item),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class CardDetails extends StatelessWidget {
  final Map<String, String> item;

  CardDetails({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['name']!),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(item['image']!),
            SizedBox(height: 16),
            Text(
              item['name']!,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              item['description']!,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              item['price']!,
              style: TextStyle(fontSize: 18, color: Colors.yellow),
            ),
          ],
        ),
      ),
    );
  }
}