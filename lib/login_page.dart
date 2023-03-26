import 'package:flutter/material.dart';
import 'package:my_profile01/twitterclone.dart';
import 'package:my_profile01/stopwatch_page.dart';

import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  //static const String route = '/login';

  String title;

  LoginPage({super.key, required this.title});
  //const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _loggedin = false;
  String _name = "Pooh";
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        //automaticallyImplyLeading: false,
      ),
      body: Center(
        child: _loggedin ? _buildSuccess() : _buildLoginForm(),
      ),
    );
  }

  Widget _buildSuccess() {
    return Center(
      child: Text("Welcome $_name"),
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _formkey,
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: "Runner"),
              controller: _nameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter Value';
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Email"),
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter Value';
                }
                final regex = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                if (!regex.hasMatch(value)) {
                  return 'Not valid Email';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  setState(() {
                    _name = _nameController.text;
                    //_loggedin = true;
                    Modular.to.navigate('/stopwatchpage', arguments: _name);
                  });
                  //Modular.to.pushNamed("/stopwatchpage");
                  //Modular.to.navigate('/second/jacob');

                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => Stopwatch(title: _name)));

                  //Navigator.of(context).pushReplacement(Stopwatch.route);
                }
              },
              child: Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
