#!/bin/sh

udevadm control --reload
rpicam-hello --list-cameras -n -v

# rpicam-jpeg --output test.jpg

# Get the local IP address
local_ip=$(ip route get 1 | awk '{print $7}')
echo $local_ip

# while true; do
    # Start streaming from the camera using libcamera and pipe the output to FFmpeg
#     libcamera-vid --output=pipe:0 --codec=H264 | \
#     ffmpeg -hide_banner -i pipe:0 -c:v copy -f mjpeg -q:v 5 -r 30 -s 640x480 -bufsize 1024k \
#       -vf fps=10 "http://$local_ip:80/stream" >/dev/null
#
#     sleep 1
# done


# GST_DEBUG=1 gst-launch-1.0 -v libcamerasrc ! video/x-raw, format=RGBx, width=1920, height=1080, framerate=30/1 ! timeoverlay ! videoconvert ! video/x-raw,format=I420 ! x264enc ! rtph264pay config-interval=-1 ! udpsink host=192.168.1.12 port=5600 sync=false async=true
# GST_DEBUG=1 gst-launch-1.0 -v v4l2src device=/dev/video0 ! video/x-raw, format=RGBx, width=1920, height=1080, framerate=30/1 ! timeoverlay ! videoconvert ! video/x-raw,format=I420 ! x264enc ! rtph264pay config-interval=-1 ! udpsink host=192.168.1.12 port=5600 sync=false async=true
# gst-launch-1.0 libcamerasrc camera-name=/base/soc/i2c0mux/i2c@0/imx708@1a name=daycam ! capsfilter caps=video/x-raw,width=1280,height=720,format=NV12 ! videoconvert ! openh264enc ! video/x-h264,level=\(string\)4.2 ! h264parse ! udpsink host=192.168.1.12 port=8080
# gst-launch-1.0 libcamerasrc camera-name=/base/axi/pcie@120000/rp1/i2c@80000/imx708@1a ! 'video/x-raw,format=NV12,width=1280,height=720' ! queue ! glimagesink
# gst-launch-1.0 v4l2src device=/dev/video6 ! 'video/x-raw,format=NV12,width=1280,height=720' ! queue ! glimagesink
#
# GST_DEBUG=1 gst-launch-1.0 libcamerasrc ! capsfilter caps=video/x-raw,width=1280,height=720,format=NV12 ! v4l2convert ! v4l2h264enc extra-controls="controls,repeat_sequence_header=1" ! h264parse ! rtph264pay ! udpsink host=localhost port=5000
# GST_DEBUG=1 gst-launch-1.0 v4l2src device=/dev/video0 ! capsfilter caps=video/x-raw,width=1280,height=720,format=NV12 ! v4l2convert ! v4l2h264enc extra-controls="controls,repeat_sequence_header=1" ! h264parse ! rtph264pay ! udpsink host=localhost port=5000
# gst-launch-1.0 libcamerasrc ! 'video/x-raw,format=NV12,width=1280,height=720' ! queue ! glimagesink
# GST_DEBUG=1 gst-launch-1.0 v4l2src device=/dev/video0 ! fakesink
#
# sudo apt remove libgstreamer1.0-dev gstreamer1.0-plugins-base-apps gstreamer1.0-plugins-base libgstreamer-plugins-base1.0-0 \
#         libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly \
#         gstreamer1.0-libav gstreamer1.0-tools gstreamer1.0-x \
#         gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-qt5 gstreamer1.0-gtk3 gstreamer1.0-pulseaudio gstreamer1.0-nice \
#         python3-pyqt5 python3-opengl \
#         python3-cryptography python3-websockets python3-gi
#
# sudo apt update && sudo apt apt upgrade -yq
# sudo apt install git libcamera-dev v4l-utils
# sudo apt install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-tools gstreamer1.0-x python3-pyqt5 python3-opengl gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-qt5 gstreamer1.0-gtk3 gstreamer1.0-pulseaudio gstreamer1.0-nice gstreamer1.0-plugins-base-apps
# sudo apt clean && sudo rm -rf /var/lib/apt/lists/*



sudo apt update && sudo apt upgrade -y
sudo rm /usr/lib/python3.11/EXTERNALLY-MANAGED
sudo apt-get install -y python3-pip libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-tools gstreamer1.0-x python3-pyqt5 python3-opengl gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-pulseaudio gstreamer1.0-nice gstreamer1.0-plugins-base-apps
pip3 install websockets
pip3 install cryptography
sudo apt-get install -y libcairo-dev libgirepository1.0-dev
pip3 install PyGObject
sudo apt-get install -y gstreamer1.0-libcamera
sudo apt-get install git vim -y

git clone --depth=1 https://github.com/steveseguin/raspberry_ninja
cd raspberry_ninja

python3 publish.py --test --libcamera



sleep infinity
