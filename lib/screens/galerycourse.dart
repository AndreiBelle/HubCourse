import 'package:flutter/material.dart';
import '../components/courseComponent.dart';

class CursosPage extends StatelessWidget {
  const CursosPage({super.key});

  final List<Map<String, String>> _cursos = const [
    {
      'nome': 'Análise e Des. de Sistemas',
      'imagem': 'assets/images/analise.png',
      'duracao': '2.5 anos',
      'descricao': 'Projeta, implementa e mantém sistemas computacionais e soluções de software para empresas.',
    },
    {
      'nome': 'Engenharia de Software',
      'imagem': 'assets/images/engenharia.png',
      'duracao': '4 anos',
      'descricao': 'Desenvolvimento de software de alta qualidade aplicando arquiteturas, processos e testes rigorosos.',
    },
    {
      'nome': 'Ciência da Computação',
      'imagem': 'assets/images/ciencias-comput.png',
      'duracao': '4 anos',
      'descricao': 'Estudo aprofundado de algoritmos, lógica, inteligência artificial e fundamentos da computação.',
    },
    {
      'nome': 'Sistemas para Internet',
      'imagem': 'assets/images/internet.png',
      'duracao': '3 anos',
      'descricao': 'Foco no desenvolvimento de aplicações web, APIs, serviços em nuvem e ecossistemas mobile.',
    }
  ];

  void _exibirDetalhesCurso(BuildContext context, Map<String, String> curso) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  height: 180,
                  width: double.infinity,
                  child: Image.asset(
                    curso['imagem'] ?? '',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Icon(Icons.school, size: 60, color: Colors.grey),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                curso['nome'] ?? '',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.access_time, color: Colors.amber, size: 20),
                  const SizedBox(width: 6),
                  Text(
                    'Duração: ${curso['duracao'] ?? ''}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Divider(),
              const SizedBox(height: 8),
              const Text(
                'Descrição do Curso:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                curso['descricao'] ?? '',
                style: const TextStyle(fontSize: 14, height: 1.4),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Cursos'),
        backgroundColor: Colors.amberAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: _cursos.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            final curso = _cursos[index];
            return CourseComponent(
              curso: curso,
              onTap: () => _exibirDetalhesCurso(context, curso),
            );
          },
        ),
      ),
    );
  }
}