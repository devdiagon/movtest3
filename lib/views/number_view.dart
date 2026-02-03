import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/capicua_utils.dart';

class NumberView extends StatefulWidget {
  const NumberView({super.key});

  @override
  State<NumberView> createState() => _NumberViewState();
}

class _NumberViewState extends State<NumberView> {
  final TextEditingController _controller = TextEditingController();

  /// null = sin resultado aún | true = es capicúa | false = no es capicúa
  bool? _esCapicua;

  /// true cuando el usuario presiona el botón sin texto válido
  bool _mostrarError = false;

  void _evaluar() {
    final texto = _controller.text.trim();

    if (texto.isEmpty) {
      setState(() {
        _esCapicua = null;
        _mostrarError = true;
      });
      return;
    }

    final resultado = CapicuaUtils.esCapicua(texto);

    setState(() {
      _esCapicua = resultado;
      _mostrarError = resultado == null; // null significa que no es un entero válido
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Capicúa')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ---------- Campo de texto ----------
            TextField(
              controller: _controller,
              keyboardType: const TextInputType.numberWithOptions(signed: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^-?\d*')),
              ],
              decoration: InputDecoration(
                labelText: 'Ingresa un número',
                hintText: 'Ej: 12321',
                prefixIcon: const Icon(Icons.numbers),
                border: const OutlineInputBorder(),
                errorText: _mostrarError
                    ? (_controller.text.trim().isEmpty
                    ? 'El campo no puede estar vacío'
                    : 'Solo se permiten números enteros')
                    : null,
              ),
              onChanged: (_) {
                // Limpiar errores y resultado al escribir
                if (_mostrarError || _esCapicua != null) {
                  setState(() {
                    _mostrarError = false;
                    _esCapicua = null;
                  });
                }
              },
            ),

            const SizedBox(height: 20),

            // ---------- Botón de evaluación ----------
            SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: _evaluar,
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                child: const Text('Evaluar'),
              ),
            ),

            const SizedBox(height: 32),

            // ---------- Mensaje de resultado ----------
            if (_esCapicua != null) _buildResultado(),
          ],
        ),
      ),
    );
  }

  /// Construye el card con el mensaje según el resultado.
  Widget _buildResultado() {
    final esCap = _esCapicua!;
    final numero = _controller.text.trim();

    return AnimatedOpacity(
      opacity: 1.0,
      duration: const Duration(milliseconds: 300),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: esCap ? Colors.green.shade100 : Colors.red.shade100,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: esCap ? Colors.green.shade400 : Colors.red.shade400,
            width: 1.5,
          ),
        ),
        child: Column(
          children: [
            Icon(
              esCap ? Icons.check_circle_outline : Icons.cancel_outlined,
              size: 48,
              color: esCap ? Colors.green.shade700 : Colors.red.shade700,
            ),
            const SizedBox(height: 10),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey.shade800,
                ),
                children: [
                  TextSpan(
                    text: numero,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: esCap
                        ? ' SÍ es un número capicúa'
                        : ' NO es un número capicúa',
                    style: TextStyle(
                      fontWeight: esCap ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}