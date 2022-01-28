import 'package:base_source/app/components/app_title.dart';
import 'package:base_source/app/feature/map/views/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetailsScreen extends StatelessWidget {

  const UserDetailsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    String username = data["username"]??"";
    String name = data["name"]??"";
    String id = data["id"]??"";
    String company = data["company"]??"";
    String email = data["email"]??"";
    String phone = data["phone"]??"";
    String website = data["website"]??"";
    String address = data["city"]??"";
    String street = data["street"]??"";
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(text: username),
            const SizedBox(height: 5.0),
            Text(
              email,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 5.0),
            Text(
             phone,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 5.0),
            Text(
              website,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 5.0),
            Text(
              street,
              style: const TextStyle(color: Colors.black),
            ),
            Text(
              address,
              style: const TextStyle(color: Colors.black),
            ),
            Expanded(child: MapScreen()),
          ],
        ),
      ),
    );
  }
}