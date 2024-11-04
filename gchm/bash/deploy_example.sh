#!/bin/bash

#DEPLOY_IMAGE_PATH="./deploy_example/sentinel2/s2_0808_prediction3.h5"
DEPLOY_IMAGE_PATH="/mnt/samba_eledata/shuo/hdf5/s2_af_af_600_large_2_45000_50000.h5"
GCHM_DEPLOY_DIR="./deploy_example/predictions/2020"

GCHM_MODEL_DIR="./trained_models"
GCHM_NUM_MODELS="1"

filepath_failed_image_paths="./deploy_example/log_failed.txt"

GCHM_DOWNLOAD_FROM_AWS="False"
GCHM_DEPLOY_SENTINEL2_AWS_DIR="./deploy_example/sentinel2_aws"

# create directories
mkdir -p ${GCHM_DEPLOY_DIR}
mkdir -p ${GCHM_DEPLOY_SENTINEL2_AWS_DIR}

#set the device
export CUDA_VISIBLE_DEVICES=6

nohup python3 gchm/deploy_river.py --model_dir=${GCHM_MODEL_DIR} \
                       --deploy_image_path=${DEPLOY_IMAGE_PATH} \
                       --deploy_dir=${GCHM_DEPLOY_DIR} \
                       --deploy_patch_size=256 \
                       --num_workers_deploy=4 \
                       --num_models=${GCHM_NUM_MODELS} \
                       --finetune_strategy="FT_Lm_SRCB" \
                       --filepath_failed_image_paths=${filepath_failed_image_paths} \
                       --download_from_aws=${GCHM_DOWNLOAD_FROM_AWS} \
                       --sentinel2_dir=${sentinel2_dir} \
                       --deploy_batch_size=2 \
                       --remove_image_after_pred="False" > prediction_example_single116_256.log &



