Activity Log

Activity Log è uno script Bash che permette di registrare le attività quotidiane in un file di log semplice ed efficace. Include un sistema per tracciare l'inizio e la fine delle attività con timestamp precisi, oltre a una semplice gestione tramite comandi.

Funzionalità principali

    Inserimento di attività manuali: Aggiungi un'attività con una breve descrizione.
    Tracciamento temporale: Registra l'inizio e la fine di attività con timestamp.
    Visualizzazione del log: Mostra le attività registrate nel file di log.
    Installazione automatizzata: Include un Makefile per installare lo script e aggiungerlo facilmente al PATH.
    Alias personalizzato: Utilizza l'alias log per accedere rapidamente al programma.

Installazione

Per installare Activity Log, segui questi passaggi:

    Clona il repository:

git clone <repository-url>
cd <repository-folder>

Esegui il comando di installazione con il Makefile:

make install

Applica le modifiche al file .bashrc:

    source ~/.bashrc

Ora puoi avviare il programma digitando log nel terminale.
