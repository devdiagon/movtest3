import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movtest3/views/number_view.dart';

void main() {
  group('NumberView', () {
    testWidgets(
      'muestra el card de resultado después de escribir un número y presionar Evaluar',
          (WidgetTester tester) async {
        // 1. Renderizar el widget dentro de un MaterialApp
        await tester.pumpWidget(const MaterialApp(home: NumberView()));

        // 2. Verificar estado inicial: el card de resultado NO existe aún
        expect(find.byIcon(Icons.check_circle_outline), findsNothing);
        expect(find.byIcon(Icons.cancel_outlined), findsNothing);

        // 3. Escribir "12321" (capicúa) en el TextField
        final textField = find.byType(TextField);
        await tester.tap(textField);
        await tester.pumpAndSettle();

        await tester.enterText(textField, '12321');
        await tester.pumpAndSettle();

        // 4. Presionar el botón "Evaluar"
        final boton = find.text('Evaluar');
        await tester.tap(boton);
        await tester.pumpAndSettle();

        // 5. Verificar que el card de resultado ahora SÍ existe.
        expect(find.byIcon(Icons.check_circle_outline), findsOneWidget);
        expect(find.text('12321', findRichText: true), findsOneWidget);
        expect(find.text('12321 SÍ es un número capicúa', findRichText: true), findsOneWidget);
      },
    );
  });
}