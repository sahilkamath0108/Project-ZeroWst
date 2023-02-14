import 'package:flutter/material.dart';

class UnverifiedProviderPage extends StatefulWidget {
  const UnverifiedProviderPage({Key? key}) : super(key: key);

  @override
  State<UnverifiedProviderPage> createState() => _UnverifiedProviderPageState();
}

class _UnverifiedProviderPageState extends State<UnverifiedProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("You are yet to be verified"),),
    );
  }
}
