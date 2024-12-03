import 'package:flutter/material.dart';

class ResultadoPage extends StatelessWidget {
  final double montante;
  final List<String> valores;

  const ResultadoPage({Key? key, required this.montante, required this.valores}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resultados"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Exibe o montante final
            Text(
              'Montante final: R ${montante.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Exibe os rendimentos mensais
            const Text(
              'Rendimentos mensais:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: valores.length,
                itemBuilder: (context, index) {
                  final rendimento = valores[index];
                  final mes = index + 1;
                  return ListTile(
                    title: Text('Mês $mes: R $rendimento'),
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
