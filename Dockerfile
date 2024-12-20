FROM nvidia/cudagl:11.3.0-devel-ubuntu20.04

# Please contact with me if you have problems
LABEL maintainer="Zipeng Dai <daizipeng@bit.edu.cn>"
ENV DEBIAN_FRONTEND=noninteractive

# TODO：网络不好的话可以走代理
ENV http_proxy=http://127.0.0.1:8889
ENV https_proxy=http://127.0.0.1:8889

RUN apt-get update && apt-get install -y --no-install-recommends \
    gedit vim git python3-pip
RUN pip install torch==1.7.1 torchvision==0.8.2 Cython tqdm PyYAML matplotlib numpy Pillow opencv-python scipy \
    unzip numba libxkbcommon-x11-0 libqt5gui5 libqt5core5a libqt5widgets5 libxcb-xinerama0

# TODO：如果走了代理、但是想镜像本地化到其它机器，记得清空代理（或者容器内unset）
# ENV http_proxy=
# ENV https_proxy=
# ENV no_proxy=
CMD ["/bin/bash"]
WORKDIR /workspace