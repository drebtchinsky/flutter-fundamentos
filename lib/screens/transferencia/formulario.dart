import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transferência';

const _labelCampoNumeroConta = 'Número da conta';
const _hintCampoNumeroConta = '0000';

const _labelCampoValor = 'Valor';
const _hintCampoValor = '0.00';

const _textButtonConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Editor(
              controlador: _controladorCampoNumeroConta,
              dica: _hintCampoNumeroConta,
              rotulo: _labelCampoNumeroConta,
            ),
            Editor(
              dica: _hintCampoValor,
              controlador: _controladorCampoValor,
              rotulo: _labelCampoValor,
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
              child: Text(_textButtonConfirmar),
              onPressed: () => _criaTransferencia(context),
            )
          ],
        )));
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      Navigator.pop(
        context,
        Transferencia(valor, numeroConta),
      );
    }
  }
}
