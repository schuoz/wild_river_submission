# A river health model using crowd source data and Sentinel-2 images

This repository contains the code used to create the results presented in the paper: [Global contraction of intact river networks aligns with freshwater biodiversity loss].
Here, we developed a model to estimate river intact level. The model estimates river intactness level for every Sentinel-2 river image patches and was trained using citzen science annotation data as a reference.

## Table of Contents
1. [Data availability](https://github.com/langnico/global-canopy-height-model#data-availability)
2. [Installation and credentials](https://github.com/langnico/global-canopy-height-model#installation-and-credentials)
3. [Loading the model](https://github.com/langnico/global-canopy-height-model#loading-the-model)
4. [Deploying](https://github.com/langnico/global-canopy-height-model#deploying)
5. [Training](https://github.com/langnico/global-canopy-height-model#training)
6. [ALS preprocessing for independent comparison](https://github.com/langnico/global-canopy-height-model#als-preprocessing-for-independent-comparison)
7. [Citation](https://github.com/langnico/global-canopy-height-model#citation)

## Data availability
This is a summary of all the published data:

- Global canopy top height map for 2020 ([ETH Research Collection](https://doi.org/10.3929/ethz-b-000609802))
- Train-val dataset ([ETH Research Collection](https://doi.org/10.3929/ethz-b-000609845))
- Rasterized canopy top height models from airborne lidar ([Zenodo](https://doi.org/10.5281/zenodo.7885699))
- Trained model weights ([Github release](https://github.com/langnico/global-canopy-height-model/releases/download/v1.0-trained-model-weights/trained_models_GLOBAL_GEDI_2019_2020.zip))
- Demo data for example scripts ([Zenodo](https://doi.org/10.5281/zenodo.7885610))
- Sparse GEDI canopy top height data ([Zenodo](https://doi.org/10.5281/zenodo.7737946))
- ESA WorldCover 10 m 2020 v100 reprojected to Sentinel-2 tiles ([Zenodo](https://doi.org/10.5281/zenodo.7888150))

## Installation and credentials
Please follow the instructions in [INSTALL.md](INSTALL.md).

## Loading the model 

```python
from gchm.models.xception_sentinel2 import xceptionS2_08blocks_256
# load the model with random initialization
model = xceptionS2_08blocks_256()
```
Please see the [example notebook](gchm/notebooks/example_loading_pretrained_models.ipynb) on how to load the model with the trained weights. 

## Deploying

This is a demo how to run the trained ensemble to compute the canopy height map for a Sentinel-2 tile (approx. 100 km x 100 km).

### Preparation:
1. Download the demo data which contains Sentinel-2 images for one tile: 
    ```
    bash gchm/bash/download_demo_data.sh ./
    ```
   This creates the following directory:
    ```
    deploy_example/
    ├── ESAworldcover
    │   └── 2020
    │       └── sentinel2_tiles
    │           └── ESA_WorldCover_10m_2020_v100_32TMT.tif
    ├── image_paths
    │   └── 2020
    │       └── 32TMT.txt
    ├── image_paths_logs
    │   └── 2020
    ├── predictions_provided
    │   ├── 2020
    │   │   ├── S2A_MSIL2A_20200623T103031_N0214_R108_T32TMT_20200623T142851_predictions.tif
    │   │   ├── S2A_MSIL2A_20200623T103031_N0214_R108_T32TMT_20200623T142851_std.tif
    │   │   ├── ...
    │   ├── 2020_merge
    │   │   └── preds_inv_var_mean
    │   │       ├── 32TMT_pred.tif
    │   │       └── 32TMT_std.tif
    │   └── 2020_merge_logs
    │       └── preds_inv_var_mean
    │           └── 32TMT.txt
    ├── sentinel2
    │   └── 2020
    │       ├── S2A_MSIL2A_20200623T103031_N0214_R108_T32TMT_20200623T142851.zip
    │       ├── ...
    └── sentinel2_aws
        └── 2020
    ```
2. Download the trained model weights:
    ```
    bash gchm/bash/download_trained_models.sh ./trained_models
    ```

```

