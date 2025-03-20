# Mini-Projekt-Docker

# Website Setup mit Docker

## Einleitung
Diese Anleitung beschreibt, wie eine einfache statische Webseite mit Docker und NGINX betrieben wird. Die Webseite kann nach Belieben angepasst werden, indem die `index.html` und `style.css` geändert werden.

---

## 1. Projektstruktur
Die folgende Struktur stellt die Organisation der Dateien dar:

```
mini-projekt/
│── website/
│   ├── index.html   # Hauptseite der Webseite
│   ├── style.css    # Stylesheet für das Design
│── Dockerfile       # Docker-Beschreibung
```

---

## 2. HTML-Datei (website/index.html)
Die Datei `index.html` enthält den HTML-Code der Webseite. Sie kann für individuelle Anpassungen editiert werden.

```html
<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meine Docker-Webseite</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h1>Willkommen auf meiner Docker-Webseite!</h1>
        <p>Diese Webseite läuft in einem Docker-Container mit NGINX.</p>
    </div>
</body>
</html>
```

---

## 3. CSS-Datei (website/style.css)
Das Stylesheet `style.css` sorgt für ein ansprechendes Design der Webseite.

```css
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    text-align: center;
    margin: 0;
    padding: 0;
}

.container {
    margin: 100px auto;
    padding: 20px;
    max-width: 600px;
    background: white;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
}
```

---

## 4. Dockerfile (Dockerfile)
Das `Dockerfile` definiert das Docker-Image und nutzt NGINX als Webserver.

```dockerfile
# Basis-Image mit NGINX
FROM nginx:latest

# Arbeitsverzeichnis setzen
WORKDIR /usr/share/nginx/html

# Webseite ins Image kopieren
COPY website/ /usr/share/nginx/html

# Port 8080 freigeben
EXPOSE 8080
```

---

## 5. Docker-Container Erstellen und Starten
### 5.1 Image bauen
Um das Docker-Image zu erstellen, folgenden Befehl ausführen:

```sh
docker build -t mein-webserver .
```

### 5.2 Container starten
Nach dem Erstellen des Images kann der Container mit folgendem Befehl gestartet werden:

```sh
docker run -d --name web-container -p 8080:80 mein-webserver
```

Nach dem Start ist die Webseite unter **http://localhost:8080** erreichbar.

---

## 6. Anpassungen vornehmen
### 6.1 Änderungen an der Webseite
- Die Webseite kann durch Bearbeiten von `website/index.html` und `website/style.css` individuell angepasst werden.
- Änderungen an diesen Dateien erfordern keinen neuen Build des Containers.

### 6.2 Aktualisieren des Containers nach Änderungen
Falls Änderungen am `Dockerfile` oder an anderen statischen Dateien vorgenommen werden, sollte der Container neu erstellt werden:

```sh
docker stop web-container
docker rm web-container
docker build -t mein-webserver .
docker run -d --name web-container -p 8080:80 mein-webserver
```

---

## 7. Fazit
Mit diesem Setup lässt sich eine einfache statische Webseite schnell und einfach in einem Docker-Container betreiben. Die Anpassung der Webseite erfolgt durch Änderungen an `index.html` und `style.css`, während der Container über das `Dockerfile` konfiguriert wird. Dies ermöglicht eine flexible und portable Bereitstellung der Webseite.

