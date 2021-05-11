#!/bin/bash
sudo xhost +si:localuser:root
sudo docker run --runtime nvidia -it --rm --network  host --ipc=host --cap-add SYS_PTRACE -e DISPLAY=$DISPLAY \
	        --volume /tmp/.X11-unix/:/tmp/.X11-unix/ \
		--volume /etc/enctune.conf:/etc/enctune.conf \
		--volume /usr/lib/python3.6/dist-packages/tensorrt:/usr/lib/python3.6/dist-packages/tensorrt \
                --volume /usr/src/tensorrt:/usr/src/tensorrt \
	        --volume ~/nvdli-data:/data \
		--device /dev/video0 --volume /tmp/argus_socket:/tmp/argus_socket \
		lab_detectron2
