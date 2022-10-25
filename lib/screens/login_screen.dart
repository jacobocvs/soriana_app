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
  late String token;
  final Future <SharedPreferences> _prefs = SharedPreferences.getInstance();
  TextEditingController tokenController = TextEditingController();
  TextEditingController sucursalController = TextEditingController();


  Future<void> _setToken(token) async {
    SharedPreferences prefs = await _prefs;
    await prefs.setString('token', tokenController.text.toString());

  }

  Future<void> _getToken() async {
    SharedPreferences prefs = await _prefs;
    token = prefs.getString('token').toString();
  }


  @override
  void initState() {
    super.initState();
    _getToken();
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
                    print(token);
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
