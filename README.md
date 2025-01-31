# LW Docker Tutorial

## Intro

[docker-tutorial](https://github.com/Longwave-innovation/docker-tutoriali) è un Tutorial creato da Longwave che ti consente di familiarizzare con l'uso di container Docker.

Il tutorial ti guida nell'esecuzione delle principali funzioni Docker come la creazione e gestione delle immagine e l'esecuzione e gestione dei container.

A scopo dimostrativo il tutorial containerizza una semplice applicazione web, il cui codice sorgente e contenuto nel repository.

## Docker background

Docker è una piattaforma open-source che consente di pacchettizzare le applicazioni in container (cioè pacchetti software completamente autosufficienti) ed eseguirli su computer host.

Una volta eseguito ogni container diventa quindi un ambiente isolati e riproducibile su qualsiasi sistema host.

Il pacchetto software, chiamato `immagine`, è leggero, autonomo e include tutto il necessario per eseguite l'applicazione e cioè: codice sorgente, runtime, librerie, variabili d'ambiente e file di configurazione. Le immagini Docker sono create a partire da un file chiamato `Dockerfile`, che contiene una serie di istruzioni su come costruire l'immagine.

Il `Dockerfile` viene di norma posizionato nella folder `root` del repository dove viene conservato il codice sorgente.

L'immagine viene creata con il comando `docker build` eseguito generalmente direttamente nella folder dove risiede il `Dockerfile`.

Una volta pronta l'immagine il container viene eseguito con il comando `docker run`.

## Prerequisiti

[Docker Desktop](https://docs.docker.com/desktop/) e [Visual Studio Code](https://code.visualstudio.com/docs)(VSC) installati sul tuo PC.
  
## Come Iniziare

- Apri VSC e clona il repository dal terminale con il comando

```bash
git clone https://github.com/Longwave-innovation/docker-tutorial.git
```

- [Aggiungi](https://youtu.be/u3PMR8voOo0?si=GVIacqOljEiOKI_4) la folder del repository nel tuo spazio di lavoro VSC
- Esplora il contenuto del codice sorgente:
  - `dockerfile`
  - `index.html`

## Crea la tua prima applicazione

- Crea l'immagine Docker

```bash
docker build -t docker-tutorial .
```

- Verifica lo stato dell'immagine

```bash
docker images
```

- Esegui un container con la tua immagine

```bash
docker run --detach --name tutorial -p 80:80 docker-tutorial
```

- Verifica lo stato del container

```bash
docker ps
```

- prova a rispondere alle seguenti domande:
  - come si chiama il container?
  - che immagine usa?
  - su che porta è esposto sull'host?
  
- Accedi all'applicazione <http://localhost>

- Esegui un comando all'interno del container (visualizza il contenuto della folder con il codice sorgente html)

```bash
docker exec -it tutorial ls -al /usr/share/nginx/html
```

- Accedi direttamente alla shell del container ed esegui il medesimo comando dall'interno

```bash
docker exec -it tutorial /bin/bash
ls -al /usr/share/nginx/html
```

## Modifica l'applicazione e rilascia una nuova versione

- Cambia l'aspetto della pagina web modificando alcuni parametri del file `index.html` (es: logo docker ed il colore dello sfondo di una sezione)

- Crea una nuova immagine versionata

```bash
docker build -t docker-tutorial:1.0.0 .
```

- Ferma il container e poi rimuovilo dal tuo desktop

```bash
docker stop tutorial
docker rm tutorial
```

- Esegui un container con l'immagine appena creata (v1.0.0) esponendolo sulla porta `81`dell'host

```bash
docker run --detach --name tutorial -p 81:80 docker-tutorial:1.0.0
```

- Accedi all'applicazione <http://localhost:81>

- Ferma il container e poi rimuovilo dal tuo desktop

```bash
docker stop tutorial
docker rm tutorial
```

## Esegui un applicazione di terze parti (Vaultwarden)

- Scarica l'immagine più recente dal registry publico [Dockerhub](https://hub.docker.com/) e la copia in locale

```bash
docker pull vaultwarden/server:latest
```

**NB**: il pull immagine è opzionale. L'immagine viene comunque scaricata in fase di esecuzione (run) se non già presente in locale.

- Esegui

```bash
docker run -d --name vaultwarden -v ${PWD}/appdata/vw:/data/ -p 8080:80 vaultwarden/server:latest
```

- Accedi a Vaultwarden <http://localhost:8080>

- Ferma il container e poi rimuovilo dal tuo desktop

```bash
docker stop vaultwarden
docker rm vaultwarden
```
