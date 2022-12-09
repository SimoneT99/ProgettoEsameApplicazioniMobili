import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * Finestra di dilogo (aka finestra pop-up)
 */

class ShowAlert extends StatefulWidget{ //questa (per ora) deve solo inizializzare lo stato
  @override
  State<StatefulWidget> createState() {
    return ShowAlertState();
  }
}

class ShowAlertState extends State{

  bool? _checboxValue = false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar : AppBar(
        title: Text("Alert dialog")
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Show alert"),
          onPressed: (){
              showAlert(); //qui diciamo che funzione chiamare
              //se vedi lezione 10 fa un esempio per far ritornare un valore alla finestra
              //di alert in base al bottone premuto da parte dell'utente
            }
          )
        )
      );
    }

  void showAlert(){
    showDialog(
        context: context,
        barrierDismissible: false, //questo serve a fare in modo che la finestra non sia chiudibile premendo fuori dalla finestra
        builder: (BuildContext context){
          return  AlertDialog(
            title: Text("Alert dialog"),
            content: Text("Dialog Message"),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.of(context).pop(); //togliamo dalla visualizzazione la finestra di popup!
                  },
                  child: Text("OK")
              )
            ],
          );
         },
    );
  }
}


/**
 * Snack bar
 */

class Snack_Bar extends StatefulWidget{ //questa (per ora) deve solo inizializzare lo stato
  @override
  State<StatefulWidget> createState() {
    return SnackBarState();
  }
}

class SnackBarState extends State{

  bool? _checboxValue = false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar : AppBar(
            title: Text("Snack Bar")
        ),
        body: Center(
            child: ElevatedButton(
                child: Text("Snack bar"),
                onPressed: (){
                  showSnackBar();
                }
            )
        )
    );
  }

  void showSnackBar(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.grey[800],
        content: Text("Button pressed"),
        duration: Duration(seconds: 4),
        action: SnackBarAction(
          label: "OK",
          onPressed: (){
            print("Ok pressed");
          },
        )
      )
    );
  }

}

/**
 * Styling delle applicazioni:
 *  1) Definire un tema base dell applicazione per garantire una coerenza
 *    -Si definisce attraverso il campo "theme" in material app come istanza della classe ThemeData(), il problema
 *      è che questo è il tema di default...
 *            ... per cambiarlo bisogna passare per il campo colorScheme:
 *
 *            MaterialApp(
 *              theme: ThemeData(
 *                colorScheme: ThemeData().colorSchema.copyWith(  //questo si fa quando si lavora con i temi, si copia in modo da mantenere la coerenza in caso di cambiamenti consecutivi
 *                  primary: Colors.green,
 *                  secondary: Colors.greenAccent,
 *                  background: Colors.amber        //non è il colore del background ma è quello degli elementi
 *                                                  //interagibili che hanno un background (per esempio le slidebar)
 *                )
 *              )
 *
 * Un campo di ThemeData permette di definire il tema degli elementi di testo :
 *
 *      textTheme: TextTheme(
 *        headline6: TextStyle(
 *          fontSize: 32,
 *          fontStyle: FontStyle.italic,
 *          ),
 *        ),
 *
 *
 * è possibile creare un tema per la gerarchia che permette poi a tutti i sottoelementi di avere tale tema
 * vedi lezione per approfondire!
 */

/**
 * ListView
 */

class List_view extends StatefulWidget{ //questa (per ora) deve solo inizializzare lo stato
  @override
  State<StatefulWidget> createState() {
    return SnackBarState();
  }
}

class ListViewState extends State{

  bool? _checboxValue = false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar : AppBar(
            title: Text("Snack Bar")
        ),
        body: ListView( //ci sono 4 costruttori di list view, in genere si usa quello base ma altri possono essere più efficienti a livello di utilizzo di memoria
          children: [
            ListTile(
              title: Text("Item 1"),
              ),
            ListTile(
              title: Text("Item 2"),
            ),
            ListTile(
              title: Text("Item 3"),
            )
            ]
          )
    );
  }