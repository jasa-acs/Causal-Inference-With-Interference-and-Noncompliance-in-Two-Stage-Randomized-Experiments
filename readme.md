# Causal Inference With Interference and Noncompliance in Two-Stage Randomized Experiments

# Author Contributions Checklist Form

## Data

### Abstract
 The data set is a subset of the data from the randomized evaluation of the India's National Health Insurance Program (RSBY).  

### Availability

The data will be made publicly available along with the necessary computer code upon publication.

### Description

We provide the data file india.csv, which contains the following variables: village id (village_id), district id (DistrictId), treatment status (treat), treatment assignment mechanism (mech), enrollment (enrolled), hospital expenditure (EXPhosp_1)


## Code

### Abstract

All of the data processing and analysis for this paper were done in R 3.6.2. We provide the R code that is necessary for the replication of our empirical results. 

### Description

We provide the R code, india_analysis.R, that can be used to reproduce our empirical results. 

## Instructions for use

### Reproducibility

The proposed methods require the following R software packages:
 
1. experiment, version: 1.1-4, which relies on packages boot (version 1.3.23) and MASS (version 7.3.51.4).
2. plyr,  version 1.8.5
3. AER, version 1.2.9

All the packages are available at CRAN. 

The file ``india_analysis.R’’ generates all the numbers in Tables 2, A1 and A2. It takes as input: india.csv. The user time is 16.053 on a laptop with 2.3 GHz Intel Core i5.
