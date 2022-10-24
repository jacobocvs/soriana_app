import 'package:flutter/material.dart';
import 'package:soriana_app/screens/boton_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _loggingIn = false;
  static const _token = 'token';
  TextEditingController tokenController = TextEditingController();
  TextEditingController sucursalController = TextEditingController();

  void initState() {
    super.initState();
    _getToken;
  }

  Future<String> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_token).toString();
  }

  Future _setToken(String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(_token, tokenController.text.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panic Button'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 80),
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
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.only(top: 80, left: 24, right: 24),
          child: Column(
            children: [
              TextField(
                  controller: sucursalController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      labelText: 'Sucursal')),
              TextField(
                controller: tokenController,
                decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    labelText: 'token'),
              ),
              TextButton(
                  onPressed: () {
                    _setToken;
                    _getToken;
                    print('${_token.toString()}');
                  },
                  child: Text('Guardar')),
            ],
          ),
        ),
      ),
    );
  }

  void _login() async {
    if (_loggingIn == false) {
      null;
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const BotonScreen()));
    }
  }
}
