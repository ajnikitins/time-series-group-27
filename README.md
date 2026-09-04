# State-Space Models for Temperature Dynamics and Spatial Forecasting

Time Series Analysis project, Bocconi University, 2025–2026.

This project applies **Hidden Markov Models (HMMs)** and **Dynamic Linear Models (DLMs)** to two related problems in temperature data:

1. identifying long-run changes in Northern Hemisphere temperature anomalies; and
2. evaluating whether spatial dependence across weather stations improves short-horizon temperature forecasts.

The analysis combines time-series decomposition, latent-state modelling, maximum-likelihood estimation, Kalman filtering and smoothing, spatial covariance modelling, and out-of-sample forecast evaluation.

**[Read the final report](Final_Project_Group_27.pdf)**

## Project overview

### 1. Long-run temperature dynamics — GISTEMP

The first part uses monthly Northern Hemisphere temperature anomalies from NASA GISTEMP.

After exploring and decomposing the series, we compare two approaches to representing long-run temperature dynamics:

- **Hidden Markov Models**, which approximate the evolution of temperatures using discrete latent regimes;
- **Dynamic Linear Models**, including random-walk and locally-linear-trend specifications, which represent the underlying temperature level as a continuously evolving latent state.

The analysis illustrates both the usefulness and limitations of discrete regime models for a process dominated by a persistent trend. The DLM specifications provide a more natural description of the continuous evolution of the latent temperature level, while the estimated slope dynamics provide little evidence for a separately identified stochastic acceleration process.

### 2. Spatial temperature forecasting — GHCN

The second part uses daily maximum temperatures from the Global Historical Climatology Network.

We model three US weather stations:

- Baker City, Oregon
- Paso Robles, California
- San Francisco, California

The three-station setup extends the baseline two-location exercise and provides variation between a relatively nearby pair and a substantially more distant station.

Four multivariate DLM specifications are compared:

1. **Independent** — station-level latent states evolve independently;
2. **Full covariance** — latent-state innovations have an unrestricted covariance matrix;
3. **Distance-based covariance** — dependence decays exponentially with geographic distance;
4. **Seasonal distance model** — the spatial model is augmented with a stochastic annual seasonal component.

Models are estimated by maximum likelihood on data through 2014 and evaluated using one-step-ahead forecasts from 2015 onward.

## Main findings

- The GISTEMP series is dominated by a persistent low-frequency increase in temperature anomalies. HMM regimes provide a useful discrete summary, but largely discretize an underlying continuous trend.
- In the weather-station application, allowing latent temperature innovations to co-move substantially improves the modelling of the joint predictive distribution.
- The unrestricted covariance model provides the best empirical fit and leaves considerably less residual cross-station dependence.
- Spatial dependence produces only very small improvements in individual-station point forecasts: MAE and RMSFE remain similar across specifications.
- The distance-decay model sacrifices some fit relative to an unrestricted covariance matrix but provides a parsimonious and geographically interpretable dependence structure.
- Adding stochastic seasonality produces little improvement over deterministic seasonal adjustment in this application.

## Methods

The project uses:

- state-space models and Kalman filtering/smoothing
- Hidden Markov Models
- multivariate Dynamic Linear Models
- maximum-likelihood estimation
- Cholesky parametrization of covariance matrices
- spatial covariance functions
- delta-method uncertainty estimates
- out-of-sample forecast evaluation
- probabilistic forecast diagnostics
- residual autocorrelation and cross-sectional dependence diagnostics

The analysis is implemented in **R**, primarily using `dlm`, `depmixS4`, and the tidyverse ecosystem.

## Repository structure

~~~text
.
├── Final_Project_Group_27.pdf          # Final report
├── Final_Project_Group_27.tex          # Final report source
├── Final_Project_Part_1_Group_27.rmd   # GISTEMP / HMM / univariate DLM analysis
├── Final_Project_Part_2_Group_27.rmd   # Multivariate and spatial DLM analysis
├── data/
│   ├── gistemp.csv
│   └── ghcn.txt
└── models/                             # Cached maximum-likelihood model fits
~~~

## Reproducibility

The repository uses [`renv`](https://rstudio.github.io/renv/) to record the R package environment.

After cloning the repository, restore the package environment with:

~~~r
renv::restore()
~~~

The two R Markdown files contain the full analysis used to generate the figures, tables, and numerical results in the final report.

Some multivariate DLM specifications are relatively expensive to estimate. Pre-estimated model objects are therefore retained under `models/` for convenient reproduction. The models can also be re-estimated from the source code.

## Data

The project uses two datasets supplied for the course project:

- **GISS Surface Temperature Analysis (GISTEMP), version 4**, NASA Goddard Institute for Space Studies;
- **Global Historical Climatology Network – Daily (GHCN-Daily)**, NOAA.

The copies used for the analysis are included under `data/`.

## Authors

This was a group project by:

- Artūrs Jānis Ņikitins
- Emanuele Artoni
- Anna-Bella Dreyfus
- Madelief van Weerdenburg
