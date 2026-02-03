import 'package:flutter/material.dart';
import 'package:movtest3/utils/director_utils.dart';
import 'package:movtest3/views/payment_view.dart';

class DirectorView extends StatefulWidget {
  const DirectorView({super.key});

  @override
  State<DirectorView> createState() => _DirectorViewState();
}

class _DirectorViewState extends State<DirectorView> {
  final TextEditingController _controller = TextEditingController();

  void _calculate() {
    final int? students = int.tryParse(_controller.text);

    if (students == null || students <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ingrese un número válido de alumnos')),
      );
      return;
    }

    final result = calculateTripCost(students);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PaymentView(result: result),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Director - Viaje de estudios')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Cantidad de alumnos',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculate,
              child: const Text('Calcular'),
            ),
          ],
        ),
      ),
    );
  }
}