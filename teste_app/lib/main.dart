import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Frases.dart';
void main() {
  runApp(MaterialApp(
    home: Frases(),
  )); //MaterialApp
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String saida = "";
  double calculo = 0;
  double alcool;
  double gasolina;
  TextEditingController txtAlcool = TextEditingController();
  TextEditingController txtGasolina= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
                child: Image.asset("imgs/img.jpg", height: 200,)
          ),
          Text(""),
          Padding(
            padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: const EdgeInsets.only(right: 20, left: 20),
                  child: Text("Qual a melhor opcao para abastecer seu carro?",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),),
                ),

          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 300.0,
              child: TextField(
                controller: txtAlcool,
                decoration: InputDecoration(
                  hintText: "Informe o preço do alcool Ex: 1.59",
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 300.0,
              child: TextField(
                controller: txtGasolina,
                decoration: InputDecoration(
                  hintText: "Informe o preço da gasolina Ex: 1.59",

                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 300,
              child: RaisedButton(onPressed: (){
                setState(() {
                  alcool = double.parse(txtAlcool.text);
                  gasolina = double.parse(txtGasolina.text);
                  calculo = alcool/gasolina;
                  if (calculo>0.8 ){
                    saida = ("Abasteça com gasolina");
                  }
                  else {
                    saida = ("Abasteça com álcool ");
                  }
                });
              },
              child: Text("Calcular", style: TextStyle(fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),),
                color: Colors.blue,
              ),
            ),
          ),
          Text(saida),
        ],
      ),
    );
  }
}

