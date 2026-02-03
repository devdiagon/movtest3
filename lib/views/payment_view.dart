import 'package:flutter/material.dart';
import '../utils/director_utils.dart';

class PaymentView extends StatelessWidget {
  final TripResult result;

  const PaymentView({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle de pago')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Número de alumnos: ${result.students}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Text('Costo por alumno: \$${result.costPerStudent.toStringAsFixed(2)}'),
            Text('Renta del autobús: \$${result.busCost.toStringAsFixed(2)}'),
            const Divider(height: 30),
            Text(
              'Costo total: \$${result.totalCost.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
