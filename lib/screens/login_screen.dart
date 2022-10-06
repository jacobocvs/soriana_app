import 'package:flutter/material.dart';
import 'package:soriana_app/screens/boton_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soriana_app/screens/prefs_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _loggingIn = false;
  TextEditingController? _tokenController;
  String? _token = '';

  @override
  void initState() {
    super.initState();
    _tokenController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    _tokenController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panic Button'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PrefsScreen()));
              },
              icon: Icon(Icons.settings))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 80, left: 24, right: 24),
          child: Column(children: [
            TextButton(
              onPressed: _login,
              child: const Text(
                ('Iniciar sesión'),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  void _login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _loggingIn = true;
    });
    _token = prefs.getString('key');
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const BotonScreen()));
  }
}
