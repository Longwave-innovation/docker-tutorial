# LW Docker Tutorial

## Intro

[docker-tutorial](https://github.com/Longwave-innovation/docker-tutoriali) è un Tutorial creato da Longwave per sperimentare l'utilizzo di container Docker.

Il tutorial guida lo studente nell'esecuzione delle principali funzioni Docker come la creazione e gestione delle immagine e l'esecuzione e gestione dei container.

A scopo dimostratico il tutorial utilizza una semplice applicazione web, il cui codice sorgente e contenuto nel repository.

## Prerequisiti

- [Docker Desktop](https://docs.docker.com/desktop/)
  
## Come Iniziare

- Aprire l'ambiente di sviluppo [Visual Studio Code](https://code.visualstudio.com/docs)(VSC) e clonare il repository dal terminale con il comando

```bash
git clone https://github.com/Longwave-innovation/docker-tutorial.git
```

- [Aprire](https://youtu.be/u3PMR8voOo0?si=GVIacqOljEiOKI_4) la folder del repository in uno spazio di lavoro VSC
- Esplorare il codice del repository
  - `dockerfile`
  - `index.html`

## Creiamo la nostra prima applicazione

- Creiamo l'immagine Docker

```bash
docker build -t docker-tutorial .
```

- Verifichiamo lo stato dell'immagine

```bash
docker images
```

- Eseguiamo un container con l'immagine

```bash
docker run --detach --name tutorial -p 80:80 docker-tutorial
```

- Verifichiamo lo stato del container

```bash
docker ps
```

- rispondiamo alle seguenti domande:
  - come si chiama il container?
  - che immagine usa?
  - su che porta è esposto sull'host?
  
- Accediamo all'applicazione `http://localhost:80`

## Modifichiamo l'applicazione e rilasciamo una nuova versione

- Cambiamo l'aspetto della pagina web modificando alcuni parametri del file `index.html` (es: logo docker ed il colore dello sfondo di una sezione)

- Creiamo una nuova immagine versionata

```bash
docker build -t docker-tutorial:1.0.0 .
```

- Fermiamo il container e lo cancelliamo

```bash
docker stop tutorial
docker rm tutorial
```

- Eseguiamo un container con l'immagine appena creata (v1.0.0) esponendolo sulla porta `81`dell'host

```bash
docker run --detach --name tutorial -p 81:80 docker-tutorial:1.0.0
```

- Accediamo all'applicazione `http://localhost:81`
