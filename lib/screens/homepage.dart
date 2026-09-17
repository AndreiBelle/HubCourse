import 'package:flutter/material.dart';
import 'package:project_mobile/components/menuDrawer.dart';
import 'package:project_mobile/screens/registerstudent.dart';
import 'calculator.dart';
import 'galerycourse.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bem-vindo!"),
        backgroundColor: Colors.green,
      ),
      drawer: MenuDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            const Text(
              "Portal do Aluno",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text("Escolha uma opção no menu abaixo:"),
            const SizedBox(height: 20),

            // Card 1: Calculadora
            Card(
              child: ListTile(
                leading: const Icon(Icons.calculate, color: Colors.blue),
                title: const Text("Calculadora"),
                subtitle: const Text("Fazer cálculos simples"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CalculadoraPage(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),

            Card(
              child: ListTile(
                leading: const Icon(Icons.person_add, color: Colors.orange),
                title: const Text("Cadastro de Aluno"),
                subtitle: const Text("Cadastrar novos dados"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CadastroAlunoPage(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),

            Card(
              child: ListTile(
                leading: const Icon(Icons.book, color: Colors.purple),
                title: const Text("Galeria de Cursos"),
                subtitle: const Text("Ver cursos disponíveis"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CursosPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}