import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ComplexJsonWithoutModel extends StatefulWidget {
  const ComplexJsonWithoutModel({Key? key}) : super(key: key);

  @override
  _ComplexJsonWithoutModelState createState() =>
      _ComplexJsonWithoutModelState();
}

class _ComplexJsonWithoutModelState extends State<ComplexJsonWithoutModel> {
  var data;
  Future<void> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {
      print("Connection is not ok");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Api Course'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                      itemCount: data!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            children: [
                              ReusbaleRow(
                                title: 'name',
                                value: data[index]['name'].toString(),
                              ),
                              ReusbaleRow(
                                title: 'Username',
                                value: data[index]['username'].toString(),
                              ),
                              ReusbaleRow(
                                title: 'address',
                                value:
                                    data[index]['address']['street'].toString(),
                              ),
                              ReusbaleRow(
                                title: 'Latitude',
                                value: data[index]['address']['geo']['lat']
                                    .toString(),
                              ),
                              ReusbaleRow(
                                title: 'Longitude',
                                value: data[index]['address']['geo']['lng']
                                    .toString(),
                              ),
                            ],
                          ),
                        );
                      });
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class ReusbaleRow extends StatelessWidget {
  String title, value;
  ReusbaleRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
