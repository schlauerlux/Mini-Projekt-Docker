# Basis-Image mit NGINX
FROM nginx:latest

# Arbeitsverzeichnis setzen
WORKDIR /usr/share/nginx/html

# Webseite ins Image kopieren
COPY website/ /usr/share/nginx/html

# Port 8080 freigeben
EXPOSE 8080
