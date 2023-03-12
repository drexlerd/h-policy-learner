#!/bin/bash

cd bfws && singularity build ../dual-bfws.img dual-bfws.sif && cd ..
cd lama && singularity build ../lama-first.img lama-first.sif && cd ..
cd siwr-hsiwr && singularity build ../siwr.img siwr.sif && cd ..
cd siwr-hsiwr && singularity build ../hsiwr.img hsiwr.sif && cd ..