FROM nvcr.io/nvidia/l4t-ml:r32.5.0-py3

# Install basic dependencies
RUN apt update
RUN apt install -y cmake
RUN apt install -y libprotobuf-dev protobuf-compiler

# Intall detectron2
RUN pip3 install pyyaml==5.1
RUN pip3 install 'git+https://github.com/facebookresearch/detectron2.git'

# Install onnx and tensorrt backend
RUN pip3 install onnx==1.6.0
RUN pip3 install 'git+https://github.com/onnx/onnx-tensorrt.git'
RUN git clone https://github.com/NVIDIA-AI-IOT/torch2trt
RUN cd torch2trt && python3 setup.py install --plugins

# Install jupyterlab
RUN apt install -y curl libffi-dev
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt install -y nodejs 
RUN pip3 install --upgrade jupyterlab
RUN jupyter lab build

# Install jetcam
RUN pip3 install 'git+https://github.com/NVIDIA-AI-IOT/jetcam.git'

# Install jupyter widgets
RUN pip3 install ipywidgets
RUN jupyter nbextension enable --py widgetsnbextension
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager

# Paths to mount data
VOLUME [/usr/lib/python3.6/dist-packages/tensorrt]
VOLUME [/usr/src/tensorrt]
VOLUME [/tmp/argus_socket]
VOLUME [/tmp/.X11-unix/]
VOLUME [/data]

WORKDIR /data
#ENTRYPOINT jupyter lab --allow-root --config /jupyter_conf.py
