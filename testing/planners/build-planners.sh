#!/bin/bash

cd bfws && singularity build ../dual-bfws.sif dual-bfws.def && cd ..
cd lama && singularity build ../lama-first.sif lama-first.def && cd ..
cd lapkt-siwr && singularity build ../lapkt-siwr.sif siwr.def && cd ..
cd downward-siwr && singularity build ../downward-siwr.sif siwr.def && cd ..
cd h-policy && singularity build ../h-policy.sif h-policy.def && cd ..
