import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  final String? errortxt;

  const AppError({this.errortxt});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: null != errortxt && errortxt!.isNotEmpty,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          "$errortxt",
          style: const TextStyle(
            color: Colors.red,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
