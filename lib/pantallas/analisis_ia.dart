import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:math';
import 'reporte_diagnostico.dart';

class AnalisisIA extends StatelessWidget {
  final String imagenPath;
  AnalisisIA({super.key, required this.imagenPath});

  final List<String> diagnosticos = [
    "✅ No se encontraron problemas.",
    "⚠️ Caries detectadas en el diente superior derecho.",
    "⚠️ Encías inflamadas, posible inicio de gingivitis.",
  ];

  @override
  Widget build(BuildContext context) {
    String diagnostico = diagnosticos[Random().nextInt(diagnosticos.length)];

    return Scaffold(
      appBar: AppBar(title: const Text("Resultado del Análisis")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imagenPath.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(10),
                child: Image.file(File(imagenPath), width: 250), // Reduje el tamaño de la imagen
              ),
            const SizedBox(height: 20),
            Card(
              color: Colors.blue[100],
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(diagnostico, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReporteDiagnostico(resultadoDiagnostico: diagnostico),
                  ),
                );
              },
              child: const Text("Ver Reporte Completo"),
            ),
          ],
        ),
      ),
    );
  }
}
