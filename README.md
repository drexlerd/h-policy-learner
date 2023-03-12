# Hierarchical Policy Learner

## Environment

- Ubuntu 18.04
- Python 3.8.3

## Installation

### Step 1: Clone the repo recursively

```console
git clone --recursive git@github.com:drexlerd/h-policy-learner.git
```

### Step 2: Create Python3 virtual environment

```console
python3 -m venv --prompt slearn .venv
source .venv/bin/activate
pip install -r requirements.txt
```

### Step 3: Build Planner Singularity Containers (Testing only)

```console
cd testing/planners
sudo ./build-planners.sh
```

### Step 4: Build State Space Exploration Tool (SSE)

```console
cd learning/learner/libs/dlplan/libs/downward-sse/planners/downward-sse
./build.py
```

## Running the Learning Experiments


```console
cd learning/experiments/scripts

./blocks_4_clear_hierarchy_0.sh
./blocks_4_clear_hierarchy_1.sh
./blocks_4_clear_hierarchy_2.sh

./blocks_4_on_hierarchy_0.sh
./blocks_4_on_hierarchy_1.sh
./blocks_4_on_hierarchy_2.sh

./delivery_hierarchy_0.sh
./delivery_hierarchy_1.sh
./delivery_hierarchy_2.sh

./gripper_hierarchy_0.sh
./gripper_hierarchy_1.sh
./gripper_hierarchy_2.sh

./miconic_hierarchy_0.sh
./miconic_hierarchy_1.sh
./miconic_hierarchy_2.sh

./reward_hierarchy_0.sh
./reward_hierarchy_1.sh
./reward_hierarchy_2.sh

./spanner_hierarchy_0.sh
./spanner_hierarchy_1.sh
./spanner_hierarchy_2.sh

./visitall_hierarchy_0.sh
./visitall_hierarchy_1.sh
./visitall_hierarchy_2.sh
```

## Running the Testing Experiments

```console
cd testing/experiments
./experiment-siwr.py --all
./experiment-hsiwr.py --all
./experiment-dual-bfws.py --all
./experiment-lama-first.py --all
```