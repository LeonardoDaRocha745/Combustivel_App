import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gasosa/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular() {
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasosa = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precoGasosa == null) {
      setState(() {
        _textoResultado = "Valor inválido";
      });
    } else {
      if ((precoAlcool / precoGasosa >= 0.7)) {
        setState(() {
          _textoResultado = "Gasosa";
        });
      } else {
        setState(() {
          _textoResultado = "Alcool";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alcool ou Gasolina"),
        backgroundColor: Color.fromRGBO(209, 174, 46, 1),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Image.asset(
                imgGasosa,
                width: 200,
                height: 200,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Saiba qual é a melhor opção para o abastecimento",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: "Preço do Alcool, ex:1.59"),
              style: TextStyle(
                fontSize: 18,
              ),
              controller: _controllerAlcool,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: "Preço do Gasolina, ex:2.83"),
              style: TextStyle(
                fontSize: 18,
              ),
              controller: _controllerGasolina,
            ),
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: RaisedButton(
                padding: EdgeInsets.only(
                  left: 50,
                  right: 50,
                  bottom: 10,
                  top: 10,
                ),
                child: Text(
                  "Calcular",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                color: Color.fromRGBO(209, 174, 46, 1),
                onPressed: () {
                  _calcular();
                },
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                _textoResultado,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(209, 174, 46, 1)),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
