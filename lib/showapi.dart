import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'detail.dart';

class ShowApi extends StatefulWidget {
  const ShowApi({Key? key}) : super(key: key);

  @override
  _ShowApiState createState() => _ShowApiState();
}

class _ShowApiState extends State<ShowApi> {
  late MenuId menuId;
  bool isDataLoaded = false;
  String errorMessage = '';

  Future<MenuId> getDataFromAPI() async {
    Uri url = Uri.parse('https://mopays.github.io/api_flutter_kim/foodmenu');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return MenuId.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('${response.statusCode}: ${response.body}');
    }
  }

  void assignData() async {
    try {
      menuId = await getDataFromAPI();
      setState(() {
        isDataLoaded = true;
      });
    } catch (error) {
      setState(() {
        errorMessage = error.toString();
        if (errorMessage == "Null") errorMessage = 'An error occurred';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    assignData();
  }

  Widget getMyRow(int index) {
    final MenuData menuData = menuId.data[index];
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Details(
                menuData: menuData,
                menuId: {},
              ),
            ),
          );
        },
        trailing: const Icon(Icons.arrow_circle_right),
        title: Text(
          menuData.id ?? '',
          style: const TextStyle(color: Colors.red),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(menuData.name ?? ''),
            Text(menuData.price ?? ''),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("menu"),
        centerTitle: true,
      ),
      body: !isDataLoaded
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : menuId.data.isNotEmpty
                  ? ListView.builder(
                      itemCount: menuId.data.length,
                      itemBuilder: (context, index) => getMyRow(index),
                    )
                  : const Center(child: Text("No data found")),
    );
  }
}

class MenuData {
  final String? id;
  final String? name;
  final String? price;
  final String? detail;
  final String? cal; 
  String? imageUrl;

  MenuData({this.id, this.name, this.price, this.detail,this.cal,this.imageUrl});

  factory MenuData.fromJson(Map<String, dynamic> json) {
        return MenuData(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      cal: json['cal'],
      detail: json['detail'],
      imageUrl: json['imageUrl'],
    );
  }
}

class MenuId {
  final String? name;
  final List<MenuData> data;

  MenuId({this.name, required this.data});

 factory MenuId.fromJson(Map<String, dynamic> json) {
  final List<MenuData> menuData = [];
  if (json.containsKey('data') && json['data'] is List) {
    for (final data in json['data']) {
      if (data is Map<String, dynamic>) {
        if (data.containsKey('imageUrl')) {
          menuData.add(MenuData.fromJson(data));
        } else {
          menuData.add(MenuData.fromJson(data));
        }
      }
    }
  }
  return MenuId(name: json['name'], data: menuData);
}
}
