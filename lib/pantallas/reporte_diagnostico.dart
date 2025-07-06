import 'package:flutter/material.dart';

class ReporteDiagnostico extends StatelessWidget {
  final String resultadoDiagnostico;

  const ReporteDiagnostico({super.key, required this.resultadoDiagnostico});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reporte de Diagnóstico")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Estado General", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Card(
              color: Colors.blue[100],
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(resultadoDiagnostico, style: const TextStyle(fontSize: 16)),
              ),
            ),

            const SizedBox(height: 20),
            const Text("Problemas Detectados", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Card(
              color: Colors.red[100],
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    const ListTile(
                      leading: Icon(Icons.warning, color: Colors.red),
                      title: Text("Caries en el diente superior derecho."),
                    ),
                    const ListTile(
                      leading: Icon(Icons.warning, color: Colors.red),
                      title: Text("Encías inflamadas."),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
            const Text("Recomendaciones", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Card(
              color: Colors.green[100],
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    const ListTile(
                      leading: Icon(Icons.check_circle, color: Colors.green),
                      title: Text("Consulta con un dentista especializado."),
                    ),
                    const ListTile(
                      leading: Icon(Icons.check_circle, color: Colors.green),
                      title: Text("Mejorar el cepillado y uso de hilo dental."),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Volver"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

