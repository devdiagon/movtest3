import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movtest3/views/director_view.dart';
import 'package:movtest3/views/payment_view.dart';

void main() {
  testWidgets(
    'Navega a PaymentView al ingresar alumnos y presionar Calcular',
        (WidgetTester tester) async {

      await tester.pumpWidget(
        const MaterialApp(
          home: DirectorView(),
        ),
      );

      // Verifica que estamos en DirectorView
      expect(find.text('Director - Viaje de estudios'), findsOneWidget);

      // Ingresa número de alumnos
      await tester.enterText(
        find.byType(TextField),
        '50',
      );

      // Presiona el botón Calcular
      await tester.tap(find.text('Calcular'));
      await tester.pumpAndSettle();

      // Verifica navegación a PaymentView
      expect(find.byType(PaymentView), findsOneWidget);
      expect(find.text('Detalle de pago'), findsOneWidget);
    },
  );
}
