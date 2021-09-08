import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Dummy Product Data Here
  final List myProducts = List.generate(100, (index) {

    return {"id": index, "title": "Product \#$index", "price": index + 1};



  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Kindacode.com'),
        ),
        body: Container(
          child: ListView.builder(
            itemCount: myProducts.length,
            itemBuilder: (context, index) {

              // Display the list item
              return   Card(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: ListTile(
              leading: InkWell(
                  onTap: () {
                    setState(() {
                      // myProducts.insert(0, index);
                    });
                  },
                  child: Icon(Icons.update)),
              title: Text(myProducts[index]["title"]),
              subtitle:Text(myProducts[index]["id"].toString()),
              trailing: InkWell(
                  onTap: () {
                    setState(() {
                      myProducts.removeAt(index);
                    });
                  },
                  child: Icon(Icons.delete)),
              ),
              );
            },
          ),
        ));
  }
}