/**
 * Dart supporta le classi e le superclassi
 *
 */

class DummyClass extends SuperDummyClass{

  String? attribute1; //in genere non si mette il ? e si da un valore di default, la soluzione non è ottimale dato che di solito è più facile gestire il null
  String? attribute2;

  DummyClass(String superAttribute, String attribute1, String attribute2){
    super.superAttribute = superAttribute;
    this.attribute1 = attribute1; //a google non piace quando si utilizza il this quando non serve
    this.attribute2 = attribute2;
  }

  /**
   * TODO rivedere la parte di istanziazione si super classi da parti delle sottoclassi
   */

  //dart ha una versione semplificata per la scrittura del costruttore
  //DummyClass(this.attribute1, this.attribute2);

  @override
  printAllAttributes() {
    print(this.superAttribute);
    print(this.attribute1);
    print(this.attribute2);
  }
}

abstract class SuperDummyClass{

  String? superAttribute;
  printAllAttributes();

  SuperDummyClass(); //devo dare un nome al costruttore altrimenti non posso istanziare dalla sottoclasse
}

/**
 * in genere gli oggetti in flutter hanno nel costruttore un gran numero di attributi opzionali.
 * Ma in genere noi vorremmo che i parametri opzionali sono obbligatori, questo si specifica utilizzando
 *  la keyword required davanti al parametro opzionale che si vuole rendere obbligatorio
 * Questo viene fatto per permettere la specifica del parametro per nome rendendo comunque obbligatorio
 *  l'inserimento
 */

class FlutterObject{

  String nome = "";
  String cognome = "";

  FlutterObject({required String nome, required String cognome}){
    this.nome = nome;
    this.cognome = cognome;
  }
}

//per poi la creazione dell'oggetto si utilizzano la seguente forma
createFlutterObject(String nome, String cognome){
  FlutterObject flutterObject = new FlutterObject(
      nome: nome,
      cognome: cognome
  );
}

/**
 * In dart ogni classe che viene fatta è automaticamente un interfaccia, a differenza di Java
 * Si implementa una interfaccia attraverso la keyword implements
 */

/** *********************************************** Asincronia in Dart ***************************************************** **/

/**
 * In dart ha dei costrutti specifici per gestire il codice asincrono,
 * L'idea è di utilizzarlo per delle operazioni che sarebbero bloccanti ma vogliamo comunque mantenere
 *  il funzionamento dell'applicazione durante l'esecuzione di tali operazioni
 */

void asyncExample() async{
  print("inizio operazione");
  print(await createOrderMessage()); //normalmente questa chiamata è non bloccante, se volessi attendere devo far ritornare a
                        //createOrderMessage un oggetto di tipo future
                        //
  print("operazione finita");
}

Future<String> createOrderMessage() async{
  String object = await fetchUserOrder();
  //fetchUserOrder ci ritorna un oggetto di tipo future, dopo la prima esecuzione non contiene ancora l'oggetto che voglio
  //quando ho una funzione che so sia asincrona posso specificare che voglio il valore che arriva alla fine della funzione
  //asincrona, è inoltre necessario specificare che la funzione attuale è asincrona dato che utilizza del codice asincrono
  return object; //ritorno l'oggetto asincrono
}

//per simulare un caricamento utilizziamo una pausa, di solito la forma per la gesione del codice asincrono
Future<String> fetchUserOrder(){
  return Future.delayed(Duration(seconds: 5), () => "espresso"); //al termine dei 5 secondi ritorna una string espresso
}

/**
 * In Dart spesso la gestione delle operazione asincrone ha a che fare con oggetti di tipo Future
 * Sono oggetti strani che possono ottenere nella loro vita dei valori diversi, uno è settato dal lancio della operazione asincrona
 * Un secondo valore gli viene assegnato quando l'operazione asicrona è finita.
 */




