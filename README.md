# Traffic Sign Detection with Jetson Nano

## Introduction

This is the final project for the High Performance Architectures for Computer Vision course.

Please find [here](https://docs.google.com/presentation/d/17rIG6KZRuvFD-SqqMpNHWjq8IgumQ2KEVbMoaH4scq4/edit?usp=sharing) the slides from the presentation about this project.

## Training

Done on Google Colab ([Document](https://colab.research.google.com/drive/1fFLJodQ5aXTl2YNctiIwKYTHArmEBdbn?usp=sharing)) with the [Mapilliary Traffic Sign Dataset](https://www.mapillary.com/dataset/trafficsign).

## Inference

Done on a NVIDIA Jetson Nano

### Build Dockerfile
```bash
sudo docker build -t lab_detectron2 .
```

### Run Docker image
```bash
./run_lab.sh
```

### Demo

[YouTube Video](https://youtu.be/D-CSkrdbuVU)
