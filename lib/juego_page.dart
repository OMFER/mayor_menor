import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mayor_menor/function/evaluar.dart';
import 'package:mayor_menor/provider/provider.dart';
import 'package:provider/provider.dart';

class JuegoPage extends StatelessWidget {
  JuegoPage({super.key, required this.title});
  final String title;

  late final int intento;

  final _controller = TextEditingController();

  /*@override
  void initState() {
    intento = 0;
    //_controller.text = '0';
    sing.find = numGenerador(sing.currentNivel);
    _habilitado = false;
    super.initState();
  }*/
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ListasProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(title.toUpperCase())),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(//intentos
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(//Candidato
                      flex: 2,
                      child: Container(
                        margin:const EdgeInsets.only(left: 20, bottom: 10, right: 10, top: 10),
                        child: TextField(
                          //initialValue: '0',
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          controller: _controller,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,],
                          decoration: InputDecoration(
                            counterText: '',
                            //errorText: 'número invalido',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
                          ),
                          onSubmitted: (text) {
                            intento = int.parse(text);
                            evaluardor(intento, context);
                            prov.actulizar();
                            _controller.clear();    
                            //setState(() {});   
                          },
                        ),
                      ),
                    ),
                    Flexible(//Detalles de nivel
                      flex: 1,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin:const EdgeInsets.all(5),
                              child: Text('Entre 0 y ${prov.tope}'),
                            ),
                            Container(
                              margin:const EdgeInsets.all(5),
                              child: Text('Intentos restantes: ${prov.intentosRestantes}'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
               Flexible(//Titulos
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //Mayor que
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin:const EdgeInsets.all(10),
                        child:const Text('Mayor que:'),
                      ),
                    ),
                    //Menor que
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin:const EdgeInsets.all(10),
                        child:const Text('Menor que: '),
                      ),
                    ),
                    //Igual
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin:const EdgeInsets.all(10),
                        child:const Text('Final: '),
                    ))
                  ],
                ),
              ), 
              Flexible(//Mayor, menor, igual
                flex: 4,
                child: Consumer<ListasProvider>(
                  builder:(context, provider, _) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //menor
                      Flexible(
                        flex: 1,
                        child: Container(
                          margin:const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius:const BorderRadius.all(Radius.circular(3)),
                            border: Border.all(
                              width: 1,
                              color: Colors.white,
                            ),
                          ),
                          child: ListView.builder(
                            itemCount: prov.menores.length,
                            padding:const EdgeInsets.all(5),
                            itemBuilder: (BuildContext context, int index) => ListTile(title: Text('${prov.menores[index]}')),
                          )
                        )
                      ),
                      //mayor
                      Flexible(
                        flex: 1,
                        child: Container(
                          margin:const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius:const BorderRadius.all(Radius.circular(3)),
                            border: Border.all(
                              width: 1,
                              color: Colors.white,
                            ),
                          ),
                          child: ListView.builder(
                            itemCount: prov.mayores.length,
                            padding:const EdgeInsets.all(5),
                            itemBuilder: (BuildContext context, int index) => ListTile(title: Text('${prov.mayores[index]}')),
                          )
                        )
                      ),
                      //acertado
                      Flexible(
                        flex: 1,
                        child: Container(
                          margin:const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius:const BorderRadius.all(Radius.circular(3)),
                            border: Border.all(
                              width: 1,
                              color: Colors.white,
                            ),
                          ),
                          child: ListView.builder(
                            itemCount: prov.fin.length,
                            padding:const EdgeInsets.all(5),
                            itemBuilder: (BuildContext context, int index) => ListTile(title: Text('${prov.fin[index]}')),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
                //dificultad
              Flexible(
                flex: 1,
                child: Slider(
                  min: 0,
                  max: 2,
                  value: prov.slider,
                  onChanged: (newvalue) {
                  prov.numGenerador(newvalue.toInt(), context);
                    prov.slider = newvalue;
                    sing.setLevel(newvalue.toInt());
                   // setState(() => sing.currentNivel = newvalue.toInt());
                    //() => sing.currentNivel = newvalue.toInt();
                  },
                  divisions: 2,
                  label: '${sing.currentNivel}',
                ),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
