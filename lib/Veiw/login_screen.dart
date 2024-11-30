
import 'package:flutter/material.dart';
import 'package:snapkart/Veiw/dashborad_screen.dart';
import 'package:snapkart/Veiw/signup_screen.dart';
import 'package:snapkart/comman/storge_helper.dart';
import 'package:snapkart/model/user_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final StorageHelper storageHelper = StorageHelper();

  @override
  void initState() {
    super.initState();
    _checkIfLoggedIn();
  }
  void _checkIfLoggedIn() async {
    UserModel? savedUser = await StorageHelper.getUser();
    if (savedUser != null) {

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return DashboardScreen();
      }));
    }
  }
  void _login() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    UserModel? savedUser = await StorageHelper.getUser();

    if (savedUser != null &&
        savedUser.email == email &&
        savedUser.password == password) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return DashboardScreen();
      }));

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login Successful')),
      );
    } else {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid Email or Password')),
      );
    }
  }


  void navigateToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Account..',style: TextStyle(fontSize: 30,fontStyle: FontStyle.italic,color: Colors.black),)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),style: const TextStyle(fontStyle:FontStyle.italic),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Login'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: navigateToSignUp,
              child: const Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}