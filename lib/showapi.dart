import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ShowApi extends StatefulWidget {
  const ShowApi({Key? key}) : super(key: key);

  @override
  _ShowApiState createState() => _ShowApiState();
}

class _ShowApiState extends State<ShowApi> {
  late MenuId menuId;
  bool isDataLoaded = false;
  String errorMessage = '';

  Future<MenuId> getDataFromAPI() async{
    Url url = Url.parse('');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("menu"),
        centerTitle: true,
      ),
      body: !isDataLoaded ? const Center(child: CircularProgressIndicator()) : errorMessage.isNotEmpty ? Center(child: Text(errorMessage),): MenuId.data.isNotEmpty ? ListView.builder(itemBuilder: MenuId.data.length, itemBuilder: (context, index) => getMyRow{index}) :const Center(child: Text("No data found")),
    );
  }
}

class MenuId {
  final String? name;
  final List<Map<String, dynamic>> data;

  MenuId({this.name, required this.data});

  factory MenuId.fromJson(Map<String, dynamic> json) {
    final List<Map<String, dynamic>> MenuData = [];
    if (json.containsKey('data') && json['data'] is List) {
      for (final data in json['data']) {
        if (data is Map<String, dynamic>) {
          MenuData.add(data);
        }
      }
    }
    return MenuId(name: json['name'], data: MenuData);
  }
}
