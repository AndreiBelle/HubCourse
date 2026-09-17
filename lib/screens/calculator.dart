import 'package:flutter/material.dart';
import '../components/elevateButtonComponent.dart';

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  String _visor = '0';
  double? _primeiroNumero;
  String? _operacao;
  bool _novoNumero = true;

  // Lógica dos Botões
  void _pressionarBotao(String valor) {
    setState(() {
      if (valor == 'C') {
        _limpar();
      } else if (valor == '+' || valor == '-' || valor == '×' || valor == '÷') {
        _definirOperacao(valor);
      } else if (valor == '=') {
        _calcularResultado();
      } else {
        _adicionarNumero(valor);
      }
    });
  }

  void _limpar() {
    _visor = '0';
    _primeiroNumero = null;
    _operacao = null;
    _novoNumero = true;
  }

  void _adicionarNumero(String numero) {
    if (_visor == '0' || _visor == 'Erro' || _novoNumero) {
      _visor = numero;
      _novoNumero = false;
    } else {
      _visor += numero;
    }
  }

  void _definirOperacao(String op) {
    _primeiroNumero = double.tryParse(_visor);
    _operacao = op;
    _novoNumero = true;
  }

  void _calcularResultado() {
    if (_primeiroNumero == null || _operacao == null) return;

    double segundoNumero = double.tryParse(_visor) ?? 0;
    double resultado = 0;

    switch (_operacao) {
      case '+':
        resultado = _primeiroNumero! + segundoNumero;
        break;
      case '-':
        resultado = _primeiroNumero! - segundoNumero;
        break;
      case '×':
        resultado = _primeiroNumero! * segundoNumero;
        break;
      case '÷':
      // Divisão por zero
        if (segundoNumero == 0) {
          _visor = 'Erro';
          _primeiroNumero = null;
          _operacao = null;
          _novoNumero = true;
          return;
        }
        resultado = _primeiroNumero! / segundoNumero;
        break;
    }

    // remover casas decimais
    if (resultado % 1 == 0) {
      _visor = resultado.toInt().toString();
    } else {
      _visor = resultado.toString();
    }

    _primeiroNumero = null;
    _operacao = null;
    _novoNumero = true;
  }

  @override
  Widget build(BuildContext context) {
    final List<List<String>> botoes = [
      ['7', '8', '9', '÷'],
      ['4', '5', '6', '×'],
      ['1', '2', '3', '-'],
      ['C', '0', '=', '+'],
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          // Visor da calculadora
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24.0),
              alignment: Alignment.bottomRight,
              color: Colors.grey[200],
              child: Text(
                _visor,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
              ),
            ),
          ),
          // Coluna com os botões
          Column(
            children: botoes.map((linha) {
              return Row(
                children: linha.map((texto) {
                  return Expanded(
                    child: Container(
                      height: 80,
                      margin: const EdgeInsets.all(1.0),
                      child: Elevatebuttoncomponent(
                        label: texto,
                        onPressed: () => _pressionarBotao(texto),
                        cor: Colors.transparent,
                        corTexto: Colors.black,
                      ),
                    ),
                  );
                }).toList(),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}