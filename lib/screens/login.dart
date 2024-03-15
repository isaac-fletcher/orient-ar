import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() 
  {
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(builder: (context) => const HomeView())
    );
  }

  @override
  Widget build(BuildContext context) 
  {
    return CupertinoPageScaffold(
      child: Column(
        children: <Widget>[
          Text('CampusQuest'),
          Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView( // Using ListView to avoid overflow on smaller devices
            shrinkWrap: true,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3, // Adjust the size to 30% of the screen height
                child: Image.asset('assets/img/static-paw-003940-c_orange_1.jpg', fit: BoxFit.contain),
              ),
              CupertinoTextField(
                controller: _usernameController,
                placeholder: 'Username',
                style: const TextStyle(color: Colors.black),
              ),
              CupertinoTextField(
                controller: _passwordController,
                placeholder: 'Password',
                style: const TextStyle(color: Colors.black),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: const Text('Sign in', style: TextStyle(color: Colors.black)),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
              ),
              const SizedBox(height: 20), 
              Center( // Wrap with Center to align to the middle
                child: GestureDetector(
                  onTap: () {
                    // Add your logic for "Forget password" here
                  },
                  child: const Text(
                    'Forget password?',
                    style: TextStyle(color: Colors.black, decoration: TextDecoration.underline),
                  ),
                ),
              ),
            ],
          ),
        ),
        ]
      )
    );
  }
}

