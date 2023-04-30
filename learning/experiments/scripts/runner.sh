#!/bin/bash

DOMAIN=$1
TASK_DIR=$2
WORKSPACE=$3
WIDTH=$4
CONCEPT_COMPLEXITY=$5
ROLE_COMPLEXITY=$6
BOOLEAN_COMPLEXITY=$7
COUNT_NUMERICAL_COMPLEXITY=$8
DISTANCE_NUMERICAL_COMPLEXITY=$9

RUN_ERR="${WORKSPACE}/run.err"
RUN_LOG="${WORKSPACE}/run.log"

# Run a single task in the foreground.
rm -rf ${WORKSPACE}
mkdir -p ${WORKSPACE}
./../../learner/main.py --domain ${DOMAIN} --task_dir ${TASK_DIR} --workspace ${WORKSPACE} -w ${WIDTH} -cc ${CONCEPT_COMPLEXITY} -rc ${ROLE_COMPLEXITY} -bc ${BOOLEAN_COMPLEXITY} -ncc ${COUNT_NUMERICAL_COMPLEXITY} -ndc ${DISTANCE_NUMERICAL_COMPLEXITY} 2> ${RUN_ERR} 1> ${RUN_LOG}
