import 'package:base_source/data/user/model/users_list_model.dart';
import 'package:flutter/material.dart';

import 'app_title.dart';

class UserListRow extends StatelessWidget {
  final UserModel userModel;
  // var onTap;
  VoidCallback? onTap;
  UserListRow({Key? key, required this.userModel,  this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTitle(text: "${userModel.name}"),
          Text(
            "${userModel.email}",
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}