import 'dart:convert';
import 'package:flutter/material.dart';

// Imports dos seus componentes separados
import '../components/elevateButtonComponent.dart';
import '../components/inputComponent.dart';

class CadastroAlunoPage extends StatefulWidget {
  const CadastroAlunoPage({super.key});

  @override
  State<CadastroAlunoPage> createState() => _CadastroAlunoPageState();
}

class _CadastroAlunoPageState extends State<CadastroAlunoPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers para gerenciar os textos digitados
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();
  final TextEditingController _cursoController = TextEditingController();

  String _jsonOutput = '';

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _idadeController.dispose();
    _cursoController.dispose();
    super.dispose();
  }

  void _salvarAluno() {

    if (_formKey.currentState?.validate() ?? false) {
      Map<String, String> alunoMap = {
        'nome': _nomeController.text.trim(),
        'email': _emailController.text.trim(),
        'idade': _idadeController.text.trim(),
        'curso': _cursoController.text.trim(),
      };

      setState(() {
        _jsonOutput = jsonEncode(alunoMap);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Text("Cadastro de Aluno"),
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
                  child: SizedBox(
                    width: 450, // Largura máxima do card
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                "Formulário de Aluno",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Campo Nome
                              InputComponent(
                                controller: _nomeController,
                                label: 'Nome',
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Por favor, informe o nome!';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),

                              // Campo E-mail
                              InputComponent(
                                controller: _emailController,
                                label: 'E-mail',
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Por favor, informe o e-mail!';
                                  }
                                  if (!value.contains('@')) {
                                    return 'O e-mail deve conter @';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),

                              // input Idade
                              InputComponent(
                                controller: _idadeController,
                                label: 'Idade',
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Por favor, informe a idade!';
                                  }
                                  if (int.tryParse(value) == null) {
                                    return 'Informe um valor numérico válido!';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),

                              // Campo Curso
                              InputComponent(
                                controller: _cursoController,
                                label: 'Curso',
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Por favor, informe o curso!';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 24),

                              // Botão Salvar reutilizando seu Elevatebuttoncomponent
                              Elevatebuttoncomponent(
                                label: "Salvar",
                                onPressed: _salvarAluno,
                                cor: Colors.green,
                              ),

                              // Mostrando o json
                              if (_jsonOutput.isNotEmpty) ...[
                                const SizedBox(height: 24),
                                const Divider(),
                                const SizedBox(height: 12),
                                const Text(
                                  "JSON Gerado:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: SelectableText(
                                    _jsonOutput,
                                    style: const TextStyle(
                                      fontFamily: 'monospace',
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
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