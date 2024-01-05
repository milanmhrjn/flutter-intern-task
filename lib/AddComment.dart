import 'package:flutter/material.dart';
import 'package:taskapp/services/api_services.dart';

class AddComment extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Comment"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "name"),
                controller: nameController,
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "email"),
                controller: emailController,
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "body"),
                controller: bodyController,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () async {
                    String name = nameController.text;
                    String email = emailController.text;
                    String body = bodyController.text;
                    addComments(name, email, body);
                  },
                  child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}
