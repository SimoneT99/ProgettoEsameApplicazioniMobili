import "EsempioImportazione.dart";
//import "dart:developer";
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';


/**
 * In dart sono supportati i classici tipi dei linguaggi ad alto livello
 * La definizione segue due modi:
 * 1) metodo Burigat: tipo nome_variabile = valore;  //il vantaggio è che specifichiamo il tipo esplicitamente
 * 2) metodo GOOGLE: var nome_variabile = valore;  //il tipo è oscurato, quindi non si capisce più nulla per progetti complessi,
 *                                                   preferito da GOOGLE, da masochisti, ma permette di cambiare il tipo della
 *                                                   variabile dinamicamente
 */

String stringa = "stringa"; //tipizzato
var variabile = "stringa"; //non tipizzato

/**
 * si possono avere definizioni di variabili nello scope globale, vedi sopra, sia in scope di classe e metodi, ovviamente.
 */

/**
 * Si possono avere funzioni a scope globale, se una funzione non ritorna nulla si può omettere il void, conviene comunque metterlo per chiarezza
 */

void main(){
  print(stringa);
  print(variabile);

  myClass a_class = new myClass(69);
  a_class.printAttributo();
}

/**
 * Si possono definire delle classi, da mettere nello scope globale
 */

class myClass{

  int attributo = 10;

  myClass(int attributo){
    this.attributo = attributo;
  }

  void printAttributo(){
    print(attributo);
  }
}


/**
 * Dart ha una gestione strana dei null, implementa la null safety.
 * NON si possono dichiarare variabili nel seguente modo senza inizializzarle:
 *
 * Tipo nome;
 *
 * Quindi non posso neanche dichararle per inizializzarle in seguito, perchè per qualche istante avrebbe valore null.
 * Questo vale solo per i tipi tradizionali: String, bool, int, etc...
 * La motivazione del null safety è legata al fatto che si vuole evitare crash a run time delle applicazioni, null infatti
 *  spesso è l'unico elemento dei tipi che non supporta i metodi principali (circa) quindi si rischia di avere errori
 * In ogni caso sarebbe bene dare dei valori di default alle variabili, a differenza dell approccio classico dove si vorrebbe a
 *  avere l'assegnazione solo quando si sa quale valore dare ed eventualmente effettuare un controllo sulla nullità
 */

/**
 * Esiste il tag dynamic che permette di definire dinamicamente il tipo di una variabile, raramente è utile ma in genere
 *  è molto pericolosa
 */

/**
 * Le variabili hanno visibilità di blocco come in tutti i linguaggi
 * Le variabili globali sono visibili ovunque, non esistono i modificatori di privatezza se non per la libreria dove è stata
 *  definita quella variabile.
 * La definizione di libreria è lasca in dart, per esempio ogni file è una libreria, posso eventualmente privatezza degli attributi
 *  di una classe relegandola ad un file.
 */

/**
 * L'importazione dei file si fa attraverso:
 *
 *  import "nome_file" //se nella stessa cartella
 *  import "indirizzo_file/nome_file"   //se in cartella diversa
 *
 */

//import "EsempioImportazione.dart";

funzioneTest(){
  print(variabileImportata);
  //print(_variabilePrivata); //da errore
}

/**
 * è possibile importare tutte le libreriw già presenti nel sdk di dart, utilizzando lo schema:
 *
 * import "dart:nome_libreria"
 *
 * Alcune sono già importate di default, tipo la dart_core
 */

//import "dart:developer";

/**
 * è possibile importare dall'esterno, queste sono presenti nel sito "pub.dev" e possono essere importate seguendo la procedura:
 *  1)cercare la libreria di nostro interesse
 *  2)copiare la dipendenza, per esempio: font_awesome_flutter: 10.2.1
 *  3)copiarlo nella sezione dependencies di pubspec.yaml
 *  4)nel prompt in alto a destra premere: pub get
 *  5)importarla nel file attraverso lo schema: "package:package/libreria.dart", per esempio
 *    import 'package:font_awesome_flutter/font_awesome_flutter.dart'
 *
 *
 * Alcune sono già importate di default, tipo la dart_core
 */

