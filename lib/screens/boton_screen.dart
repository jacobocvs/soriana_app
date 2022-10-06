import 'package:flutter/material.dart';

class BotonScreen extends StatelessWidget {
  const BotonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Button')),
      body: Container(child: Text(' Button screen'),
      ),
    );
  }
}
