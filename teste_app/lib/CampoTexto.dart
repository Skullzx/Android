import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {

  TextEditingController _textEditingController = TextEditingController();
  bool _checkBox = false;
  bool _checkBoxList = false;
  bool _checkBoxList2 = false;
  String _escolhaRadio;
  String _escolhaRadio2;
  bool _switch = false;
  bool _switchTile1 = false;
  bool _switchTile2 = false;
  double _slider = 3;

  List classificacao = [
    "Péssimo",
    "Ruim",
    "Normal",
    "Bom",
    "Muito Bom",
    "Excelente",
  ];
  String _label = "Normal";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de Dados"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            /**TextField*/
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                /**
                 * TextInputType.text => Para campos de Texto
                 * TextInputType.number => Para campos de números
                 * TextInputType.datetime => Para campos de data ou hora
                 * TextInputType.emailAddress => Para campos de email
                 * */
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  // label do Input
                  labelText: "Nome",
                  // Helper do Input
                  helperText: "Informe um valor!",
                  // Cor do input quando ele estiver em foco
                  focusColor: Colors.red,
                ),
                // Quantidade máxima de caracteres
                maxLength: 11,
                /**
                 * Permite que o usuário digite uma quantidade maior de
                 * caracteres definida na propriedade 'maxLength', porém,
                 * deixa o campo com status de erro caso seja passado
                 * false
                 * */
                maxLengthEnforced: true,
                // Se está habilitado ou não para ser editado
                enabled: true,
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.blue
                ),
                /**
                 * Faz com o que o campo de texto tenha o padrão de senha
                 * escondendo os caracteres que foram digitados
                 * */
                obscureText: true,
                /**
                 * Métodos que são utilizados para recuperar o que foi
                 * digitado pelo usuário.
                 *
                 * Todos os métodos abaixo retorna uma função anônima
                 * que deve possuir uma String como tipo de retorno:
                 *
                 * o método onChanged irá sempre ser chamado quando
                 * houver qualquer tipo de alteração no conteúdo do
                 * TextField
                 * onChanged: (String evt) {print(evt);}
                 *
                 * o método onSubmitted irá ser chamado quando o usuário
                 * clicar no botão de enviar, ou de terminar de preencher
                 * o campo TextField. Assim como o método onChanged, ele
                 * deve chamar uma função anônima que retorna uma String
                 * onSubmitted: (String evt){print(evt);}
                 * */
                onSubmitted: (String evt) {},
                controller: _textEditingController,
              ),
            ),

            /**Checkbox*/
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Text("Texto do checkbox"),
                  Checkbox(
                    /**
                     * A propriedade value do checkbox é a propriedade
                     * que diz qual o valor inicial do checkbox. Se for
                     * true, ele virá selecionado por padrão,
                     * caso seja false, ele não virá selecionad.
                     * */
                    value: _checkBox,
                    /**
                     * Assim como no TextField, o método onChanged é chamado
                     * sempre que houver alguma alteração no componente.
                     * */
                    onChanged: (bool value){
                      print("Checkbox: " + value.toString());
                      setState(() {
                        _checkBox = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            /**CheckboxListTile*/
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  CheckboxListTile(
                    value: _checkBoxList,
                    onChanged: (bool value){
                      setState(() {
                        print("Checkbox 1: " + value.toString());
                        this._checkBoxList = value;
                      });
                    },
                    /**Título que será exibido no Checkbox*/
                    title: Text("Receber Notificações"),
                    /**Subtítulo que será exibido no checkbox*/
                    subtitle: Text("Irá criar uma \nnotificação\t\t Push"),
                    /**Cor do 'certo' do checkbox*/
                    checkColor: Colors.yellow,
                    /**Ícone do checkbox*/
                    secondary: Icon(Icons.bluetooth),
                    /**Cor de fundo do checkbox*/
                    activeColor: Colors.green,
                  ),
                  CheckboxListTile(
                    value: _checkBoxList2,
                    onChanged: (bool value){
                      setState(() {
                        print("Checkbox 2: " + value.toString());
                        this._checkBoxList2 = value;
                      });
                    },
                    /**Título que será exibido no Checkbox*/
                    title: Text("Checkbox List 2"),
                    /**Subtítulo que será exibido no checkbox*/
                    subtitle: Text("O Subtítulo do checkbox 2"),
                    /**Cor do 'certo' do checkbox*/
                    checkColor: Colors.green,
                    /**Ícone do checkbox*/
                    secondary: Icon(Icons.add_alarm),
                    /**Cor de fundo do checkbox*/
                    activeColor: Colors.white,
                  ),
                ],
              ),
            ),

            /**Radio Button*/
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  /**Primeiro RadioButton*/
                  Row(
                    children: <Widget>[
                      Text("Feminino"),
                      Radio(
                        value: "f",
                        groupValue: _escolhaRadio,
                        onChanged: (String escolha){
                          setState(() {
                            _escolhaRadio = escolha;
                          });
                          print("escolha: " + escolha);
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("Masculino"),
                      Radio(
                        value: "m",
                        /**
                         * O atributo 'groupValue' é utilizado para
                         * informar a qual grupo o componente Radio
                         * pertence.
                         * */
                        groupValue: _escolhaRadio,
                        /**
                         * O atriuto 'onChanged' é utilizado para informar
                         * qual o método que deve ser utilizado, ou qual
                         * o comportamento que o App deve ter quando o
                         * componente Radio for selecionado
                         * */
                        onChanged: (String escolha){
                          setState(() {
                            _escolhaRadio = escolha;
                          });
                          print("escolha: " + escolha);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            /**RadioListButton*/
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  /**
                   * A principal diferença entre os componentes Radio e
                   * RadioListTile é que enquanto para cada caomponente
                   * do tipo Radio que seja inserido no corpo da nossa
                   * aplicação, nós devemos também adicionar um texto
                   * (componente TEXT) para poder explicar qual a opção
                   * daquele Radio.
                   * Já o RadioListTile possui uma propriedade chamada
                   * 'title', que contém o texto do Radio, fazendo com que
                   * não seja necessário a utilização de outro componente
                   * para adicionar um texto
                   * */
                  RadioListTile(
                    title: Text("Masculino"),
                    subtitle: Text("Teste de Subtitulo"),
                    value: "m",
                    groupValue: _escolhaRadio,
                    onChanged: (String escolha){
                      setState(() {
                        _escolhaRadio = escolha;
                      });
                      print("Escolha do RadioList: " + escolha);
                    },
                  ),
                  RadioListTile(
                    title: Text("Feminino"),
                    value: "f",
                    groupValue: _escolhaRadio,
                    onChanged: (String escolha){
                      setState(() {
                        _escolhaRadio = escolha;
                      });
                      print("Escolha do RadioList: " + escolha);
                    },
                  ),
                ],
              ),
            ),

            /**Switch*/
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Switch(
                    value: _switch,
                    onChanged: (bool op){
                      setState(() {
                        _switch = op;
                      });
                      print("Opção do switch: " + op.toString());
                    },
                  ),
                  Text("Receber notificações (componente switch)"),
                ],
              ),
            ),
            /**SwitchListTile*/
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  /**
                   * É a mesma diferença entre os componentes Radio e
                   * RadioListTile.
                   * Ou seja, enquanto o componente SwitchListTile possui
                   * um atributo chamado 'title', que irá conter o texto
                   * daquele componente, o Switch não tem um atributo
                   * desse tipo.
                   * */
                  SwitchListTile(
                    title: Text("Receber NotificaçÕes"),
                    secondary: Icon(Icons.title),
                    value: _switchTile1,
                    onChanged: (bool op){
                      setState(() {
                        _switchTile1 = op;
                      });
                      print("Opcao do SwitchTile: " + op.toString());
                    },
                  ),
                  SwitchListTile(
                    title: Text("Upload de Imagens Automático (SwitchListTile)"),
                    secondary: Text("Texto \nno lugar \ndo ícone"),
                    value: _switchTile2,
                    onChanged: (bool op){
                      setState(() {
                        _switchTile2 = op;
                      });
                      print("Opcao do SwitchTile: " + op.toString());
                    },
                  ),
                ],
              ),
            ),

            /**Slider*/
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Slider(
                    /**
                     * A propriedade 'value', assim como nos outros
                     * componentes, é o valor inicial do slider. Ou
                     * seja, é o valor que vem por padrão no widget
                     * */
                    value: _slider,
                    /**
                     * As propriedades 'min' e 'max' são os limites
                     * inferior e superior do slider.
                     */
                    min: 0,
                    max: 5,
                    /**
                     * A propriedade 'divisions' configura a maneira com
                     * a qual eu quero dividir o slider. Ou seja, quantas
                     * partes eu quero que o slider possua.
                     * Além disso, a propriedade 'label' é utilizada em
                     * conjunto com a propriedade 'divisions'.
                     * */
                    divisions: 5,
                    label: _label,
                    /**
                     * A propriedade 'activeColors' altera a cor do slider
                     * quando for selecionado um valor
                     * */
                    activeColor: Colors.lightBlue,
                    inactiveColor: Colors.black,
                    onChanged: (double novoValor){
                      print("Valor selecionado: " + novoValor.round().toString());
                      setState(() {
                        _slider = novoValor;
//                        _label = _slider.toString();
                        _label = this.classificacao[novoValor.toInt()];
                      });
                    },
                  ),
                ],
              ),
            ),

            /**RaisedButton*/
            RaisedButton(
              child: Text("Salvar", style: TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                print("valor digitado no TextField: "
                    + _textEditingController.text);
                print("Checkbox apertado: "
                    + _checkBox.toString());
                print("CheckboxListTile 1 apertado: "
                    + _checkBoxList.toString());
                print("CheckboxListTile 2 apertado: "
                    + _checkBoxList2.toString());
                print("RadioButton selecionado: "
                    + _escolhaRadio.toString());
                print("RadioListedTile selecionado: "
                    + _escolhaRadio.toString());
                print("Switch selecionado: "
                    + _switch.toString());
                print("SwitchListTile 1 selecionado: "
                    + _switchTile1.toString());
                print("SwitchListTile 2 selecionado: "
                    + _switchTile2.toString());
                print("Slider selecionado: "
                    + _slider.round().toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}
