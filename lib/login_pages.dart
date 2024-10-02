import 'package:flutter/material.dart';
import 'package:onlineshop/home_page.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

bool isLoginSuccess = true;

class _LoginPagesState extends State<LoginPages> {
  String username = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(""),
        ),
        body: Column(
          children: [
            _gambar(),
            _username(),
            _password(),
            _LoginButton(context)
          ],
        ),
      ),
    );
  }

  Widget _gambar() {
    return Container(
        padding: const EdgeInsets.all(80.0), child: Image.asset('logo.jpg'));
  }

  Widget _username() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
          hintText: 'Username anda',
          labelText: 'Username',
          contentPadding: const EdgeInsets.all(8.0),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                  color: (isLoginSuccess)
                      ? Color.fromARGB(255, 139, 133, 139)
                      : Color.fromARGB(255, 36, 227, 227))),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Color.fromARGB(255, 0, 255, 132))),
        ),
      ),
    );
  }

  Widget _password() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
      child: TextFormField(
        enabled: true,
        obscureText: true,
        onChanged: (value) {
          password = value;
        },
        decoration: InputDecoration(
          hintText: 'Password Anda',
          labelText: 'Password',
          contentPadding: EdgeInsets.all(8.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Color.fromARGB(255, 235, 27, 0))),
        ),
      ),
    );
  }

  Widget _LoginButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: (isLoginSuccess)
                ? Color.fromARGB(255, 0, 153, 255)
                : Color.fromARGB(255, 255, 0, 0)),
        onPressed: () {
          String text = "";
          if (username == "fluttermobile" && password == "flutter123") {
            setState(() {
              text = "LoginSuccess!";
              isLoginSuccess = true;
            });
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return Homepage(username: username);
            }));
          } else {
            setState(() {
              text = "LoginFailed!";
              isLoginSuccess = false;
            });
          }
          SnackBar snackBar = SnackBar(content: Text(text));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Login'),
      ),
    );
  }
}
