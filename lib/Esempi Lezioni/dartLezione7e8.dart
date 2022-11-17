/**
 * Si riprende la lezione 6, vedere quella
 * NOTE:
 *  *)I widget possono avere dei figli
 *  *)Bisogna stare attenti a dare dei vincoli sensati, per esempio usare un column con un altro column figlio
 *      che fa un expanded causa un errore!
 */

/**
 * Un altro widget per il posizionamento dell'interfaccia: Align.
 * Sembra fare esattamente l'allineamento di center, cosa cambia?
 *    -che possiamo specificare un allineamento diverso da quello centrale.
 * Posso indicare che tutti gli elementi al di sotto nella gerarchia siano allineati in uno specifico modo
 *  -p.e. Alignement.bottomRight
 */

/**
 * Uno dei widget più utili, flessibili ed importanti è il "container".
 * Permette di sostituire quello che si farebbe normalmente per definire una sequenza di proprietà
 *  -> per esempio si può fare del testo allineato paddato molto più velocemente
 *
 * Container(
 *    width : 100,
 *    height : 50
 * )
 *
 * Crea uno spazio di 100x50 pixel nella schermata di cui è figlio, così sembra inutile MA può
 * essere usato per creare degli spaziamenti tra due elementi consecutivi
 *
 *
 * Container(
 *    width : 100,
 *    height : 50,
 *    color: Colors.blue,
 *    alignement : Alignement.center,
 *    padding: EdgeInsets.all(12),
 *    child: Text("Child4"),
 * )
 *
 *Contenitore di dimensione 100x50 di colore blu, il contenuto è allineato al centro
 *  il padding crea dello spazio tra il bordo del containere ed il contenuto
 *
 *
 *Esistono dei container specializzati che permettono di deinire delle funzionalità specifiche per i figli
 * ->rendono più veloce fare delle cose fighe come trasformazioni, spostamenti, etc... in maniera più facile e veloce
 *    che utilizzando il metodo tradizionale
 *
 *TODO vedere le slide, hanno materiale in più che può essere utile
 */

/**
 * Un altro widget molto utilizzato è la Card.
 * Quello che fa è rendere il riquadro più bellino smussando gli angoli ed aggiungendo un ombra per dare un effetto 3d
 * In genere è molto difficile da fare come effetto se non si usa Flutter
 */

/**
 * il campo drawer di scaffold permette di definire un side drower.
 *
 *  .
 *  .
 *  .
 *  drawer : Drawer{
 *    child: Column(
 *      crossAxisAlignement: CrossAxisAlignement.left
 *      children: [
 *        .
 *        .
 *        .
 *        ]
 *      )
 *  }
 */

/**
 * è possibile creare dei divisori per dividere gli elementi di una lista, in generale però non è molto utile
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * Un widget permette di gestire le gestures degli utenti: GestureDetector(...)
 * è possibile specificare quale gesture wogliamo catturare, per esempio un semplice tap
 * se gli elementi figli vengono trattati con quella gesture si può specificare l'azione da compiere.
 */
class myScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar:  AppBar( //barra sopra
        title: Text("Main screen"),
        backgroundColor: Colors.amber,
      ),
      body: Center( //centra gli elementi dentro
        child: TextField( //figlio di centro
          decoration: InputDecoration( //Un input
            border: OutlineInputBorder(), //vogliamo il bordo mostrato
            labelText: "testo", //etichetta del campo, dice all'utente di che dati parliamo in questo field
            icon: Icon(Icons.text_fields),
            filled: true,
            fillColor: Colors.blueAccent,
            onS : (String value){ //cosa faquando eseguito il submit?
              print(value);
            }
          ),
        )
      ),
    );
}
}

//esempio di pulsanti
class classeBottoni extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar( //appbar della schermata
        title: Text("Titolo Schermata"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          children: [
            TextButton( // bottoni composti da solo testo
                style: TextButton.styleFrom( //si definiscono le proprietà del pulsante
                    //esempi di parametri di stile
                  disabledBackgroundColor: Colors.grey, //stile in caso di bottone disabilitato
                  disabledForegroundColor: Colors.black12 //stile del bottone disabilitato
                ),
                onPressed: (){}, //azione da fare, potrei dichiararlo come null, in tale caso il pulsante diventa non interagibile
                child: Text(
                  "Testo bottone",
                  style: TextStyle(fontSize: 20), //stile del testo
                )
            ),
            ElevatedButton( //pulsante sopraelevato per dare l'effetto di tridimensionalità
                style: ElevatedButton.styleFrom(
                  //qui metto i parametri per lo stile del pulsante
                  elevation:12 //più è alto più sarà palese l'effetto di uscire dallo schermo
                ),
                onPressed: (){},
                child: Text(
                  "ElevatedButton",
                  style: TextStyle(fontSize: 20)
                )
            )
          ],
        ),
      ),
    );
  }
}

//esempio di checkbox
//i checkbox sono widget son stato, quindi cambia il meccanismo di gestione e scrittura del widget
class EsempioCheckbox extends StatefulWidget{ //questa (per ora) deve solo inizializzare lo stato
  @override
  State<StatefulWidget> createState() {
    return EsempioCheckboxState();
  }
}

class EsempioCheckboxState extends State{

  bool? _checboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar( //appbar della schermata
        title: Text("Titolo Schermata"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Row( //mettiamo una ROW per poter mettere il testo e attaccata l checkbox
          children: [
            Text("Checkbox"),
            Checkbox( //una checkbox come figlia
              value: _checboxValue, //il valore della checkbox è quello salvato nel widget
              onChanged: (bool? value){ //cosa fare se la checkbox viene cambiata
                setState(() { //se incontrata nel widget richiede il redraw dell'interfaccia
                  _checboxValue = value; //cambiamo lo stato e poi il set state esegue il redraw dell'interfaccia
                });
              },
            ),
          ]
      ),
    );
    throw UnimplementedError();
  }
}
