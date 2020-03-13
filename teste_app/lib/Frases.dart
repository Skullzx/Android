import 'package:flutter/material.dart';
import 'dart:math';

class Frases extends StatefulWidget {
  @override
  _FrasesState createState() => _FrasesState();
}

class _FrasesState extends State<Frases> {

  var lista = [
    "Frase 1",
    "Frase 2",
    "Frase 3",
    "Frase 4",
    "Frase 5",
  ];

  String _frase = "Aperte o botão para gerar uma nova frase";

  _gerarFrase(){
    int i = Random().nextInt(lista.length);

    setState(() {
      _frase = lista[i];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Alcool ou Gasolina"),),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //Imagem
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Image.asset("img/phone.jpg"),
              ),
              //Texto Principal
              Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: Text(
                  "App de Frases Inspiradoras",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10),
                child: Text(_frase,
                    style: TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                    ),
                ),
              ),
              // Botão Gerador de frases
              Padding(
                padding: EdgeInsets.only(bottom: 10, top: 15),
                child: RaisedButton(
                  onPressed: _gerarFrase,
                  child: Text(
                    "Nova Frase",
                    style: TextStyle(
                        fontSize: 22
                    ),
                  ),
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
