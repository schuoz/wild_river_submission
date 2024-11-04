#!/bin/bash

GCHM_DEPLOY_DIR="./deploy_example/predictions/2020"
GCHM_MODEL_DIR="./trained_models"
GCHM_NUM_MODELS="1"
filepath_failed_image_paths="./deploy_example/log_failed.txt"
GCHM_DOWNLOAD_FROM_AWS="False"
GCHM_DEPLOY_SENTINEL2_AWS_DIR="./deploy_example/sentinel2_aws"
H5_FILES_DIR="/mnt/samba_eledata/shuo/eu_23_600/hdf5"
CSV_OUTPUT_DIR="./deploy_example/csv_outputs_pred/eu_2023_model_129"

# create directories
mkdir -p ${GCHM_DEPLOY_DIR}
mkdir -p ${GCHM_DEPLOY_SENTINEL2_AWS_DIR}
mkdir -p ${CSV_OUTPUT_DIR}
mkdir -p logs

#set the device
export CUDA_VISIBLE_DEVICES=1

# Loop over all .h5 files in the specified directory
for DEPLOY_IMAGE_PATH in ${H5_FILES_DIR}/*.h5; do
    # Extract the base name of the file (without the directory and extension)
    base_name=$(basename ${DEPLOY_IMAGE_PATH} .h5)
    
    # Define the output CSV file name
    output_csv_file="${CSV_OUTPUT_DIR}/${base_name}_prediction_model_129.csv"
    
    # Submit the job using sbatch with --wrap
    nohup python3 gchm/deploy_river.py --model_dir=${GCHM_MODEL_DIR} \
                                                --deploy_image_path=${DEPLOY_IMAGE_PATH} \
                                                --deploy_dir=${GCHM_DEPLOY_DIR} \
                                                --deploy_patch_size=256 \
                                                --num_workers_deploy=4 \
                                                --num_models=${GCHM_NUM_MODELS} \
                                                --finetune_strategy='FT_Lm_SRCB' \
                                                --filepath_failed_image_paths=${filepath_failed_image_paths} \
                                                --download_from_aws=${GCHM_DOWNLOAD_FROM_AWS} \
                                                --sentinel2_dir=${GCHM_DEPLOY_SENTINEL2_AWS_DIR} \
                                                --remove_image_after_pred='False' \
                                                --output_csv_file=${output_csv_file} \
                                                --deploy_batch_size=72 >prediction_example_${base_name}_129_256.log &
    # Get the PID of the most recent background job
    job_pid=$!

    # Wait for this specific job to complete before starting the next one
    wait $job_pid
done
