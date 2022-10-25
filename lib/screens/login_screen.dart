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
   String? token;
   String? suc;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  TextEditingController tokenController = TextEditingController();
  TextEditingController sucursalController = TextEditingController();

  Future _setToken() async {
    SharedPreferences prefs = await _prefs;
    await prefs.setString('token', tokenController.text.toString());
    await prefs.setString('sucursal', sucursalController.text.toString());
    setState((){
      token = tokenController.text.toString();
      suc = sucursalController.text.toString();
    });
  }

  Future<void> _getToken() async {
    SharedPreferences prefs = await _prefs;
    token = prefs.getString('token')?.toString();
    suc = prefs.getString('sucursal')?.toString();
    print(suc);
    print(token);
  }

  clearPrefs() async {
    SharedPreferences prefs = await _prefs;
    prefs.remove('token');
    prefs.remove('sucursal');
    setState(() {
      token = null;
      suc = null;
    });
  }

  @override
  void initState() {
    super.initState();
    _getToken();
  }

  sucursalWidget(){
    if (suc != null){
      return Text(suc!);
    }
    return TextFormField(
        controller: sucursalController,
        decoration: InputDecoration(
            icon: Icon(Icons.location_pin),
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            labelText: 'Sucursal'));
  }
  tokenWidget(){
    if (token != null){
      return Text(token!);
    }
    return TextFormField(
      controller: tokenController,
      decoration: InputDecoration(
          icon: Icon(Icons.token),
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          labelText: 'token'),
    );
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
              sucursalWidget(),
              tokenWidget(),
              TextButton(
                  onPressed: () {
                    _setToken();
                  },
                  child: Text('Guardar')),
              TextButton(
                  onPressed: () {
                    clearPrefs();
                  },
                  child: Text('limpiar')),
            ],
          ),
        ),
      ),
    );
  }

  void _login() async {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const BotonScreen()));
  }
}
