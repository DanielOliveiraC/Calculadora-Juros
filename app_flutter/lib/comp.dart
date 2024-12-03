import 'package:flutter/material.dart';

class ResultadoPage extends StatelessWidget {
  final double montante1;
  final double montante2;
  final List<String> valores1;
  final List<String> valores2;

  const ResultadoPage({
    Key? key,
    required this.montante1,
    required this.montante2,
    required this.valores1,
    required this.valores2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comparação de Simulações"),
      ),
      body: SingleChildScrollView( // Torna o conteúdo rolável
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Exibe o montante final de ambas as simulações
              Text(
                'Simulação 1: Montante final: R ${montante1.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'Simulação 2: Montante final: R ${montante2.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Exibe os rendimentos mensais para a Simulação 1
              const Text(
                'Rendimentos Mensais - Simulação 1:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: valores1.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Mês ${index + 1}: R ${valores1[index]}'),
                  );
                },
              ),

              // Exibe os rendimentos mensais para a Simulação 2
              const Text(
                'Rendimentos Mensais - Simulação 2:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: valores2.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Mês ${index + 1}: R ${valores2[index]}'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
