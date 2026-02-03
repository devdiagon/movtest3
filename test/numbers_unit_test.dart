import 'package:flutter_test/flutter_test.dart';
import 'package:movtest3/utils/capicua_utils.dart';

void main() {
  group('CapicuaUtils.esCapicua', () {
    test('retorna true cuando el número es capicúa', () {
      final resultado = CapicuaUtils.esCapicua('12321');

      expect(resultado, isTrue);
    });

    test('retorna false cuando el número no es capicúa', () {
      final resultado = CapicuaUtils.esCapicua('12345');

      expect(resultado, isFalse);
    });
  });
}