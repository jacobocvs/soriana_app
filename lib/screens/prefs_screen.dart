import 'package:flutter/material.dart';

class PrefsScreen extends StatelessWidget {
  const PrefsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings'),),
        body: Container(
      padding: EdgeInsets.only(top: 80, left: 24, right: 24),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              labelText: 'Sucursal'
            ),
          ),
          TextField(
            decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                labelText: 'token'
            ),
          ),
        ],
      ),
    ));
  }
}
