# Immagine di base
FROM nginx:latest

# Crea una nuova folder nel file system dell'immagine
RUN mkdir -p /usr/share/nginx/html/images

# Copia il codice sorgente nell'immagine
COPY index.html /usr/share/nginx/html
COPY images/ /usr/share/nginx/html/images/

# Espone la porta 80
EXPOSE 80

# Comando di avvio del processo
CMD ["nginx", "-g", "daemon off;"]