/**
 * alcuni tag utili sono cost e final che vincolano il valore delle variabili
 * const: può essere utilizzata con tipo o senza tipo, dichiara una variabile come costante
 *        immutabile, non è possibile creare in questo modo costanti a runtime
 *
 * final: può essere utilizzata con o senza tipo, permette di definire costanti a run time
 */


/**
 * Le stringhe si possono concatenare nel seguente modo:
 * String s2 = stringa1 + stringa2;
 *
 * è possibile creare stringhe nel seguente modo:
 * String s3 = "$expression!";
 *
 * Dove expression è un espressione che da in output una stringa, notare che in dart non
 * esiste il typecasting automatico! se expression non ritorna una stringa questa non viene castata
 * Funziona senza le parentesi graffe se e solo se expression è una variabile
 */

/**
 * Esiste il tipo num che può tenere un qualsiasi valore numerico dei tipi base, evitando la
 *  distinzione tra double, float etc...
 */


/**
 * Possiamo fare il parsing di una stringa rappresentante un numero attraverso tipoNumerico.parse(input)
 *
 * p.e int numero = int.parse("69")
 */


/**
 * Tre tipi (strrutture dati) particolari ci fanno comodo:
 *  1) array: in dart si costruiscono con List (da non confondere con le liste degli altri linguaggi)
 *
 *     List array = {el1, el2, ..., eln}; //possiamo avere diversi tipi nell'array... ...meglio evitare...
 *
 *     I tipi degli array se non detto nulla sono Dynamic, con tutti i casini che ne conseguono.
 *     Per specificare il tipo degli array si utilizza la notazione diamante:
 *
 *     List<tipo> array = {el1, el2, ..., el3}
 *
 *     Possiamo aggiungrere elementi agli arrai utilizzando il metodo add:
 *
 *     array.add(el);
 *
 *     Posso assegnare i valori agli slot degli array come negli altri linguaggi, se accedo ad una
 *      cella con indice outofbound ho errore a differenza di javascript.
 *
 *  2) set: è un insieme di elementi non ordinati.
 *
 *     Set set = Set() //la keyword new non è obbligatoria in dart, se si mette si ottiene lo stesso
 *                       risultato che mettendolo
 *
 *     Il tipo funziona esattamente come le liste: posso specificare il tipo degli elementi attraverso
 *      la notazione dei generics:
 *
 *     Set<int> intSet = Set()
 *
 *    Non posso accedere ad elementi specificando l'indice perchè il set ha come semntica quello di
 *    raggruppare elementi senza un ordine specificato
 *
 *
 *  3) map: è un insieme di coppie chiavi valore, sia la chiave che il valore possono avere uno specifico
 *          tipo ma ingenere la chiave è un intero o una stringa (in genere un qualsiasi tipo che
 *          utilizziamo come codice identificativo univoco)
 *
 *     p.e. Map myMap = {
 *              "key1" : "value1",
 *              "key2" : "value2",
 *     };
 *
 *     possiamo aggiungere banalmente una nuova coppia come:
 *
 *     p.e. myMap["key3"] = "value3";
 *
 *     Le mappe sono utili per fornire un metodo di accesso ad alcuni specifici valori
 */

/**
 * In dart ci sono tutti gli operatori classici di quelli ad alto livello, alcuni però sono specifici di dart:
 *  ?? : Called also null operator. This operator returns expression on its left, except if it is null,
 *       and if so, it returns right expression.
 *
 *  ??= : Called also null-aware assignment. This operator assigns value to the variable on its left,
 *        only if that variable is currently null.
 *
 *  ?.  : Called also null-aware access(method invocation). This operator prevents you from crashing your
 *        app by trying to access a property or a method of an object that might be null
 *
 *  …?  : Called also null-aware spread operator. This operator prevents you from adding
 *        null elements using spread operator(lets you add multiple elements into your collection):
 *
 *  ref: https://jelenaaa.medium.com/what-are-in-dart-df1f11706dd6
 *
 *  Possiamo utilizzare comandi a cascata su uno spceficico oggetto utlizzando l'operatore cascade .. :
 *
 *  p.e. List list = [0];
 *       lisd..add(1)
 *       ..add(2)
 *       ..add(3)
 *       .
 *       .
 *       .
 *       ..add(n);
 *
 *   Il vantaggio è che in casi complessi rende il codice più pulito, notare che ignoro il valore/oggetto ritornato dal metodo!
 */


