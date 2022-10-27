/**
 * In genere quello che si vuole fare è mettere una classe per file, almeno per la parte di
 *  scomposizione ad oggetti del sistema.
 */

class Person{

  /**
   * Gli attributi che vogliamo privati possono essere definiti come tali utilizzando l'underscore
   * Questi saranno non visibili al di fuori del file attuale
   */

  String _nome = "default";
  String _cognome = "default";
  String _department = "default";
  String _email = "default";

  Person(this._nome, this._cognome, this._department, this._email);

  /**
   * se poi si vuole accedere si possono usare dei meccanismi per gestire l'accesso controllato
   * vengono create delle porpietà che permettono di trattare la variabile privata come variabile pubblica
   * le funzioni possono essere modificate per permettere degli effetti collaterali quando vengono chiamati
   * possiamo anche fornire dei controlli
   */

  //getter and setter
  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get department => _department;

  set department(String value) {
    _department = value;
  }

  String get cognome => _cognome;

  set cognome(String value) {
    _cognome = value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  //una cosa figa che posso fare è definire il get di proprietà che non sono proprio istanza della classe!
  String get fullName{ //notare che la keyword get non vuole la lista di parametri, anche se vuota
    return nome + " " + cognome;
  }

/**
 * Dart non permette l'overloading dei costruttori, per averne multipli la soluzione è utilizzare un nome per il costruttore,
 * attraverso la notazione nomeClasse.nomeCostruttore();
 */
}

//per accedere a queste variabili di istanza utilizzo la notazione istanza.nomeVariabile (con l'underscore tolto)
testPerson(){
  Person person = new Person("pierchangelo", "l'ingegnere", "il migliore", "PierchangeloIlMigliore@Strapotente.it");
  print(person.nome);
}