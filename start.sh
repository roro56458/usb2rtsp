!/bin/bash

# Démarrage du serveur RTSP
rtsp-simple-server &
echo "RTSP server launched"

# Attente que le serveur soit prêt
sleep 2

# Lancement de ffmpeg pour envoyer le flux
ffmpeg -f v4l2 -framerate "${FPS}" -video_size "${RESOLVE}" -i "${CAMERA_PATH}" -pix_fmt yuv420p -b:v 2000k -f rtsp ->

# Message indiquant que ffmpeg a été lancé
echo "FFmpeg launched"