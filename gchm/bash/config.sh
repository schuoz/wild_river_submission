# Configuration file for GCHM

# ----------------------------
# ---------- DEPLOY ----------
# ----------------------------

export GCHM_DEPLOY_PARENT_DIR="./deploy_example"
export YEAR="2020"
export GCHM_DEPLOY_IMAGE_PATHS_DIR="${GCHM_DEPLOY_PARENT_DIR}/image_paths/${YEAR}"
export GCHM_DEPLOY_IMAGE_PATHS_LOG_DIR="${GCHM_DEPLOY_PARENT_DIR}/image_paths_logs/${YEAR}"
export GCHM_DEPLOY_SENTINEL2_DIR="${GCHM_DEPLOY_PARENT_DIR}/sentinel2/"
export GCHM_DEPLOY_DIR="${GCHM_DEPLOY_PARENT_DIR}/predictions/${YEAR}"
export GCHM_MODEL_DIR="./trained_models"
export GCHM_NUM_MODELS=1

export GCHM_DOWNLOAD_FROM_AWS="False"  # Set this to "True" or "False"
export GCHM_AWS_CONFIGS_FILE="$HOME/.aws_configs"
export GCHM_DEPLOY_SENTINEL2_AWS_DIR="${GCHM_DEPLOY_PARENT_DIR}/sentinel2_aws/${YEAR}"

# make directories
mkdir -p ${GCHM_DEPLOY_DIR}
mkdir -p ${GCHM_DEPLOY_SENTINEL2_AWS_DIR}
mkdir -p ${GCHM_DEPLOY_IMAGE_PATHS_LOG_DIR}

# ----------------------------
# --------- TRAINING ---------
# ----------------------------

export GCHM_TRAINING_DATA_DIR="/home/szong/df/work/wild_river/parts_shuffled"
export GCHM_TRAINING_EXPERIMENT_DIR="/home/szong/df/work/wild_river/wild_river_xception/training_models"
# Set path to python
export PYTHON= python


