import 'package:api_app/showapi.dart';
import 'package:flutter/material.dart';
import 'api.dart';

class Details extends StatelessWidget {
  const Details({Key? key, required this.menuData, required Map menuId}) : super(key: key);

  final MenuData menuData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${menuData.name ?? ""}",),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom:  150.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (menuData.imageUrl != null)
                Image.network(
                  menuData.imageUrl!,
                  height: 200,
                  width: 200,
                ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  "ID: ${menuData.id ?? ""}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  "Name: ${menuData.name ?? ""}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              
              
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  "Detail: ${menuData.detail ?? ""}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right:  290.0),
                child: Text(
                  "Cal: ${menuData.cal ?? ""}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 290.0),
                child: Text(
                  "Price: ${menuData.price ?? ""}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
