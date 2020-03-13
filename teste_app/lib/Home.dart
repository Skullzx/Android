import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _alcoolController = TextEditingController();
  TextEditingController _gasolinaController = TextEditingController();

  String _result = "";

  void _calcular(){
    // recuperando os valores digitados
    double _alcool = double.tryParse(_alcoolController.text);
    double _gasolina = double.tryParse(_gasolinaController.text);

    if( _alcool == null || _gasolina == null ){
      setState(() {
        this._result = "Valores inválidos. Utilize números "
            "maiores que zero ( 0 ) e utilize ponto (.) para "
            "separar as casas decimais";
      });
    } else {
      /**
       * Se o preço do álcool dividido pelo preço da gasolina
       * for maior ou igual ( >= ) a 0.7, é melhor abastecer
       * com gasolina, senão, é melhor abastecer com álcool
       * */
      if( (_alcool / _gasolina) > 0.8){
        setState(() {
          this._result = "Abasteça com gasolina";
        });
      } else {
        setState(() {
          this._result = "Abasteça com álcool";
        });
      }
      this._limparCampos();
    }
  }

  void _limparCampos(){
    this._gasolinaController.text = "";
    this._alcoolController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Alcool ou Gasolina"),),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Image.asset("img/phone.jpg"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Qual a melhor opção para abaster o seu carro?",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Informe o Preço do Alcool. Ex: 1.59"
                ),
                style: TextStyle(
                    fontSize: 18
                ),
                controller: this._alcoolController,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Informe o Preço do Gasolina. Ex: 1.59"
                ),
                style: TextStyle(
                    fontSize: 18
                ),
                controller: this._gasolinaController,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10, top: 15),
                child: RaisedButton(
                  onPressed: _calcular,
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                        fontSize: 22
                    ),
                  ),
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  this._result,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
