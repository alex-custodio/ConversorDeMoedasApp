import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  String textoResultado = '';
  @override
  Widget build(BuildContext context) {
    ThemeData theme = ThemeData();
    TextEditingController moneyController = TextEditingController();
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(primary: Colors.green, secondary: Colors.red)),
      home: Scaffold(
        appBar: AppBar(
            title: Center(
          child: Text("Conversor"),
        )),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("USD\$"),
              ),
              SizedBox(
                width: 320,
                child: TextField(
                  controller: moneyController,
                  decoration: InputDecoration(
                      hintText: "Digite aqui o valor monetário",
                      border: const OutlineInputBorder(),
                      suffixIcon: Icon(Icons.attach_money)),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  child: Text("Converter"),
                  onPressed: () {
                    setState(() {
                      double valor = double.tryParse(moneyController.text) ?? 0;
                      if (valor == 0) {
                        textoResultado = "Digite um número, por favor";
                      } else {
                        textoResultado = "Em reais, seria R\$ ${(valor * 5.17).toString()}";
                      }
                    });
                  },
                ),
              ),
              Text(textoResultado)
            ],
          ),
        ),
      ),
    );
  }
}
