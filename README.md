# A river health model using crowd source data and Sentinel-2 images

This repository contains the code used to create the results presented in the paper: [Global contraction of intact river networks aligns with freshwater biodiversity loss].
Here, we developed a model to estimate river intact level. The model estimates river intactness level for every Sentinel-2 river image patches and was trained using citzen science annotation data as a reference.


## Installation and credentials
Please follow the instructions in [INSTALL.md](INSTALL.md).

## Loading the model 

```python
from gchm.models.xception_sentinel2 import xceptionS2_08blocks_256
# load the model with random initialization
model = xceptionS2_08blocks_256()
```


