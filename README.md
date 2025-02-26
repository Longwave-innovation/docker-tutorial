# LW Docker Tutorial

## Intro

[docker-tutorial](https://github.com/Longwave-innovation/docker-tutorial) è una guida creata da Longwave che ti consente di familiarizzare con l'uso di [container](https://docs.docker.com/get-started/docker-concepts/the-basics/what-is-a-container/) Docker.

Il tutorial ti guida nell'esecuzione delle principali funzioni Docker come la creazione e la gestione delle immagine e l'esecuzione e la gestione dei container.

A scopo dimostrativo il tutorial containerizza una semplice applicazione web, il cui codice sorgente e contenuto nel repository.

## Docker background

[Docker](https://docs.docker.com/get-started/docker-overview/) è una piattaforma open-source che consente di pacchettizzare le applicazioni in container (cioè pacchetti software completamente autosufficienti) ed eseguirli su un computer `host`.

Una volta eseguito, il container diventa quindi un ambiente isolato e riproducibile su qualsiasi sistema host.

Il pacchetto software, chiamato `immagine`, è leggero, autonomo e include tutto il necessario per eseguire l'applicazione e cioè: codice sorgente, runtime, librerie, variabili d'ambiente e file di configurazione. Le immagini Docker sono create a partire da un file chiamato `Dockerfile`, che contiene una serie di istruzioni su come costruire l'immagine.

Il `Dockerfile` viene di norma posizionato nella folder `root` del repository dove viene conservato il codice sorgente.

L'immagine viene creata con il comando `docker build` eseguito generalmente nella folder dove risiede il `Dockerfile`.

Una volta pronta l'immagine il container viene eseguito con il comando `docker run`.

## Prerequisiti

[Docker Desktop](https://docs.docker.com/desktop/) e [Visual Studio Code](https://code.visualstudio.com/docs) (VSC) installati sul tuo PC.

> **Nota**
> Sebbene il tutorial sia pensato per essere usato su <mark>Windows</mark>, gran parte dei comandi sono comunque replicabili anche su Linux.

## Come Iniziare

- Apri VSC e clona il repository dal terminale con il comando,

```bash
git clone https://github.com/Longwave-innovation/docker-tutorial.git
```

- [Aggiungi](https://youtu.be/u3PMR8voOo0?si=GVIacqOljEiOKI_4) la folder del repository nel tuo spazio di lavoro VSC,
- Esplora il contenuto dei due files ch contengono il codice sorgente:
  - `dockerfile`
  - `index.html`

## Crea la tua prima applicazione

- Crea l'immagine Docker,

```bash
docker build -t docker-tutorial .
```

- Verifica lo stato dell'immagine,

```bash
docker images
```

> **Nota**
> L'attributo `tag` si utilizza per specificare la versione dell'immagine. Se non specificato nel comando di build il tag viene impostato con valore `latest`.

- Esegui un container con la tua immagine,

```bash
docker run --detach --name tutorial -p 80:80 docker-tutorial
```

> **Nota**
> Se non spefificato l'attributo `tag` dopo il nome immagine (quindi la versione), docker utilizza l'immagine con `tag=latest`.

- Controlla lo stato del container,

```bash
docker ps
```

- Prova a rispondere alle seguenti domande:
  - come si chiama il container?
  - che immagine usa?
  - su che porta dell'host è esposto?
  
- Accedi all'applicazione <http://localhost>

- Esegui un comando all'interno del container (visualizza il contenuto della folder con il codice sorgente html),

```bash
docker exec -it tutorial ls -al /usr/share/nginx/html
```

- Accedi direttamente alla shell del container,

```bash
docker exec -it tutorial /bin/bash
```

- Poi esegui questi comandi,

  Visualizza il contenuto della folder con il codice sorgente html direttamente dall'interno del container,
  
  ```bash
    ls -al /usr/share/nginx/html
  ```

  Controlla la distribuzione Linux,

  ```bash
  cat /etc/os-release
  ```

  > **Nota**
  > La distribuzione è quella contenuta nell'OS del immagine base (nginx).

  Controlla la versione di Kernel Linux,

  ```bash
  uname -a
  ```
  
  > **Nota**
  > Il kernel è invece quello del sistema host (Windows WSL)

  Esci dalla shell con `CTRL-D`,

## Modifica l'applicazione e rilascia una nuova versione

- Cambia l'aspetto della pagina web modificando alcuni parametri del file `index.html` (es: logo docker ed il colore dello sfondo di una sezione),

- Crea una nuova immagine questa volta però versionata, specificando anche il `tag`,

```bash
docker build -t docker-tutorial:1.0.0 .
```

- Verifica lo stato dell'immagine,

```bash
docker images
```

> **Nota**
> Le immagini `docker-tutorial` ora sono due, ma con tag differenti.

- Per aggiornare l'immagine dovrai necessariamente eseguire un nuovo container, quello in esecuzione è immutabile quindi fermalo e rimuovilo,

```bash
docker stop tutorial
docker rm tutorial
```

- Esegui nuovamente il container con l'immagine appena creata (v1.0.0) esponendolo questa volta sulla porta `81` dell'host,

```bash
docker run --detach --name tutorial -p 81:80 docker-tutorial:1.0.0
```

- Controlla lo stato del container,

```bash
docker ps
```

- Accedi all'applicazione <http://localhost:81>,

- Ferma il container e poi rimuovilo dal tuo desktop,

```bash
docker stop tutorial
docker rm tutorial
```

## Esegui un applicazione di terze parti (Vaultwarden)

- Scarica l'immagine più recente di [Vaultwarden](https://github.com/dani-garcia/vaultwarden) dal registry pubblico [Dockerhub](https://hub.docker.com/) e copiala in locale,

```bash
docker pull vaultwarden/server:latest
```

> **Nota**
> il pull immagine è opzionale. L'immagine viene comunque scaricata in fase di esecuzione (run) se non già presente in locale.

- Esegui il container con l'immagine appena scaricata `vaultwarden/server`,

```bash
docker run -d --name vaultwarden -v ${PWD}/appdata/vw:/data/ -p 8080:80 vaultwarden/server:latest
```

- Accedi a Vaultwarden <http://localhost:8080>,

- Controlla gli eventi emessi dall'applicazione,

```bash
docker logs vaultwarden
```

- Ferma il container e poi rimuovilo dal tuo desktop,

```bash
docker stop vaultwarden
docker rm vaultwarden
```

## Pulisci l'ambiente

- Cancella le immagini,

```bash
docker image rm docker-tutorial
docker image rm docker-tutorial:1.0.0
docker image rm vaultwarden/server
```

> **Nota**
> Se non specificato l'attributo `tag` dopo il nome immagine Docker cancella l'immagine con `tag=latest`.
