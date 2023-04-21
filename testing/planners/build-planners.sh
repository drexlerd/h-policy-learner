#!/bin/bash

cd bfws && singularity build ../dual-bfws.img dual-bfws.sif && cd ..
cd lama && singularity build ../lama-first.img lama-first.sif && cd ..
cd siwr && singularity build ../siwr.img siwr.sif && cd ..
cd h-policy && singularity build ../h-policy.img h-policy.sif && cd ..