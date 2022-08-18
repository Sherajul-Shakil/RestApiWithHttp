import 'package:flutter/material.dart';
import 'package:rest_api_example/getApi/simple_json_with_model.dart';
import 'package:rest_api_example/postApi/registration_login.dart';

import '../getApi/complex_json_with_model.dart';
import '../getApi/complex_json_without_model.dart';
import '../getApi/simple_json_without_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SimpleJsonWithModel()),
                    );
                  },
                  child: Text("Simple JSON with Model")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SimpleJsonWithoutModel()),
                    );
                  },
                  child: Text("Simple JSON Without Model")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ComplexJsonWithModel()),
                    );
                  },
                  child: Text("Simple JSON Without Model")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ComplexJsonWithoutModel()),
                    );
                  },
                  child: Text("Simple JSON Without Model")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  child: Text("register & Login")),
            ],
          ),
        ),
      ),
    );
  }
}
