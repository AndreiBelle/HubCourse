import 'package:flutter/material.dart';
import 'package:project_mobile/screens/loadingpage.dart';

import 'components/elevateButtonComponent.dart';
import 'components/inputComponent.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String user = 'admin@email.com';
  String password = 'admin123';

  String _jsonoutput = '';

  void _validaSenha() {
    if(_formKey.currentState?.validate() ?? false) { //valida se estão preenchidos

      if(_emailController.text == user && _passwordController.text == password) {
        Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => LoadingPage(), //envia o usuário para a tela de carregamento
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('E-mail ou senha incorretos!'),
            backgroundColor: Colors.red,
          ),
        );
      }
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Text("Form"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  // Limita a largura máxima do formulário
                  child: SizedBox(
                    width: 400,
                    child: Card(
                      elevation: 4, // Sombra suave
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min, // ocupa apenas a altura necessaria
                            children: [
                              const Text(
                                "Entrar",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              InputComponent(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                obscureText: false,
                                label: 'E-mail',
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Por favor, informe um e-mail!';
                                  }
                                  if (!value.contains('@')) {
                                    return 'Informe um e-mail válido com @';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),
                              InputComponent(
                                controller: _passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                label: 'Senha',
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Por favor, informe a senha!';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 24),
                              Elevatebuttoncomponent(
                                label: "Salvar",
                                onPressed: _validaSenha,
                                cor: Colors.green,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}