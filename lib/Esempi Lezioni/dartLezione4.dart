//Controlli di flusso in dart
/**
 * In dart ci sono gli stessi costrutti dei linguaggi più comuni (sono segnalate solo note particolari):
 *  1) if : le condizioni devono essere per forza booleani, a differenza di javascript e c
 *  2) switch : stessa sintassi di Java
 *
 *              p.e.
 *                    switch (variabile) {
 *                      case 1 :
 *                        istruzione 1;
 *                        break;
 *                      case 2 :
 *                        .
 *                        .
 *                        .
 *                      case n :
 *                        istruzione n;
 *                        break;
 *                      default :
 *                        istruzione default;
 *                        break;
 *                    }
 *
 *     In Java è possibile togliere il break (fall through) in dart questo non è possibile
 *     L'argomento dello switch deve essere di tipo intero o String (no enum?)
 *  4) while : come Java
 *  5) do while : come Java
 *  6) for : come Java, esiste il for in, che è il for each di java. p.e. for(var elementi in numbers){istruzione}
 */

/**
 * In dart le funzioni sono oggetti,
 * possiamo allora passare le funzioni come parametri delle altre funzioni
 */

/**
 * Se voglio che una variabile possa essere null devo dichiararle con il punto di domanda dopo il tipo.
 * Anche se è possibile è bene evitare di utilizzare delle variabili non safe null
 */

String? stringaNulla;      //no errore
//String stringaNulla;     //errore

/**
 * Una funzione puà ritornare (ovviamente) una variabile in scope globale
 */
String? myFunction(){
  return stringaNulla;
}

/**
 * In dart la definizione dei parametri delle funzioni è un po' differente dagli altri linguaggi.
 *  1) la definizione in genere è abbastanza simile (posizionale)
 *  2) è possibile definire i parametri opzionali, i quali possono essere posizionali o per nome:
 *      1) parametri opzionali posizionali: sono definiti attraverso le parentesi quadre nella
 *                                          definizione dei parametri della funzione.
 *                                          p.e.
 *                                                void funzioneOptPos(tipo1 parametro1, [tipo2 parametro2])
 *
 *                                                il parametro 2 è opzionale posizionale
 *
 *                                          Se il parametro2 viene utilzzato ma il chiamante non lo passa so ha un errore dovuto alla null safety
 *                                          Ci sono due soluzioni:
 *                                              1) Indicare come possibile null (usare il ?)
 *                                              2) Inserire un valore di default.
 *
 *      2)paremetri opzionali con nome: sono definiti attraverso l'utilizzo delle parentesi graffe:
 *                                      p.e.
 *                                            void funzioneOptNome(tipo1 parametro1, {tipo2 parametro2})
 *
 *                                      a differenza dei parametri opzionali posizionali il passaggio dei parametri opzionai per nome segue il seguente schema
 *
 *                                            chiamante(){
 *                                               ...
 *                                               funzioneOptNome(elemento1, parametro2 : elemento2)
 *                                               ...
 *                                            }
 *
 *        Il vantaggio del passaggio dei parametri per nome è dovuto al fatto che possiamo specificare un gran numero di parametri opzionali,
 *        specificando in maniera facile, facile da capire e con un ordine qualsiasi.
 */

/**
 *Si puà usare la definizione lambda per definire le funzioni:
 *  tipo nomeFunzione (lista parametri) => corpo della funzione  //il corpo deve ritornare un elemento di tipo
 *
 *  il return non c'è, quindi deve per forza di cosa essere una funzione e non un metodo
 */

/**
 * In Dart esiste il metodo foreach per iterare sugli oggetti iterabili:
 *    p.e.
 *        List lista = [1,2,3]
 *        lista.forEach((element) {/* operazione sull'elemento */}) //in poche parole applico il corpo della funzione in input, in questo caso anonima
 *                                                                  //ad ogni elemento della lista
 *
 *
 *   è possibile anche passare una funzione NON anonima
 *   p.e.
 *       void myPrint(int elemento){
 *          print(elemento);
 *       }
 *
 *       ...
 *       List lista = [1,2,3]
 *       lista.forEach((element) myPrint(elemento))
 *       ...
 *
 *       Notare come l'esempio presenta un errore, il motivo è dovuto al fatto che il tipo di lista è List<Dynamic>, mentre la funzione si aspetta un int
 *       Per evitare questo problema è definire il tipo dell'array (List) attraverso la specificazione del tipo, attraverso la dichiarazione List<Int>.
 */

/**
 * Il passaggio di funzioni come parametri opzionali con nome è utile per gestire gli eventi dell'interfaccia
 */


/**
 * Dart supporta le classi
 * Come in java si definiscono attraverso la keyword class
 */