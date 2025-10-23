# Contents
This repository contains three dataset:
## The file {ICS-River-edges.gpkg} contains the source data for Fig. 1, providing ICS of each reach of the SWORD river network for the years 2019 to 2024. The geospatial table also contains attributes about the six-year (2019-2024) trend with slope and intercept as well as the results of the Mann-Kendall trend test.\\
## The file {ICS-Hexagon.gpkg} contains the source data of Fig. 2 and 3 with hexagon aggregated intactness scores for the year 2024 and the number of threatened freshwater species based on IUCN's species red list.
## The file {Annotation.csv} contains the source data used for model training.

ICS-River-Edges.gpkg: Predicted Intactness scores aggregated for each reach of the SWORD river network. For each reach in the feature class, we have the following attributes: {reach_id}: SWORD's reach ID, reach averaged ICS from 2019 to 2024 (columns {ICS_2019}-{ICS_2024}), and their corresponding Uncertainty ({ICS_Uncert_2019}-{ICS_Uncert_2024}). Furthermore, for each reach, we report the ICS trend ({TREND}) and the percentage of change ({PERC_CHANGE}), {MK} stands for the Mann-Kendall test for the trend, {MKPVAL} stands for p-vlaue of the Mann-Kendall test.

ICS-Hexagon.gpkg: Hexagon averaged values of ICS for the year 2019 and 2024 with attributes: {ICS2019} and {ICS2024}, hexagon averaged trend values {AVG_TREND}, standard deviation of trend within each hexagon {STD_TREND}, count of reaches in each hexagon {COUNT_REACHES} and Number of threatened freshwater species ({NUM}).

Annotation.csv: Contains metadata for each sampled river site, including its location ({LAT}, {LON}), mean intactness level ({TRUESKILL_MEAN}), the standard deviation of intactness representing uncertainty ({TRUESKILL_STD}), and the image capture date ({DATE}).
