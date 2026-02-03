import 'package:flutter_test/flutter_test.dart';
import 'package:movtest3/utils/capicua_utils.dart';

void main() {
  group('CapicuaUtils.esCapicua', () {
    test('retorna true cuando el número es capicúa', () {
      final resultado = CapicuaUtils.esCapicua('12321');

      expect(resultado, isTrue);
    });
  });
}