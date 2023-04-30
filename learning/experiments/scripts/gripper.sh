#!/bin/bash

DOMAIN="${PWD}/../../benchmarks/gripper/domain.pddl"
TASK_DIR="${PWD}/../../benchmarks/gripper/instances"
WIDTH=$1
CONCEPT_COMPLEXITY=9
ROLE_COMPLEXITY=9
BOOLEAN_COMPLEXITY=9
COUNT_NUMERICAL_COMPLEXITY=9
DISTANCE_NUMERICAL_COMPLEXITY=9
WORKSPACE="${PWD}/workspace/gripper_${WIDTH}_${CONCEPT_COMPLEXITY}_${ROLE_COMPLEXITY}_${BOOLEAN_COMPLEXITY}_${COUNT_NUMERICAL_COMPLEXITY}_${DISTANCE_NUMERICAL_COMPLEXITY}"

./runner.sh $DOMAIN $TASK_DIR $WORKSPACE $WIDTH $CONCEPT_COMPLEXITY $ROLE_COMPLEXITY $BOOLEAN_COMPLEXITY $COUNT_NUMERICAL_COMPLEXITY $DISTANCE_NUMERICAL_COMPLEXITY
