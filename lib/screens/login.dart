import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:my_app/cubit/auth_cubit.dart';
import 'package:my_app/dto/login.dart';
import 'package:my_app/main.dart';
import 'package:my_app/services/data_services.dart';
import 'package:my_app/utils/constants.dart';
import 'package:my_app/utils/secure_storage_util.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatefulWidget {
  @override
  _LoginAppState createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void sendLogin(BuildContext context) async {
    final email = _emailController.text;
    final password = _passwordController.text;

    final response = await DataService.sendLoginData(email, password);
    if (response.statusCode == 200) {
      debugPrint("sending success");
      final data = jsonDecode(response.body);
      final loggedIn = Login.fromJson(data);
      await SecureStorageUtil.storage
          .write(key: tokenStoreName, value: loggedIn.accessToken);
      debugPrint(loggedIn.accessToken);

      // Navigate to HomeScreen after successful login
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage(title: 'home screen')),
      );
    } else {
      debugPrint("failed");
      // Show error message if login fails
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Login failed. Please check your credentials.'),
        duration: Duration(seconds: 3),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: Image.asset(
                    'assets/images/cd.jpg',
                    height: 200, // Adjust the height as needed
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          border: InputBorder.none,
                          icon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Username';
                          }
                          return null;
                        },
                      ),
                      Divider(),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: InputBorder.none,
                          icon: Icon(Icons.lock),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Perform login functionality here
                      sendLogin(context);
                    }
                  },
                  child: Text('Sign In'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
