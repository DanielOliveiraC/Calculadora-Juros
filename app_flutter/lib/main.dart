import 'package:app_flutter/comp.dart';
import 'package:flutter/material.dart';

void main() => runApp(const CalculadoraJurosApp());

class CalculadoraJurosApp extends StatelessWidget {
  const CalculadoraJurosApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const CalculadoraJurosPage(title: 'Calculadora 2000 2.0'),
    );
  }
}

/// Página principal da Calculadora de Juros Compostos
class CalculadoraJurosPage extends StatefulWidget {
  const CalculadoraJurosPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State createState() => _CalculadoraJuros();
}

class _CalculadoraJuros extends State {

  // Valores de Entrada
  final capitalController = TextEditingController();
  final capitalController2 = TextEditingController();
  final aplicacaoMensallControler = TextEditingController();
  final aplicacaoMensallControler2 = TextEditingController();
  final mesesController = TextEditingController();
  final mesesController2 = TextEditingController();
  final taxaaJurosMesController = TextEditingController();
  final taxaaJurosMesController2 = TextEditingController();
  

  // Valores Armazenados
  late double capital = 0.0;
  late double aplicacaoMensal = 0.0;
  late int meses = 0;
  late double taxaJurosMes = 0.0;
  late double rendimentoMensal = 0.0;
  late double rendimentoFinal = 0.0;
  late double montante = 0.0;

  late double capital2 = 0.0;
  late double aplicacaoMensal2 = 0.0;
  late int meses2 = 0;
  late double taxaJurosMes2 = 0.0;
  late double rendimentoMensal2 = 0.0;
  late double rendimentoFinal2 = 0.0;
  late double montante2 = 0.0;

  // Valores Gerados
  List valorRendimentos = [];

  List<String> valores = [];
  List<String> valores2 = [];

  late String dados;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora 2000 2.0", style: TextStyle(color: Color.fromARGB(185, 0, 17, 253)),),
      ),
      body: Column(
        children: [
          // Campo para inserir o investimento inicial
          _campoTexto(
            controller: capitalController,
            label: 'Investimento inicial',
          ),

          // Campo para inserir a aplicação mensal
          _campoTexto(
            controller: aplicacaoMensallControler,
            label: 'Aplicação Mensal',
          ),

          // Campo para inserir o período em meses
          _campoTexto(
            controller: mesesController,
            label: 'Período em meses',
          ),

          // Campo para inserir a taxa de juros mensal
          _campoTexto(
            controller: taxaaJurosMesController,
            label: 'Rentabilidade Mês (%)',
          ),
          
           // Entradas para a Simulação 2
          _campoTexto(
            controller: capitalController2,
            label: 'Investimento inicial (Simulação 2)',
          ),
          _campoTexto(
            controller: aplicacaoMensallControler2,
            label: 'Aplicação Mensal (Simulação 2)',
          ),
          _campoTexto(
            controller: mesesController2,
            label: 'Período em meses (Simulação 2)',
          ),
          _campoTexto(
            controller: taxaaJurosMesController2,
            label: 'Rentabilidade Mês (%) (Simulação 2)',
          ),

          Padding(padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ElevatedButton(onPressed: _calcularJurosCompostos, child: const Text("Calcular")),
          ),
          // Exibir montante total
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                montante == 0
                    ? "Insira os dados para calcular"
                    : "Montante final: R ${montante.toStringAsFixed(2)}",
              ),
            ),
          ),

          // Rendimentos mes a mes
          Expanded(
            child: ListView.builder(
              itemCount: valores.length,
              itemBuilder: (context, index) {
                final rendimento = valores[index];
                final mes = index + 1;
                return ListTile(
                  title: Text('Mês R$rendimento'),
                );
              },
            ),
          ),

        ],
      ),
    );
  }

  // Função para criar um campo de texto reutilizável
  Widget _campoTexto({required TextEditingController controller, required String label}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(hintText: label),
          keyboardType: TextInputType.number, // Apenas números
        ),
      ),
    );
  }

  // Calcular os Juros
  void _calcularJurosCompostos() {
    // Captura e converte os valores digitados
    capital = double.parse(capitalController.text);
    aplicacaoMensal = double.parse(aplicacaoMensallControler.text);
    meses = int.parse(mesesController.text);
    taxaJurosMes = double.parse(taxaaJurosMesController.text) / 100; // Converte para percentual


    // Calcula os resultados para a Simulação 1
    valores.clear();
    for (int i = 0; i < meses; i++) {
      rendimentoMensal = capital * taxaJurosMes;
      rendimentoFinal += rendimentoMensal;
      montante = capital + rendimentoMensal;
      capital += rendimentoMensal + aplicacaoMensal;
      valores.add(rendimentoMensal.toStringAsFixed(2));
    }

    // Captura os valores para a Simulação 2
    capital2 = double.parse(capitalController2.text);
    aplicacaoMensal2 = double.parse(aplicacaoMensallControler2.text);
    meses2 = int.parse(mesesController2.text);
    taxaJurosMes2 = double.parse(taxaaJurosMesController2.text) / 100;

    // Calcula os resultados para a Simulação 2
    valores2.clear();
    for (int i = 0; i < meses2; i++) {
      rendimentoMensal2 = capital2 * taxaJurosMes2;
      rendimentoFinal2 += rendimentoMensal2;
      montante2 = capital2 + rendimentoMensal2;
      capital2 += rendimentoMensal2 + aplicacaoMensal2;
      valores2.add(rendimentoMensal2.toStringAsFixed(2));
    }



    // Limpa os dados anteriores
    rendimentoFinal = 0.0;
    montante = 0.0;
    valores.clear();

    // Realiza os cálculos para cada mês
    for (int i = 0; i < meses; i++) {
      rendimentoMensal = capital * taxaJurosMes;
      rendimentoFinal += rendimentoMensal;
      montante = capital + rendimentoMensal;

      // Adiciona a aplicação mensal ao capital
      capital += rendimentoMensal + aplicacaoMensal;

      // Armazena os rendimentos para exibição
      valores.add(rendimentoMensal.toStringAsFixed(2));
    }

    // Atualiza a interface com os novos valores
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultadoPage(
          montante1: montante,
          montante2: montante2,
          valores1: valores,
          valores2: valores2,
        ),
      ),
    );
  }
}

