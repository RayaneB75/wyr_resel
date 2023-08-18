import 'package:flutter/material.dart';
import 'package:frontend/findMatch.dart';
import 'package:frontend/items.dart';

class LoginWindow extends StatelessWidget {
  const LoginWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/logo_resel.png',
          fit: BoxFit.contain,
          height: 32,
          
        ),
      ),
      body: const Center(
        child: LoginForm()
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Form(
      key: _formKey,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
    
          const Text(
            'Se connecter',
            style: TextStyle(fontSize: 30),
          ),
    
          const SizedBox(height: 120),
    
          TextFieldCustom(
            content: "Entre ton e-mail IMT Atlantique",
            controller: emailController,
            ),
          PasswordFieldCustom(
            content: "Entre ton mot de passe",
            controller: passwordController,
            ),
    
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                bool isEmpty = false;

                if (_formKey.currentState!.validate()) {
                  isEmpty = true;
                }

                if (isEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FindMatchWindow()),
                  );
                }
              },
              child: const Text('Connexion'),
            ),
          ),
        ],
      ),
    );
  }
}