import 'package:flutter_test/flutter_test.dart';
import 'package:movtest3/utils/director_utils.dart';

void main() {
  group('calculateTripCost', () {
    test('100 alumnos o más: costo por alumno = 65', () {
      final result = calculateTripCost(120);

      expect(result.costPerStudent, 65);
      expect(result.totalCost, 120 * 65);
    });

    test('Entre 50 y 99 alumnos: costo por alumno = 70', () {
      final result = calculateTripCost(75);

      expect(result.costPerStudent, 70);
      expect(result.totalCost, 75 * 70);
    });

    test('Entre 30 y 49 alumnos: costo por alumno = 95', () {
      final result = calculateTripCost(40);

      expect(result.costPerStudent, 95);
      expect(result.totalCost, 40 * 95);
    });

    test('Menos de 30 alumnos: renta fija de 4000', () {
      final result = calculateTripCost(20);

      expect(result.totalCost, 4000);
      expect(result.busCost, 4000);
    });

    test('Lanza excepción si alumnos <= 0', () {
      expect(
            () => calculateTripCost(0),
        throwsException,
      );
    });
  });
}
