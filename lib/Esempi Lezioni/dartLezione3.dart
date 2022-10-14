import "EsempioImportazione.dart";

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

