# Anti-Unmanned Aerial Vehicle (UAV)
```sh
docker build -t antiuav_image:test --network=host --progress=plain .

docker run --name antiuav-test -itd --privileged --gpus all --network=host \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -e DISPLAY=$DISPLAY \
    -e LOCAL_USER_ID="$(id -u)" \
    antiuav_image:test /bin/bash

docker exec -it antiuav-test /bin/bash

git clone https://github.com/superboySB/Anti-UAV
cd Anti-UAV
```
我们解压所有sample data
```sh
cat testvideo/testvideo.zip.* > testvideo/testvideo.zip
unzip testvideo/testvideo.zip

cat result/result.zip.* > result/result.zip
unzip result/result.zip

cat detect_wrapper/weights/weights.zip.* > detect_wrapper/weights/weights.zip
unzip detect_wrapper/weights/weights.zip -d detect_wrapper
```
运行
```sh
python3 demo_detect_track.py
```
project_uav环境主要包括：
pytorch(1.7.1)、torchvision(0.8.2)、Cython、tqdm、PyYAML、matplotlib、numpy、Pillow、opencv、scipy

注意：GeForce RTX 3070 安装 cuda 11.0 以上