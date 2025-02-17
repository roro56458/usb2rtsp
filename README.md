# This project has been put on hold


# Welcome / Bonjour
to the **usb2rtsp** project.  
# This project allows you to turn your USB camera into an **RTSP** stream compatible with **Home Assistant, Frigate**, or any other RTSP-compatible NVR server.

## 📖 Documentation

First, pull the image:

```bash
docker pull ghcr.io/roro56458/usb2rtsp/usb2tortsp-0.16.0-ubuntu:latest
```

Secondly, start the container:

```bash 
docker run -d \
  --name usbtortsp \
  --network host \
  -p 554:554 \
  -e RTSP_RTSPADDRESS=0.0.0.0:554 \
  -e CAMERA_PATH=/dev/video0 \
  -e RESOLVE=1280x720 \
  -e FPS=25 \
  -e METHODE=tcp \
  --device /dev/video0:/dev/video0 \
  ghcr.io/roro56458/usb2rtsp/usb2tortsp-0.16.0-ubuntu:latest
```
Or, if you want to use the compose file:
```bash 
docker compose up -d
```

Don't forget to update variables and allow device passthrough.
    
For the environment:
- **RTSP_RTSPADDRESS**: Define the address of your RTSP stream (e.g., 0.0.0.0:554 or 0.0.0.0:8554).
- **CAMERA_PATH**: The path of your camera (e.g., /dev/video0). You can find it by executing `ls /dev/video*`.
- **RESOLVE**: The resolution of your camera, the format needs to be xxx"x"xxx (e.g., 1280x720 or 1920x1080).
- **FPS**: The number of frames per second. Adjust it according to your camera (e.g., 25, 30, or 60; just the number).
- **METHODE**: The method used (tcp or udp). For reminder:
    - **TCP** confirms that the packet has been sent successfully but has more latency.
    - **UDP** does not confirm that the packet has arrived but reduces latency.
  If you choose UDP, remember to add `/udp` to the ports section.
    
For devices, you can find your camera path by running `ls /dev/video*`, e.g., /dev/video0.

For more modifications, just change them in the `./start.sh` file, which contains the FFmpeg start commands.

And Voilà! You can now add it to Frigate or Home Assistant.

## 🛠️ Acknowledgements
Thanks to **FFmpeg** and **rtsp-simple-server** for their essential tools.

### 📜 Licenses
- **FFmpeg** is licensed under **LGPL v2.1+**.
  → [License Details](https://github.com/FFmpeg/FFmpeg/blob/master/COPYING.LGPLv2.1)
  → [GitHub Repository](https://github.com/FFmpeg/FFmpeg)
  
- **rtsp-simple-server** is licensed under **MIT**.
  → [License Details](https://github.com/aler9/rtsp-simple-server/blob/main/LICENSE)
  → [GitHub Repository](https://github.com/aler9/rtsp-simple-server)