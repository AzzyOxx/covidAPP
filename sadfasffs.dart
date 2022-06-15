import 'package:finalwork/home.dart';
import 'package:finalwork/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meu app",
      initialRoute: '/',
      routes: {
        '/': (context) => login(),
        '/home': (context) => home(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
    );
  }
}


import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var forbbiden = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(10)),
              SizedBox(
                //width: 300.0,
                height: 400.0,
                child: Image.asset('images/ifpilogo.png'),
              ),
              SizedBox(
                height: 70,
                child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                  controller: emailController,
                ),
              ),
              SizedBox(
                height: 70.0,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Senha',
                  ),
                  controller: passwordController,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (emailController.text == 'felipe' &&
                            passwordController.text == '1234') {
                          Navigator.pushNamed(context, '/home');
                        } else {
                          setState(() {
                            forbbiden = 'Credenciais erradas';
                          });
                        }
                      },
                      child: SizedBox(
                        height: 40.0,
                        child: Center(
                          child: Text(
                            'Entrar',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Text(
                  forbbiden,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
//Container(
//              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//              child: ElevatedButton(
//                onPressed: () {},
//                child: Padding(
//                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//                    child: Text('Entrar')),
//              ),
//            )
