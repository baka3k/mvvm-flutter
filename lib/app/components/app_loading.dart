import 'package:flutter/cupertino.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: const CupertinoActivityIndicator(),
      ),
    );
  }
}