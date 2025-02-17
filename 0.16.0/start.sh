!/bin/bash


rtsp-simple-server &
echo "RTSP server launched"


sleep 2


ffmpeg -f v4l2 -framerate "${FPS}" -video_size "${RESOLVE}" -i "${CAMERA_PATH}" -pix_fmt yuv420p -b:v 2000k -f rtsp ->

echo "FFmpeg launched"