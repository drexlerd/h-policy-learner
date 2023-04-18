#!/bin/bash

DOMAIN=$1
TASK_DIR=$2
WORKSPACE=$3
PIPELINE=$4
WIDTH=$5
CONCEPT_COMPLEXITY=$6
ROLE_COMPLEXITY=$7
BOOLEAN_COMPLEXITY=$8
COUNT_NUMERICAL_COMPLEXITY=$9
DISTANCE_NUMERICAL_COMPLEXITY=${10}

RUN_ERR="${WORKSPACE}/run.err"
RUN_LOG="${WORKSPACE}/run.log"

# Run a single task in the foreground.
rm -rf ${WORKSPACE}
mkdir -p ${WORKSPACE}
./../../learner/main.py --domain ${DOMAIN} --task_dir ${TASK_DIR} --workspace ${WORKSPACE} --pipeline ${PIPELINE} -w ${WIDTH} -cc ${CONCEPT_COMPLEXITY} -rc ${ROLE_COMPLEXITY} -bc ${BOOLEAN_COMPLEXITY} -ncc ${COUNT_NUMERICAL_COMPLEXITY} -ndc ${DISTANCE_NUMERICAL_COMPLEXITY} 2> ${RUN_ERR} 1> ${RUN_LOG}
