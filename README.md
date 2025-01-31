# LW Docker Tutorial

## Intro

[docker-demo](https://github.com/Longwave-innovation/docker-demo) è un Tutorial per sperimentare la creazione e l'esecuzione di un container Docker.

L'applicazione all'interno del container pubblica una semplice pagina web.

## Prerequisiti

- [Docker Desktop](https://docs.docker.com/desktop/)
  
## Come Iniziare

- Aprire l'ambiente di sviluppo [Visual Studio Code](https://code.visualstudio.com/docs)(VSC) e clonare il repository dal terminale con il comando

```bash
git clone https://github.com/Longwave-innovation/docker-demo.git
```

- [Aprire](https://youtu.be/u3PMR8voOo0?si=GVIacqOljEiOKI_4) la folder del repository in uno spazio di lavoro VSC
- Esplorare il codice del repository
  - `dockerfile`
  - `index.html`
- Creare la nostra prima immagine Docker

```bash
docker build -t docker-demo .
```

- Eseguire un container con l'immagine appena creata

```bash
docker container run --detach -p 80:80 docker-demo`
```

- Verificare lo stato del container

```bash
docker ps
```

- Aprire un web brower sul proprio PC ed accedere all'indirizzo `http://localhost:80`

- Fermare e rimuovere il container

```bash
docker stop docker-demo
docker rm docker-demo
```

- Modificare il logo della pagina con l'immagine `https://www.longwave.it/wp-content/uploads/2024/12/logo-longwave-2025.png`

- Creare una nuova immagine versionata

```bash
docker build -t docker-demo:1.0.0 .
```

- Eseguire un container con l'immagine appena creata (v1.0.0)
```bash
docker container run --detach -p 80:80 docker-demo:1.0.0`
```

`https://www.longwave.it/wp-content/uploads/2024/12/logo-longwave-2025.png`
