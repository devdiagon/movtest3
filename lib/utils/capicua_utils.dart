class CapicuaUtils {
  static bool? esCapicua(String numero) {
    final texto = numero.trim();

    final valor = int.tryParse(texto);
    if (valor == null) return null;

    if (valor < 0) return false;

    final original = valor;
    final invertido = _invertirNumero(original);

    return original == invertido;
  }

  static int _invertirNumero(int numero) {
    int original = numero;
    int invertido = 0;

    while (original > 0) {
      int resto = original % 10;
      invertido = invertido * 10 + resto;
      original = original ~/ 10;
    }

    return invertido;
  }
}