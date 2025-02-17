FROM ubuntu:22.04

# Copier le script de démarrage
COPY ./start.sh /start.sh
RUN chmod +x /start.sh

# Mettre à jour la liste des paquets et installer les dépendances
RUN apt-get update && \
    apt-get install -y htop nano git curl wget ffmpeg

# Télécharger et installer le serveur RTSP
RUN wget https://github.com/aler9/rtsp-simple-server/releases/download/v0.16.0/rtsp-simple-server_v0.16.0_linux_amd64 && \
    tar -xzvf rtsp-simple-server_v0.16.0_linux_amd64.tar.gz && \
    mv rtsp-simple-server /usr/local/bin && \
    rm rtsp-simple-server_v0.16.0_linux_amd64.tar.gz

# Exposer les ports nécessaires
EXPOSE 8445
EXPOSE 8888
EXPOSE 8001
EXPOSE 8000
EXPOSE 1935
EXPOSE 554

# Exécuter le script de démarrage
CMD ["/start.sh"]